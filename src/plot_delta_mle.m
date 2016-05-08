function [] = plot_delta_mle(delta1, delta2, delta3, t)
%
% Input:
%   delta1:     observation of delta in one year span
%
%   delta2:     observation of delta in two years span
%
%   delta3:     observation of delta in three years span
%
%   t:          plot title
%
% -------------
% Yuxiang Jiang
% School of Informatics and Computing
% Indiana University Bloomington
% Last modified: Thu 13 Feb 2014 10:55:46 AM EST

    if nargin == 3
        t = 'MLE (exponential) of incomplete annotation';
    end

    % mle (distribution = exponential)
    lambda1 = 1 / mean(delta1);
    lambda2 = 1 / mean(delta2);
    lambda3 = 1 / mean(delta3);

    pdf = @(x, lambda) lambda * exp(-lambda * x);
    [h1, c1] = hist(delta1, 100);
    [h2, c2] = hist(delta2, 100);
    [h3, c3] = hist(delta3, 100);

    f1 = pdf(c1, lambda1);
    f2 = pdf(c2, lambda2);
    f3 = pdf(c3, lambda3);

    h1 = h1 ./ sum(h1) .* sum(f1);
    h2 = h2 ./ sum(h2) .* sum(f2);
    h3 = h3 ./ sum(h3) .* sum(f3);

    xmin = min([c1 c2 c3]);
    xmax = max([c1 c2 c3]);
    h = [h1 h2 h3];
    h(h == 0) = [];
    ymin = min(h);
    ymax = max([h1 h2 h3]);

    col1 = [.5 .5 .9];
    col2 = [.5 .9 .5];
    col3 = [.9 .5 .5];

    figure; grid on;
    semilogy(c1, h1, 'o-', 'color', col1);
    hold on;
    semilogy(c2, h2, '+-', 'color', col2);
    semilogy(c3, h3, 's-', 'color', col3);
    axis([xmin xmax ymin ymax]);

    legend('1 year layer', '2 years later', '3 years later');
    semilogy(c1, f1, '--', 'color', col1 - 0.2, 'LineWidth', 2);
    semilogy(c2, f2, '--', 'color', col2 - 0.2, 'LineWidth', 2);
    semilogy(c3, f3, '--', 'color', col3 - 0.2, 'LineWidth', 2);

    title(t);
    xlabel('size of incomplete annotation (\delta)');
    ylabel('density');
    hold off;
return
