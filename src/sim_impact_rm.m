function [Dabs, Drel] = sim_impact_rm(ru_max, mi_max, resol, N, g, d, k, ofile)
%SIM_IMPACT_RM Incomplete annotation impact on RU-MI
%
% [Dabs, Drel] = SIM_IMPACT_RM(ru_max, mi_max, resol, N, g, d, k, ofile);
%
%   Simulates IA impact by a specific level of incompleteness. (d / g)
%
% Note
% ----
% This function estimates probability density of gamma and delta using
% histograms.
% gamma: number of annotated terms
% delta: number of incomplete annotation
% We assume that gamma and delta are independent upon each other.
%
% Given a predictor with its performance (ru, mi), and incomplete annotation
% size delta, we assume the ratio on delta.
%
%              beta       gamma - ru
% lambda = ------------ = ----------  (should remain the same)
%          alpha + beta     gamma
%
% or expected to be on the same level if some randomness is added.  In
% particular, we assume
%
% lambda ~ Beta(gamma-ru, ru)
%
% Note that the Expectation of lambda is 
%
%             gamma - ru
% E[lambda] = ----------
%               gamma
%
% [Dabs, Drel] = SIM_IMPACT_RM(ru_max, mi_max, resol, N, obs_g, obs_d, k, ofile);
%
%   The incompleteness is sampled from the given data.
%       
% Input
% -----
% [double]
% ru_max: The maximum value of RU.
%
% [double]
% mi_max: The maximum value of MI.
%
% [double]
% resol:  A 1-by-2 double integer vector specifies the resolution of
%         RU-MI plane: [0,1]x[0,1] [m, n] means equally dividing
%         'misinformation' into m bands and 'remaining uncertainty' into n
%         bands.
%
% [double]
% N:      The number of simulations (number of proteins).
%
% [double]
% g:      Gamma, information accretion of annotated terms.
%         If the given g is a scalar, then it's fixed for every simulated
%         instance.
%         If its a vector, then it will be treated as an observation of gamma,
%         and for each simulated instance, a different gamma will be drawn from
%         an estimated distribution.
%
% [double]
% d:      Delta, information accretion of incomplete annotations can be either a
%         scalar or a vector, similar to g.
%         Note: gamma (g) and delta (d) are assumed to be independent.
%
% [double]
% k:      The ratio of expected lambda / ((gamma - ru) / ru)
%
% [char]
% ofile:  The full path of output data, for example, if the given 'ofile' is
%         /path/to/file.dat the output will be 
%         /path/to/abs_file.dat and
%         /path/to/rel_file.dat
%
% Output
% ------
% [double]
% Dabs: An m-by-n matrix, estimated absolute changes in S2-distance at each
%       position (box) of ru-mi plane
%       Dabs(i, j) is the average absolute difference for a predictor having
%       (pr, rc) roughly as
%
%       (pr, rc) = ((i-1/2)/m, (j-1/2)/n)
%
% [double]
% Drel: An m-by-n matrix, estimated relative changes in S2-measure at each
%       position (box) of RU-MI plane.

  % check inputs {{{
  if nargin ~= 8
    error('sim_impact_rm:InputCount', 'Expected 8 inputs.');
  end

  % ru_max
  validateattributes(ru_max, {'double'}, {'nonempty'}, '', 'ru_max', 1);

  % mi_max
  validateattributes(mi_max, {'double'}, {'nonempty'}, '', 'mi_max', 2);

  % resol
  validateattributes(resol, {'double'}, {'numel', 2, 'integer'}, '', 'resol', 3);
  m = resol(1);
  n = resol(2);

  % N
  validateattributes(N, {'double'}, {'positive', 'integer'}, '', 'N', 4);

  % g
  validateattributes(g, {'double'}, {'nonempty'}, '', 'g', 5);

  % d
  validateattributes(d, {'double'}, {'nonempty'}, '', 'd', 6);

  % k
  validateattributes(k, {'double'}, {'>=', 0, '<=', 1}, '', 'k', 7);

  % ofile
  validateattributes(ofile, {'char'}, {'nonempty'}, '', 'ofile', 8);
  [pstr, fstr, estr] = fileparts(ofile);
  fid0 = fopen([pstr, '/abs_', fstr, estr], 'w');
  fid1 = fopen([pstr, '/rel_', fstr, estr], 'w');
  % }}}

  % pick bin width (bandwidth) {{{
  if numel(g) > 1
    bw_g = round(1.06 * std(g) * numel(g)^(-0.2));
    [~, ctr_g] = hist(g, round(max(g) / bw_g));
  end

  if numel(d) > 1
    bw_d = round(1.06 * std(d) * numel(d)^(-0.2));
    [~, ctr_d] = hist(d, round(max(d) / bw_d));
  end
  % }}}

  % simulation {{{
  Dabs = zeros(resol);
  Drel = zeros(resol);
  for i = 1 : resol(1)
    for j = 1 : resol(2)
      % resol = [m, n]
      % MI range: [(i-1)/m, i/m] * mi_max
      % RU range: [(j-1)/n, j/n] * ru_max
      % generate N pairs of (pr, rc) uniformly
      mi = (rand(N, 1)./resol(1) + (i-1)/resol(1)) * mi_max;
      ru = (rand(N, 1)./resol(2) + (j-1)/resol(2)) * ru_max;

      % generate gamma, delta independently
      if numel(g) > 1
        gamma = generate_sample(N, g, ctr_g, bw_g);
      else
        gamma = repmat(g, N, 1);
      end

      if numel(d) > 1
        delta = generate_sample(N, d, ctr_d, bw_d);
      else
        delta = repmat(d, N, 1);
      end

      % generate beta, alpha
      lambda = arrayfun(@(alpha, beta) betarnd(alpha, beta), k * (gamma - ru), ru);

      beta  = delta .* lambda;
      alpha = delta - beta;

      forbid = isnan(lambda);
      if all(forbid)
        Dabs(i, j) = NaN;
        Drel(i, j) = NaN;
        continue;
      end

      % calculate impact in delta(S2)
      S2 = sqrt(ru.^2 + mi.^2);

      S2new = sqrt((ru + alpha).^2 + (mi - beta).^2);

      diff  = S2new - S2;
      ratio = diff ./ S2;

      Dabs(i, j) = mean(diff(~forbid));
      Drel(i, j) = mean(ratio(~forbid));
    end
  end
  % }}}

  % draw {{{
  [ru, mi] = meshgrid(((.5/n):(1/n):1) * ru_max, ((.5/m):(1/m):1) * mi_max);
  figure;
  %contour(ru, mi, Dabs, 'ShowText', 'on');
  surf(ru, mi, Dabs);
  xlabel('Remaining uncertainty');
  ylabel('Misinformation');
  grid on;
  axis([0, ru_max, 0, mi_max]);
  % }}}

  % output to data files {{{
  for j = 1 : resol(2)
    ru = (2*j-1) * ru_max / 2 / n;
    for i = 1 : resol(1)
      mi = (2*i-1) * mi_max / 2 / m;
      fprintf(fid0, '%f %f %f\n', ru, mi, Dabs(i, j));
      fprintf(fid1, '%f %f %f\n', ru, mi, Drel(i, j));
    end
    fprintf(fid0, '\n');
    fprintf(fid1, '\n');
  end
  fclose(fid0);
  fclose(fid1);
  % }}}
return

% function: loc_generate_sample {{{
function [sample] = generate_sample(N, obs, ctr, bw)
% draw samples from histogram density estimate
% N     - how many sample you want to draw
% obs   - n observations
% ctr   - bin centers
% bw    - bin width (bandwidth)

  % uniformly pick one of n points
  i = randi(numel(obs), N, 1); 

  % locate bin
  [~, idx] = min(abs(bsxfun(@minus, reshape(obs(i), 1, []), reshape(ctr, [], 1))));

  base = reshape(ctr(idx) - bw/2, [], 1);
  sample = rand(N, 1) * bw + base;
return
% }}}

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Tue 12 Jul 2016 05:19:57 PM E
