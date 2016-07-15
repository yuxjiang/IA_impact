function [fmax] = f1max_from_curve(curve)
%F1MAX_FROM_CURVE F1-measure maximum from curve
%
% [fmax] = F1MAX_FROM_CURVE(curve);
%
%   Returns the maximum F1-measure of a precision-recall curve.
%
% Input
% -----
% [double]
% curve:  A k-by-2 precision-recall matrix (i.e. a curve).
%
% Output
% ------
% [double]
% fmax:   The F_{beta}-max.

  % check inputs {{{
  if nargin ~= 1
    error('f1max_from_curve:InputCount', 'Expected 1 input.');
  end

  % curve
  validateattributes(curve, {'double'}, {'ncols', 2}, '', 'curve', 1);
  % }}}

  % sanity check {{{
  if any(all(isnan(curve), 1))
    fmax  = NaN;
    return;
  end
  % }}}

  % calculation {{{
  pr   = curve(:, 1);
  rc   = curve(:, 2);
  fmax = max(2 .* pr .* rc ./ (pr + rc));
  % }}}
return

% -----------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University Bloomington
% Last modified: Thu 14 Jul 2016 05:37:27 PM E
