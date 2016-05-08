function [lst] = check_pb(plist, mfoa0, mfoa1)
%CHECK_PB
%
%   [lst] = check_pb(plist, mfoa0, mfoa1);
%
%       Returns a list of proteins with "Protein binding"
%       annotation removed from t0 to t1.
%
% Input
% -----
%   plist:  protein list
%
%   mfoa0:  MFO ontology annotation at t0
%
%   mfoa1:  MFO ontology annotation at t1
%
%           Note: mfoa1 should have the same ontology structure
%           as that of mfoa0.
%
% Output
% ------
%   lst:    the requested list.
%
% -------------
% Yuxiang Jiang
% School of Informatics and Computing
% Indiana University Bloomington
% Last modified: Sun 08 Jun 2014 11:16:22 PM EDT

    [~, pbid] = ismember('GO:0005515', {mfoa0.ontology.term.id});

    [found0, index0] = ismember(plist, mfoa0.object);
    [found1, index1] = ismember(plist, mfoa1.object);

    if ~all(found0) || ~all(found1)
        warning('check_pb:inputwrn', 'Some proteins are not found in mfoa.');
    end

    pboa0 = false(numel(plist), 1);
    pboa0(found0) = mfoa0.annotation(index0(found0), pbid);
    pboa1 = false(numel(plist), 1);
    pboa1(found1) = mfoa1.annotation(index1(found1), pbid);

    lst = plist(pboa0 & ~pboa1);
return
