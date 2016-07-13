function [] = write_curve(fid, curve)
%WRITE_CURVE Write curve
%
% [] = WRITE_CURVE(fid, curve);
%
%   Writes out a curve to a data file.
%
% Input
% -----
% fid:    file descriptor.
%
% curve:  n-by-2 matrix
%
% Output
% ------
%   None.

  for i = 1 : size(curve, 1)
    fprintf(fid, '%f\t%f\n', curve(i,1), curve(i,2));
  end
return

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Mon 11 Jul 2016 02:55:15 PM E
