function [list] = check_pb(plist, mfoa0, mfoa1)
%CHECK_PB Check protein binding
%
% [list] = check_pb(plist, mfoa0, mfoa1);
%
%   Returns a list of proteins with "Protein binding" annotation removed from t0
%   to t1.
%
% Note
% ----
% 'mfoa1' should have the same ontology structure as that of 'mfoa0'.
%
% Input
% -----
% [cell]
% plist:  protein list
%
% [struct]
% mfoa0:  MFO ontology annotation at t0, see pfp_oabuild.m
%
% [struct]
% mfoa1:  MFO ontology annotation at t1
%
% Output
% ------
% [cell]
% list: the requested list.
%
% Dependency
% ----------
%[>]pfp_getterm.m
%
% See Also
% --------
%[>]pfp_oabuild.m

  % check inputs {{{
  if nargin ~= 3
    error('check_pb:InputCount', 'Expected 3 inputs.');
  end

  % plist
  validateattributes(plist, {'cell'}, {'nonempty'}, '', 'plist', 1);

  % mfoa0
  validateattributes(mfoa0, {'struct'}, {'nonempty'}, '', 'mfoa0', 2);

  % mfoa1
  validateattributes(mfoa1, {'struct'}, {'nonempty'}, '', 'mfoa1', 3);
  [issame, msg] = pfp_sameont(mfoa0.ontology, mfoa1.ontology);
  if ~issame
    error('check_pb:DiffOnt', msg);
  end
  % }}}

  % indexing {{{
  [~, pbid] = pfp_getterm(mfoa0.ontology, 'GO:0005515');

  [found0, index0] = ismember(plist, mfoa0.object);
  [found1, index1] = ismember(plist, mfoa1.object);

  if ~all(found0) || ~all(found1)
    warning('check_pb:InputErr', 'Some proteins are not found in either mfoa.');
  end
  % }}}

  % find list {{{
  n = numel(plist);
  pboa0 = false(n, 1);
  pboa1 = false(n, 1);
  pboa0(found0) = mfoa0.annotation(index0(found0), pbid);
  pboa1(found1) = mfoa1.annotation(index1(found1), pbid);
  list = plist(pboa0 & ~pboa1);
  % }}}
return

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Mon 11 Jul 2016 09:51:26 AM E
