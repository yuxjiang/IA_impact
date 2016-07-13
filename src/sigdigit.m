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
  if nargin ~=2 && nargin ~=3
    error('sigdigit:InputCount', 'Expected 2 or 3 inputs.');
  end

  if nargin == 2
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
% Last modified: Mon 11 Jul 2016 02:54:29 PM E
