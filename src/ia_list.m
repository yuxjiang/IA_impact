function [result] = ia_list(oa0, oa1, strictly)
%IA_LIST Incomplete annotation list
%
%   [result] = IA_LIST(oa0, oa1);
%
%   [result] = IA_LIST(oa0, oa1, true);
%
%       Returns the list of objects whose annotation has increased.
%
%       Note: oa0 and oa1 must be annotated with the same ontology.
%
%   [result] = IA_LIST(oa0, oa1, false);
%
%       Returns the list of objects whose annotation has not decreased.
%
% Input
% -----
%   oa0:        ontology annotation structure at t0
%               see pfp_oabuild.m
%
%   oa1:        ontology annotation structure at t1
%
%   (optional)
%   strictly:   logical, only consider objects whose annotation 
%               has increased strictly
%               [default: true]
%
% Output
% ------
%   result:     result structure containing
%               [object]    object ID list
%               [gamma ]    number of annotations at t0
%               [delta ]    number of increased annotation (incomplete annotation)
%
% -------------
% Yuxiang Jiang
% School of Informatics and Computing
% Indiana University Bloomington
% Last modified: Tue 11 Mar 2014 10:33:02 PM EDT

    % project oa0's object list to oa1's object list,
    % so that oa0.annotation and oa1.annotation should have the 
    % same dimensionality.
    oa0 = pfp_oaproj(oa0, oa1.object, 'object');

    diff = oa1.annotation - oa0.annotation;

    if nargin == 2
        strictly = true;
    end

    if strictly
        % not decreasing and at least one increase
        idx = all(diff >= 0, 2) & any(diff > 0, 2);
    else
        idx = all(diff >= 0, 2);
    end
    result.object = oa1.object(idx);
    result.gamma  = full(sum(oa0.annotation(idx, :), 2));
    result.delta  = full(sum(diff(idx, :), 2));
return
