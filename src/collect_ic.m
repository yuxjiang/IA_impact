function tarlist = collect_ic(tarlist, oa1, oa2, ia)
%COLLECT_IC Collect information content
%
%   tarlist = COLLECT_IC(tarlist, oa1, oa2, ia);
%
%       Compute `gamma', `delta' for each object in the `tarlist'.
%
% Input
% -----
%   tarlist:    a target list structure returned by `ia_list.m'
%               it should contain the following
%               [object] - object ID list
%               [gamma ] - NOT used
%               [delta ] - NOT used
%
%   oa1:        Swiss-Prot annotation structure at t1
%               see pfp_oabuild.m
%
%   oa2:        Swiss-Prot annotation structure at t2
%
%               Note: one needs to make sure that oa1 and oa2
%               should have the same `ontology'!
%
%   ia:         estimated information accretion for each term
%               see pfp_infoacc.m
%
% Output
% ------
%   tarlist:    the same structure as tarlist but with two 
%               extra fields:
%               [gamma_ic]  - `gamma' in the sense of information content
%               [delta_ic]  - `delta' in the sense of information content
%
% Dependence
% ----------
%   pfp_oaproj.m
%
% -------------
% Yuxiang Jiang
% School of Informatics and Computing
% Indiana University Bloomington
% Last modified: Sat 29 Mar 2014 10:40:09 PM EDT

    ia = reshape(ia, [], 1); % enforce a column vector

    %% check input
    if ~all(strcmp({oa1.ontology.term.id}, {oa2.ontology.term.id}) == 1)
        error('ontology mismatch', ...
            '''oa1'' and ''oa2'' have different ontologies.');
    end

    % project two `oa's to the target list objects
    oa1 = pfp_oaproj(oa1, tarlist.object, 'object');
    oa2 = pfp_oaproj(oa2, tarlist.object, 'object');

    tarlist.gamma_ic = zeros(numel(tarlist.object), 1);
    tarlist.delta_ic = zeros(numel(tarlist.object), 1);
    for i = 1 : numel(tarlist.object)
        % count gamma
        gamma_i = full(oa1.annotation(i,:));
        delta_i = full(oa2.annotation(i,:)) & ~gamma_i;

        tarlist.gamma_ic(i) = double(gamma_i) * ia;
        tarlist.delta_ic(i) = double(delta_i) * ia;
    end
return
