function tarlist = collect_ic(tarlist, oa0, oa1, eia)
%COLLECT_IC Collect information content
%
% tarlist = COLLECT_IC(tarlist, oa0, oa1, eia);
%
%   Compute 'gamma', 'delta' for each object in the 'tarlist'.
%
% Input
% -----
% tarlist:  A target list structure returned by 'ia_list.m', which contain
%           .object [cell]    object ID list
%           .gamma  [double]  number of annotations at t0
%           .delta  [double]  number of increased annotation (incomplete
%                             annotation)
%
% [struct]
% oa0:      Swiss-Prot annotation structure at t0, see pfp_oabuild.m
%
% [struct]
% oa1:      Swiss-Prot annotation structure at t1.
%
%           Note: one needs to make sure that oa0 and oa1 should have the same
%           ontology!
%
% [double]
% eia:      The estimated information accretion for each term, see pfp_eia.m
%
% Output
% ------
% [struct]
% tarlist:  The result with the same structure as 'tarlist' but with two extra
%           fields:
%           .gamma_ic [double]  'gamma' in the sense of information content
%           .delta_ic [double]  'delta' in the sense of information content
%
% Dependency
% ----------
%[>]pfp_oaproj.m
%
% See Also
% --------
%[>]pfp_oabuild.m
%[>]pfp_eia.m

  % check inputs {{{
  if nargin ~= 4
    error('collect_ic:InputCount', 'Expected 4 inputs.');
  end

  % tarlist
  validateattributes(tarlist, {'struct'}, {'nonempty'}, '', 'tarlist', 1);

  % oa0
  validateattributes(oa0, {'struct'}, {'nonempty'}, '', 'oa0', 2);

  % oa1
  validateattributes(oa1, {'struct'}, {'nonempty'}, '', 'oa1', 3);
  [issame, msg] = pfp_sameont(oa0.ontology, oa1.ontology);
  if ~issame
    error('collect_ic:DiffOnt', msg);
  end

  % eia
  validateattributes(eia, {'double'}, {'vector'}, '', 'eia', 4);
  eia = reshape(eia, [], 1); % enforce a column vector
  % }}}

  % project two 'oa's to the target list objects {{{
  oa0 = pfp_oaproj(oa0, tarlist.object, 'object');
  oa1 = pfp_oaproj(oa1, tarlist.object, 'object');
  % }}}

  % computation {{{
  tarlist.gamma_ic = zeros(numel(tarlist.object), 1);
  tarlist.delta_ic = zeros(numel(tarlist.object), 1);
  for i = 1 : numel(tarlist.object)
    % count gamma
    gamma_i = full(oa0.annotation(i,:));
    delta_i = full(oa1.annotation(i,:)) & ~gamma_i;

    tarlist.gamma_ic(i) = double(gamma_i) * eia;
    tarlist.delta_ic(i) = double(delta_i) * eia;
  end
  % }}}
return

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Mon 11 Jul 2016 02:47:12 PM E
