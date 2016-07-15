function [] = absolute_change_in_F_contour(pfile, pttl, ratio)
%ABSOLUTE_CHANGE_IN_F_CONTOUR Absolute change in F contour
%
% ABSOLUTE_CHANGE_IN_F_CONTOUR(pfile, pttl, ratio);
%
%   Makes a contour plot of absolute change in F with ratio, by assuming recall
%   remains the same.
%
% Input
% -----
% [char]
% pfile:  The filename of the plot.
%         Note that file extension must be either 'eps' or 'png'.
%         default: 'png'
%
% [char]
% pttl:   The plot title.
%
% [double]
% ratio:  The ratio of delta / gamma.
%
% Output
% ------
% None.
%
% Dependency
% ----------
%[>]absolute_change_in_F.m

  % check inputs {{{
  if nargin ~= 3
    error('absolute_change_in_F_contour:InputCount', 'Expected 3 inputs.');
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

  % ratio
  validateattributes(ratio, {'double'}, {'nonempty'}, '', 'ratio', 1);
  % }}}

  % compute change in F {{{
  [pr, rc] = meshgrid(.01:.01:.99, .01:.01:.99);

  f = zeros(size(pr));
  for i = 1 : size(f, 1)
    for j = 1 : size(f, 2)
      f(i,j) = absolute_change_in_F(pr(i,j), rc(i,j), ratio);
    end
  end
  % }}}

  % plot precision aginst recall {{{
  h = figure('Visible', 'off');
  hold on;
  %contour(rc, pr, f, 'ShowText', 'on');
  mesh(rc, pr, f);
  grid on;
  axis([0, 1, 0, 1]);

  xlabel('Recall');
  ylabel('Precision');

  print(embed_canvas(h, 6, 6), pfile, device_op, '-r300');
  close;
  % }}}
return

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Wed 13 Jul 2016 02:46:45 PM E
