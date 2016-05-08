function [y] = sigdigit(x, sig)
% SIGDIGIT Significant digits
%
%   [y] = SIGDIGIT(x, sig);
%
%       trim off the remainder after three significant digits.
%
% Input
% -----
%   x:      double values
%
%   sig:    number of significant digits, default: 3
%
% Output
% ------
%   y:      trimed double values
%
% -------------
% Yuxiang Jiang
% School of Informatics and Computing
% Indiana University Bloomington
% Last modified: Thu 03 Apr 2014 11:22:50 AM EDT

    if ~exist('sig', 'var')
        sig = 3;
    end

    % checking
    if sig < 0
        error('sigdigit:inputerr', '''sig'' must be greater than 0.');
    end

    f = 10 .^ floor(log10(abs(x)) - (sig - 1));
    y = round(x ./ f) .* f;
return
