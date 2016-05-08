function [Dabs, Drel] = sim_impact_pr(resol, N, g, d, k, filename)
%SIM_IMPACT_PR Incomplete annotation impact on Precision-Recall
%
%   [Dabs, Drel] = SIM_IMPACT_PR(resol, N, g, d, k, filename);
%
%       Simulation of IA Impact by a specific level of 
%       incompleteness. (d / g)
%
%       Note:
%
%       Given a predictor with its performance (pr, rc), and
%       incomplete annotation size delta, we assume its TP 
%       on delta (aka beta) follows a Binomial distribution. 
%
%       beta ~ Bin(delta, k * rc)
%
%   [Dabs, Drel] = SIM_IMPACT_PR(resol, N, obs_g, obs_d, k, filename);
%
%       The incompleteness is sampled from the given data.
%       
% Input
% -----
%   resol:      resolution of Precision-Recall plane: [0,1] x [0,1]
%               [m, n] means equally dividing `precision' into m bands
%               and `recall' into n bands.
%
%   N:          number of simulations (number of proteins)
%
%   g:          gamma, number of annotations.
%               if the given g is a scalar, then it's fixed for every
%               simulated instance.
%               if its a vector, then it will be treated as an observation
%               of gamma, and for each simulated instance, a different
%               gamma will be drawn from an estimated distribution.
%
%   d:          delta, number of incomplete annotations.
%               can be either a scalar or a vector, similar to g
%
%               Note: gamma (g) and delta (d) are assumed to be independent.
%
%   k:          the ratio of expected rc_delta / rc
%
%   filename:   full path of output data
%               say if the given `filename' is /path/to/file.dat
%               the output will be 
%               /path/to/abs_file.dat and
%               /path/to/rel_file.dat
%
% Output
% ------
%   Dabs:       m-by-n matrix, estimated absolute changes in F1-measure
%               at each position (box) of Precision-Recall plane.
%               Dabs(i, j) is the average absolute difference for a 
%               predictor having (pr, rc) roughly as
%
%               (pr, rc) = ((i-1/2)/m, (j-1/2)/n)
%
%   Drel:       m-by-n matrix, estimated relative changes in F1-measure
%               at each position (box) of Precision-Recall plane.
%
% -------------
% Yuxiang Jiang
% School of Informatics and Computing
% Indiana University Bloomington
% Last modified: Sat 05 Apr 2014 11:25:18 PM EDT

    [pstr, fstr, estr] = fileparts(filename);
    fid0 = fopen([pstr, '/abs_', fstr, estr], 'w');
    fid1 = fopen([pstr, '/rel_', fstr, estr], 'w');

    m = resol(1);
    n = resol(2);

    Dabs = zeros(resol);
    Drel = zeros(resol);

    % estimate probability density of gamma and delta using histograms
    % gamma: number of annotated terms
    % delta: number of incomplete annotation
    % We assume that gamma and delta are independent upon each other

    % pick bin width (bandwidth)
    if numel(g) > 1
        bw_g = round(1.06 * std(g) * numel(g)^(-0.2));
        [~, ctr_g] = hist(g, round(max(g) / bw_g));
    end

    if numel(d) > 1
        bw_d = round(1.06 * std(d) * numel(d)^(-0.2));
        [~, ctr_d] = hist(d, round(max(d) / bw_d));
    end


    for i = 1 : resol(1)
        for j = 1 : resol(2)
            % resol = [m, n]
            % Precision range: [(i-1)/m, i/m]
            % Recall range:    [(j-1)/n, j/n]
            % generate N pairs of (pr, rc) uniformly
            pr = rand(N, 1)./resol(1) + (i-1)/resol(1);
            rc = rand(N, 1)./resol(2) + (j-1)/resol(2);

            % generate gamma, delta independently
            if numel(g) > 1
                gamma = generate_sample(N, g, ctr_g, bw_g);
            else
                gamma = repmat(g, N, 1);
            end

            if numel(d) > 1
                delta = generate_sample(N, d, ctr_d, bw_d);
            else
                delta = repmat(d, N, 1);
            end

            tp = max(round(gamma .* rc), 1); % set at least one true positive
            fn = gamma - tp;
            fp = round(tp .* (1 - pr) ./ pr);

            % generate tp on delta (beta)
            beta = arrayfun(@(n, p) binornd(n, p), delta, k * rc);

            % `beta' cannot exceed the original `fp'
            forbid = beta > fp;
            if all(forbid)
                Dabs(i, j) = NaN;
                Drel(i, j) = NaN;
                continue;
            end

            % calculate impact in delta(F1)
            c = 2 .* tp + fn + fp;
            F1 = 2 .* tp ./ c;
            F1new = 2 .* (tp + beta) ./ (c + delta);

            diff  = F1new - F1;
            ratio = diff ./ F1;
            Dabs(i, j) = mean(diff(~forbid));
            Drel(i, j) = mean(ratio(~forbid));
        end
    end

    [rc, pr] = meshgrid((.5/n):(1/n):1, (.5/m):(1/m):1);
    figure;
    contour(rc, pr, Dabs, 'ShowText', 'on');
    xlabel('Recall');
    ylabel('Precision');
    grid on;
    axis([0, 1, 0, 1]);

    % output to data files
    for j = 1 : resol(2)
        rc = (2*j-1) / 2 / n;
        for i = 1 : resol(1)
            pr = (2*i-1) / 2 / m;
            fprintf(fid0, '%f %f %f\n', rc, pr, Dabs(i,j));
            fprintf(fid1, '%f %f %f\n', rc, pr, Drel(i,j));
        end
        fprintf(fid0, '\n');
        fprintf(fid1, '\n');
    end
    fclose(fid0);
    fclose(fid1);
return

function [sample] = generate_sample(N, obs, ctr, bw)
% draw samples from histogram density estimate
% N     - how many sample you want to draw
% obs   - n observations
% ctr   - bin centers
% bw    - bin width (bandwidth)

    % uniformly pick one of n points
    i = randi(numel(obs), N, 1); 

    % locate bin
    [~, idx] = min(abs(bsxfun(@minus, reshape(obs(i), 1, []), reshape(ctr, [], 1))));

    base = reshape(ctr(idx) - bw/2, [], 1);
    sample = round(rand(N, 1) * bw + base);
return