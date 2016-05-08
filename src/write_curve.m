function [] = write_curve(fid, curve)
%WRITE_CURVE Write curve
%
%   WRITE_CURVE(fid, curve);
%
%       Write out a curve to a data file.
%
% Input
% -----
%   fid:    file descriptor.
%
%   curve:  n-by-2 matrix
%
% Output
% ------
%   None.
%
% -------------
% Yuxiang Jiang
% School of Informatics and Computing
% Indiana University Bloomington
% Last modified: Tue 18 Mar 2014 09:31:07 PM EDT

    for i = 1 : size(curve, 1)
        fprintf(fid, '%f\t%f\n', curve(i,1), curve(i,2));
    end
return
