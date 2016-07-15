function [GAMMA, DELTA, recall] = collect_gamma_delta_recall(pred, oa0, oa1)
%COLLECT_GAMMA_DELTA_RECALL Collect GAMMA DELTA recall
%
% [GAMMA, DELTA, recall] = COLLECT_GAMMA_DELTA_RECALL(pred, oa0, oa1);
%
%   Collects observations of (DELTA, recall) pairs.
%
% Note
% ----
% 1. The 'ontology' structure of 'pred', 'oa0' and 'oa1' must be the same.
% 2. the 'score' structure of 'pred' should be logical.  use a reasonable
%    threshold to make it binary ahead of time.
%
% Input
% -----
% [struct]
% pred: The prediction structure.
%
% [struct]
% oa0:  The ontology annotation structure at t0, see pfp_oabuild.m
%
% [struct]
% oa1:  The ontology annotation structure at t1.
%
% Output
% ------
% [double]
% GAMMA:  An n-by-1 observations of GAMMA, i.e., the number of annotation at t0.
%
% [double]
% DELTA:  An n-by-1 observations of DELTA, i.e., the number of incomplete
%         annotation.
%
% [double]
% recall: An n-by-1 observations of recall on DELTA.
%
% Dependency
% ----------
%[>]pfp_sameont.m
%[>]ia_list.m
%[>]pfp_oaproj.m

  % check inputs {{{
  if nargin ~= 3
    error('collect_gamma_delta_recall:InputCount', 'Expected 3 inputs.');
  end

  % pred
  validateattributes(pred, {'struct'}, {'nonempty'}, '', 'pred', 1);

  % oa0
  validateattributes(oa0, {'struct'}, {'nonempty'}, '', 'oa0', 2);
  [issame, msg] = pfp_sameont(pred.ontology, oa0.ontology);
  if ~issame
    error('collect_gamma_delta_recall:DiffOnt', msg);
  end

  % oa1
  validateattributes(oa1, {'struct'}, {'nonempty'}, '', 'oa1', 3);
  [issame, msg] = pfp_sameont(pred.ontology, oa1.ontology);
  if ~issame
    error('collect_gamma_delta_recall:DiffOnt', msg);
  end
  % }}}

  if ~islogical(pred.score)
    error('collect_delta_recall:realscore', 'Make ''score'' of ''pred'' logical first.');
  end

  % find proteins whose number of annotation has grown {{{
  ia = ia_list(oa0, oa1, true);
  % }}}

  % remove those with no predictions {{{
  % because we are not able to estimate recall on those proteins.
  list = ia.object(ismember(ia.object, pred.object));
  % }}}

  % project prediction structure to the remaining list
  [found, index] = ismember(pred.object, list);
  pred.object = pred.object(index(found));
  pred.score  = pred.score(index(found), :);

  % project oa structures to the list {{{
  oa0 = pfp_oaproj(oa0, list, 'object');
  oa1 = pfp_oaproj(oa1, list, 'object');
  % }}}

  GAMMA = full(sum(oa0.annotation, 2));

  annot_mask = oa1.annotation & ~oa0.annotation; % grown portion
  DELTA = full(sum(annot_mask, 2));

  beta = full(sum(pred.score & annot_mask, 2));
  recall = beta ./ DELTA;
return

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Thu 14 Jul 2016 04:56:13 PM E
