%% unfinished !
function [rc_delta, rc] = recall_on_delta(pred, tarlist, oa0, oa1)
%
%   Calculates the original recall and the recall on delta (new annotations)
%   corresponding to F1-max.
%
% Input
% -----
%   pred:       the prediction structure
%
%   tarlist:    target protein ID list
%
%   oa0:        annotation at t0
%
%   oa1:        annotation at t1
%
%               Note:, pred, oa0 and oa1 must have the same ontology structure
% Output
% ------
%   rc_delta:   recall on delta for each protein in tarlist.
%
%   rc:         the original recall
%
% Dependence
% ----------
%   pfp_oaproj.m
%
% -------------
% Yuxiang Jiang
% School of Informatics and Computing
% Indiana University Bloomington
% Last modified: Tue 08 Jul 2014 10:41:05 AM EDT

    % get the list of newly added term for each target protein
    delta = cell(numel(tarlist), 1);

    pred = pfp_predproj(pred, tarlist, 'object');
    oa0 = pfp_oaproj(oa0, tarlist, 'object');
    oa1 = pfp_oaproj(oa1, tarlist, 'object');

    for i = 1 : numel(tarlist)
        index0 = find(strcmp(tarlist{i}, oa0.object));
        index1 = find(strcmp(tarlist{i}, oa1.object));
        a0 = find(oa0.annotation(index0,:) ~= 0);
        a1 = find(oa1.annotation(index1,:) ~= 0);
        if ~ all(ismember(a0, a1))
            error('annotation is not increasing for [%s].', tarlist{i});
        end
        delta{i} = setdiff(a1, a0);
        if isempty(delta{i})
            error('annotation remains the same for [%s].', tarlist{i});
        end
    end

    rc_delta = zeros(numel(tarlist), 1);
    rc       = zeros(numel(tarlist), 1);

    for i = 1 : numel(tarlist)
        fprintf('running [%d] of [%d] ...\n', i, numel(tarlist));
        % the original recall
        [~, c] = pfp_f1max(pfp_avgprcurve(tarlist(i), 1, pred, oa0));

        % the recall on delta
        % manually project
        predproj.object = tarlist(i);
        predproj.ontology.term = pred.ontology.term(delta{i});
        predproj.score = 
        [~, c_delta] = pfp_f1max(pfp_avgprcurve(tarlist(i), 1, pfp_predproj(pred, delta{i}, 'term'), pfp_oaproj(oa1, delta{i}, 'term')));
        rc(i) = c(2);
        rc_delta(i) = c_delta(2);
    end
return
