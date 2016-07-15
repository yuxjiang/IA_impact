function [y] = sigdigit(x, sig)
%SIGDIGIT Significant digits
%
% [y] = SIGDIGIT(x, sig);
%
%   Trims off the remainder after three significant digits.
%
% Input
% -----
% (required)
% [double]
% x:    A double values
%
% (optional)
% [double]
% sig:  The number of significant digits.
%       default: 3
%
% Output
% ------
% [double]
% y:  The trimed double values.

  % check inputs {{{
  if nargin ~=1 && nargin ~=2
    error('sigdigit:InputCount', 'Expected 1 or 2 inputs.');
  end

  if nargin == 1
    sig = 3;
  end

  % x
  validateattributes(x, {'double'}, {'nonempty'}, '', 'x', 2);

  % sig
  validateattributes(sig, {'double'}, {'>=', 0, 'integer'}, '', 'sig', 3);
  % }}}

  % rounding {{{
  f = 10 .^ floor(log10(abs(x)) - (sig - 1));
  y = round(x ./ f) .* f;
  % }}}
return

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Thu 14 Jul 2016 05:24:30 PM E
