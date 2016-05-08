function [] = absolute_change_in_F_contour(p, filename)
%ABSOLUTE_CHANGE_IN_F_CONTOUR Absolute change in F contour
%
%   ABSOLUTE_CHANGE_IN_F_CONTOUR(p, filename);
%
%       Contour plot of absolute change in F with p,
%       by assuming recall remains the same.
%
% Input
% -----
%   p:          ratio of delta / gamma
%
%   filename:   output file name
%
% Output
% ------
%   None.
%
% -------------
% Yuxiang Jiang
% School of Informatics and Computing
% Indiana University Bloomington
% Last modified: Mon 10 Mar 2014 02:00:39 PM EDT

    [pr, rc] = meshgrid(.01:.01:.99, .01:.01:.99);

    f = zeros(size(pr));

    for i = 1 : size(f, 1)
        for j = 1 : size(f, 2)
            f(i,j) = absolute_change_in_F(pr(i,j), rc(i,j), p);
        end
    end

    % plot precision aginst recall
    figure;
    hold on;
    %contour(rc, pr, f, 'ShowText', 'on');
    mesh(rc, pr, f);
    grid on;
    axis([0, 1, 0, 1]);

    xlabel('Recall');
    ylabel('Precision');

    % convert matlab plots to tikz commands
    %matlab2tikz(filename, 'width', '\figurewidth', 'height', '\figureheight');
return
