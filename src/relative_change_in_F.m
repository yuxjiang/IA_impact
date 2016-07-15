function [f] = relative_change_in_F(pr, rc, p)
%RELATIVE_CHANGE_IN_F Relative change in F
%
% [f] = ABSOLUTE_CHANGE_IN_F(pr, rc, p);
%
%   Returns Delta(F)/F given precision, recall and p.
%
% Input
% -----
% [double]
% pr: original precision [0, 1]
%
% [double]
% rc: original recall [0, 1]
%
% [double]
% p:  delta / gamma
%
% Output
% ------
% [double]
% f:  The relative change in F1-measure

  % check inputs {{{
  if nargin ~= 3
    error('relative_change_in_F:InputCount', 'Expected 3 inputs.');
  end

  % pr
  validateattributes(pr, {'double'}, {'>=', 0, '<=', 1}, '', 'pr', 1);

  % rc
  validateattributes(rc, {'double'}, {'>=', 0, '<=', 1}, '', 'rc', 2);

  % p
  validateattributes(p, {'double'}, {'nonempty'}, '', 'p', 3);
  % }}}

  % calculation {{{
  F = 2 .* pr .* rc ./ (pr + rc);
  X = F .* p;
  f = (2 .* X .* rc - X .* F) ./ (2 .* rc + X) ./ F;
  % }}}
return

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Wed 13 Jul 2016 02:21:57 PM E
