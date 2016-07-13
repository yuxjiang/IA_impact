%script
%
% Calculate the number of proteins whose annotation has been descreased.
%
% Note
% ----
% This script assumes the following variables in the working space
% sp1001
% sp1101
% sp1201
% sp1301
% sp1401
%
% Output
% ------
% N_desc
%
% Dependency
% ----------
%[>]ia_list.m

ts.mfo = setdiff(sp1101.mfoa.object, sp1001.mfoa.object);
ts.bpo = setdiff(sp1101.bpoa.object, sp1001.bpoa.object);
ts.cco = setdiff(sp1101.ccoa.object, sp1001.ccoa.object);

desc.t12.mfo = ia_list(sp1201.mfoa, sp1101.mfoa, true);
desc.t12.bpo = ia_list(sp1201.bpoa, sp1101.bpoa, true);
desc.t12.cco = ia_list(sp1201.ccoa, sp1101.ccoa, true);

desc.t13.mfo = ia_list(sp1301.mfoa, sp1101.mfoa, true);
desc.t13.bpo = ia_list(sp1301.bpoa, sp1101.bpoa, true);
desc.t13.cco = ia_list(sp1301.ccoa, sp1101.ccoa, true);

desc.t14.mfo = ia_list(sp1401.mfoa, sp1101.mfoa, true);
desc.t14.bpo = ia_list(sp1401.bpoa, sp1101.bpoa, true);
desc.t14.cco = ia_list(sp1401.ccoa, sp1101.ccoa, true);

N_desc.t12.mfo = intersect(ts.mfo, desc.t12.mfo.object);
N_desc.t12.bpo = intersect(ts.bpo, desc.t12.bpo.object);
N_desc.t12.cco = intersect(ts.cco, desc.t12.cco.object);

N_desc.t13.mfo = intersect(ts.mfo, desc.t13.mfo.object);
N_desc.t13.bpo = intersect(ts.bpo, desc.t13.bpo.object);
N_desc.t13.cco = intersect(ts.cco, desc.t13.cco.object);

N_desc.t14.mfo = intersect(ts.mfo, desc.t14.mfo.object);
N_desc.t14.bpo = intersect(ts.bpo, desc.t14.bpo.object);
N_desc.t14.cco = intersect(ts.cco, desc.t14.cco.object);

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Mon 11 Jul 2016 02:48:43 PM E
