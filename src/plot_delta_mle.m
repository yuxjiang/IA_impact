function [] = plot_delta_mle(pfile, pttl, delta1, delta2, delta3)
%PLOT_DELTA_MLE Plot delta MLE
%
% Input
% -----
% [char]
% pfile:  The filename of the plot.
%         Note that file extension must be either 'eps' or 'png'.
%         default: 'png'
%
% [char]
% pttl:   The plot title. If the title is given as empty, it will be set to
%         'MLE (exponential) of incomplete annotation'
%
% [double]
% delta1: The observation of delta in one year span
%
% [double]
% delta2: The observation of delta in two years span
%
% [double]
% delta3: The observation of delta in three years span
%
% Output
% ------
% None.
%
% Dependency
% ----------
%[>]embed_canvas.m
%[>]pfp_rgby.m

  % check inputs {{{
  if nargin ~= 5
    error('plot_delta_mle:InputCount', 'Expected 5 inputs.');
  end

  % pfile
  validateattributes(pfile, {'char'}, {'nonempty'}, '', 'pfile', 1);
  [p, f, e] = fileparts(pfile);
  if isempty(e)
    e = '.png';
  end
  ext = validatestring(e, {'.eps', '.png'}, '', 'pfile', 1);
  if strcmp(ext, '.eps')
    device_op = '-depsc';
  elseif strcmp(ext, '.png')
    device_op = '-dpng';
  end

  % pttl
  validateattributes(pttl, {'char'}, {}, '', 'pttl', 2);
  if isempty(pttl)
    pttl = 'MLE (exponential) of incomplete annotation';
  end

  % delta1
  validateattributes(delta1, {'double'}, {'nonempty'}, '', 'delta1', 3);

  % delta2
  validateattributes(delta2, {'double'}, {'nonempty'}, '', 'delta2', 4);

  % delta3
  validateattributes(delta3, {'double'}, {'nonempty'}, '', 'delta3', 5);
  % }}}

  % estimate {{{
  % mle (distribution = exponential)
  lambda1 = 1 / mean(delta1);
  lambda2 = 1 / mean(delta2);
  lambda3 = 1 / mean(delta3);

  pdf = @(x, lambda) lambda * exp(-lambda * x);
  [h1, c1] = hist(delta1, 100);
  [h2, c2] = hist(delta2, 100);
  [h3, c3] = hist(delta3, 100);

  f1 = pdf(c1, lambda1);
  f2 = pdf(c2, lambda2);
  f3 = pdf(c3, lambda3);

  h1 = h1 ./ sum(h1) .* sum(f1);
  h2 = h2 ./ sum(h2) .* sum(f2);
  h3 = h3 ./ sum(h3) .* sum(f3);
  % }}}

  % setting {{{
  xmin = min([c1 c2 c3]);
  xmax = max([c1 c2 c3]);
  h = [h1 h2 h3];
  h(h == 0) = [];
  ymin = min(h);
  ymax = max([h1 h2 h3]);

  [col1, col2, col3, ~] = pfp_rgby;
  % }}}

  % plot {{{
  h = figure('Visible', 'off');
  grid on;
  hold on;
  semilogy(c1, h1, 'o-', 'color', mean([col1;1,1,1]));
  semilogy(c2, h2, '+-', 'color', mean([col2;1,1,1]));
  semilogy(c3, h3, 's-', 'color', mean([col3;1,1,1]));
  axis([xmin xmax ymin ymax]);

  legend('1 year later', '2 years later', '3 years later');
  semilogy(c1, f1, '--', 'color', col1, 'LineWidth', 2);
  semilogy(c2, f2, '--', 'color', col2, 'LineWidth', 2);
  semilogy(c3, f3, '--', 'color', col3, 'LineWidth', 2);

  title(pttl);
  xlabel('size of incomplete annotation (\delta)');
  ylabel('density');

  print(embed_canvas(h, 6, 5), pfile, device_op, '-r300');
  close;
  % }}}
return

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Wed 13 Jul 2016 04:07:19 PM E
