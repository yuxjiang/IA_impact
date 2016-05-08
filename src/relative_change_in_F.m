function [f] = relative_change_in_F(pr, rc, p)
%RELATIVE_CHANGE_IN_F Relative change in F
%
%   [f] = ABSOLUTE_CHANGE_IN_F(pr, rc, p);
%
%       Returns Delta(F)/F given precision, recall and p.
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
%   f:      relative change in F1-measure
%
% -------------
% Yuxiang Jiang
% School of Informatics and Computing
% Indiana University Bloomington
% Last modified: Fri 21 Mar 2014 04:14:56 PM EDT

    F = 2 .* pr .* rc ./ (pr + rc);

    X = F .* p;
    f = (2 .* X .* rc - X .* F) ./ (2 .* rc + X) ./ F;
return
