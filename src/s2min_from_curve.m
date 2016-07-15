function [smin] = s2min_from_curve(curve)
%S2MIN_FROM_CURVE Semantic distance mininum from curve
%
% [smin] = S2MIN_FROM_CURVE(curve);
%
%   Returns the minimum semantic (order 2) distance of a RU-MI curve.
%
% Note
% ----
% RU  - remaining uncertainty.
% MI  - misinformation.
%
% Input
% -----
% [double]
% curve:  A k-by-2 RU-MI matrix (i.e. a curve)
%
% Output
% ------
% [double]
% smin:   The minimum semantic distance.

  % check inputs {{{
  if nargin ~= 1
    error('s2min_from_curve:InputCount', 'Expected 1 input.');
  end

  % curve
  validateattributes(curve, {'double'}, {'ncols', 2}, '', 'curve', 1);
  % }}}

  % sanity check {{{
  if any(all(isnan(curve), 1))
    smin  = NaN;
    return;
  end
  % }}}

  % calculation {{{
  RU   = curve(:, 1);
  MI   = curve(:, 2);
  smin = sqrt(min(RU .^ 2 + MI .^ 2));
  % }}}
return

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University Bloomington
% Last modified: Thu 14 Jul 2016 05:37:23 PM E
