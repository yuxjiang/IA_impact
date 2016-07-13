function [result] = ia_list(oa0, oa1, strictly)
%IA_LIST Incomplete annotation list
%
% [result] = IA_LIST(oa0, oa1);
% [result] = IA_LIST(oa0, oa1, true);
%
%   Returns the list of objects whose annotation has increased.
%
% [result] = IA_LIST(oa0, oa1, false);
%
%   Returns the list of objects whose annotation has not decreased.
%
% Note
% ----
% 'oa0' and 'oa1' must be annotated with the same ontology.
%
% Input
% -----
% (required)
% [struct]
% oa0:  The ontology annotation structure at t0, see pfp_oabuild.m
%
% [struct]
% oa1:  The ontology annotation structure at t1.
%
% (optional)
% [logical]
% strictly: A toggle for only consider objects whose annotation has increased
%           strictly.
%           default: true
%
% Output
% ------
% [struct]
% result: The result structure
%         .object [cell]    object ID list
%         .gamma  [double]  number of annotations at t0
%         .delta  [double]  number of increased annotation (incomplete
%                           annotation)
%
% Dependency
% ----------
%[>]pfp_oaproj.m
%
% See Also
% --------
%[>]pfp_oabuild.m

  % check input {{{
  if nargin < 2 || nargin > 3
    error('ia_list:InputCount', 'Expected 2 or 3 input.');
  end

  if nargin == 2
    strictly = true;
  end

  % oa0
  validateattributes(oa0, {'struct'}, {'nonempty'}, '', 'oa0', 1);

  % oa1
  validateattributes(oa1, {'struct'}, {'nonempty'}, '', 'oa1', 2);

  % strictly
  validateattributes(strictly, {'logical'}, {'nonempty'}, '', 'strictly', 3);
  % }}}

  % project oa0's object list to oa1's object list {{{
  % So that oa0.annotation and oa1.annotation should have the same
  % dimensionality.
  oa0 = pfp_oaproj(oa0, oa1.object, 'object');
  % }}}

  % computation {{{
  diff = oa1.annotation - oa0.annotation;

  if strictly
    % not decreasing and at least one increase
    idx = all(diff >= 0, 2) & any(diff > 0, 2);
  else
    idx = all(diff >= 0, 2);
  end
  result.object = oa1.object(idx);
  result.gamma  = full(sum(oa0.annotation(idx, :), 2));
  result.delta  = full(sum(diff(idx, :), 2));
  % }}}
return

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Mon 11 Jul 2016 02:51:13 PM E
