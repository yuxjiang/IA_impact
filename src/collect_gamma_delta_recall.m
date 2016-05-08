function [GAMMA, DELTA, recall] = collect_gamma_delta_recall(pred, oa0, oa1)
%COLLECT_GAMMA_DELTA_RECALL Collect GAMMA DELTA recall
%
%   [GAMMA, DELTA, RECALL] = COLLECT_GAMMA_DELTA_RECALL(pred, oa0, oa1);
%
%       Collects observations of (DELTA, recall) pairs.
%
%       Note: 
%       1. the `ontology' structure of `pred', `oa0' and `oa1'
%       must be the same.
%
%       2. the `score' structure of `pred' should be logical.
%       use a reasonable threshold to make it binary ahead of 
%       time.
%
% Input
% -----
%   pred:   the prediction structure
%
%   oa0:    the ontology annotation structure at t0
%           see pfp_oabuild.m
%
%   oa1:    the ontology annotation structure at t1
%
% Output
% ------
%   GAMMA:  n-by-1 observations of GAMMA,
%           which is the number of annotation at t0.
%
%   DELTA:  n-by-1 observations of DELTA,
%           which is the number of incomplete annotation.
%
%   recall: n-by-1 observations of recall on DELTA.
%
% Dependence
% ----------
%   ia_list.m
%   pfp_oaproj.m
%
% -------------
% Yuxiang Jiang
% School of Informatics and Computing
% Indiana University Bloomington
% Last modified: Wed 26 Feb 2014 03:30:00 PM EST

    if ~islogical(pred.score)
        error('collect_delta_recall:realscore', ...
            'Make ''score'' of ''pred'' logical first.');
    end

    % find proteins whose number of annotation has grown
    % from t0 to t1.
    ia = ia_list(oa0, oa1, true);

    % remove those with no predictions
    % because we cannot estimate recall on those proteins.
    lst = ia.object(ismember(ia.object, pred.object));

    % project prediction structure to the remaining list
    [found, index] = ismember(pred.object, lst);
    pred.object = pred.object(index(found));
    pred.score  = pred.score(index(found), :);
    
    % project oa structures to the list
    oa0 = pfp_oaproj(oa0, lst, 'object');
    oa1 = pfp_oaproj(oa1, lst, 'object');

    GAMMA = full(sum(oa0.annotation, 2));

    annot_mask = oa1.annotation & ~oa0.annotation; % grown portion
    DELTA = full(sum(annot_mask, 2));

    beta = full(sum(pred.score & annot_mask, 2));
    recall = beta ./ DELTA;
return
