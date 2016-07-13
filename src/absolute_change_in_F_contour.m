function [] = absolute_change_in_F_contour(p)
%ABSOLUTE_CHANGE_IN_F_CONTOUR Absolute change in F contour
%
% ABSOLUTE_CHANGE_IN_F_CONTOUR(p, ofile);
%
%   Makes a contour plot of absolute change in F with p, by assuming recall
%   remains the same.
%
% Input
% -----
% [double]
% p:      The ratio of delta / gamma.
%
% [char]
% ofile:  The output file name.
%
% Output
% ------
% None.
%
% Dependency
% ----------
%[>]absolute_change_in_F.m

  % check inputs {{{
  if nargin ~= 1
    error('absolute_change_in_F_contour:InputCount', 'Expected 1 input.');
  end

  % p
  validateattributes(p, {'double'}, {'nonempty'}, '', 'p', 1);
  % }}}

  % compute change in F {{{
  [pr, rc] = meshgrid(.01:.01:.99, .01:.01:.99);

  f = zeros(size(pr));

  for i = 1 : size(f, 1)
    for j = 1 : size(f, 2)
      f(i,j) = absolute_change_in_F(pr(i,j), rc(i,j), p);
    end
  end
  % }}}

  % plot precision aginst recall {{{
  figure;
  hold on;
  %contour(rc, pr, f, 'ShowText', 'on');
  mesh(rc, pr, f);
  grid on;
  axis([0, 1, 0, 1]);

  xlabel('Recall');
  ylabel('Precision');

  % convert matlab plots to tikz commands
  % matlab2tikz(ofile, 'width', '\figurewidth', 'height', '\figureheight');
  % }}}
return

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Wed 13 Jul 2016 01:29:22 PM E
