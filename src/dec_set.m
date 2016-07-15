%script
%DEC_SET decreased set
%
% [] = DEC_SET;
%
%   Retrieves the set of protein whose annotation has decreased.
%
% Require
% -------
% [struct] See load_data.m
% sp1001
% sp1101
% sp1201
% sp1301
% sp1401
%
% Provide
% -------
% [struct]
% dec:  The decreased set (per year, per ontology)
%       (2012, 2013, 2014) x (mfo, bpo, cco)
%
% Dependency
% ----------
%[>]ia_list.m
%
% See Also
% --------
%[>]load_data.m

% target sets {{{
loc_ts.mfo = setdiff(sp1101.mfoa.object, sp1001.mfoa.object);
loc_ts.bpo = setdiff(sp1101.bpoa.object, sp1001.bpoa.object);
loc_ts.cco = setdiff(sp1101.ccoa.object, sp1001.ccoa.object);
% }}}

% decreased info {{{
loc_dec_info.t12.mfo = ia_list(sp1201.mfoa, sp1101.mfoa, true);
loc_dec_info.t12.bpo = ia_list(sp1201.bpoa, sp1101.bpoa, true);
loc_dec_info.t12.cco = ia_list(sp1201.ccoa, sp1101.ccoa, true);

loc_dec_info.t13.mfo = ia_list(sp1301.mfoa, sp1101.mfoa, true);
loc_dec_info.t13.bpo = ia_list(sp1301.bpoa, sp1101.bpoa, true);
loc_dec_info.t13.cco = ia_list(sp1301.ccoa, sp1101.ccoa, true);

loc_dec_info.t14.mfo = ia_list(sp1401.mfoa, sp1101.mfoa, true);
loc_dec_info.t14.bpo = ia_list(sp1401.bpoa, sp1101.bpoa, true);
loc_dec_info.t14.cco = ia_list(sp1401.ccoa, sp1101.ccoa, true);
% }}}

% find the decreased set {{{
dec.t12.mfo = intersect(loc_ts.mfo, loc_dec_info.t12.mfo.object);
dec.t12.bpo = intersect(loc_ts.bpo, loc_dec_info.t12.bpo.object);
dec.t12.cco = intersect(loc_ts.cco, loc_dec_info.t12.cco.object);

dec.t13.mfo = intersect(loc_ts.mfo, loc_dec_info.t13.mfo.object);
dec.t13.bpo = intersect(loc_ts.bpo, loc_dec_info.t13.bpo.object);
dec.t13.cco = intersect(loc_ts.cco, loc_dec_info.t13.cco.object);

dec.t14.mfo = intersect(loc_ts.mfo, loc_dec_info.t14.mfo.object);
dec.t14.bpo = intersect(loc_ts.bpo, loc_dec_info.t14.bpo.object);
dec.t14.cco = intersect(loc_ts.cco, loc_dec_info.t14.cco.object);
% }}}

% clearing {{{
clear loc_ts loc_dec_info
% }}}

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Thu 14 Jul 2016 04:37:26 PM E
