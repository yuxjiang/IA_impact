function [f] = absolute_change_in_F(pr, rc, p)
%ABSOLUTE_CHANGE_IN_F Absolute change in F
%
%   [f] = ABSOLUTE_CHANGE_IN_F(pr, rc, p);
%
%       Returns Delta(F) given precision, recall and p.
%
% Input
% -----
%   pr:     original precision [0, 1]
%
%   rc:     original recall [0, 1]
%
%   p:      delta / gamma
%
% Output
% ------
%   f:      absolute change in F1-measure
%
% -------------
% Yuxiang Jiang
% School of Informatics and Computing
% Indiana University Bloomington
% Last modified: Sun 09 Mar 2014 09:59:41 PM EDT

    F = 2 .* pr .* rc ./ (pr + rc);

    X = F .* p;
    f = (2 .* X .* rc - X .* F) ./ (2 .* rc + X);
return
