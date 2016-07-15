%script
%SAVE_SIM_IMPACT_RM Save simulated impact (on) RU-MI
%
% [] = SAVE_SIM_IMPACT_RM;
%
%   Outputs the simulated impact (as a heatmap) to file.
%   (used to generate data for Fig. 4 in the paper)
%
% Require
% -------
% [struct]
% tarlist_ia: See load_data.m
%
% Provide
% -------
% data files to 'out_dir'
%
% Dependency
% ----------
%[>]sim_impact_rm.m
%
% See Also
% --------
%[>]load_data.m

% setting up {{{
out_dir = '../result/sim';
resol   = [30, 30]; % resolution 30 x 30 patches
loc_ia  = tarlist_ia.t14;
k       = 1; % rc_delta / rc, the recall assumption on delta
             % k = 1: means "recall" remains the same.
ru_max  = 20;
mi_max  = 100;
% }}}

% MFO {{{
fprintf('generating data for MFO ... ');
N     = numel(loc_ia.mfo.object);
g     = loc_ia.mfo.gamma_ic; % pre-computed observed gamma
d     = loc_ia.mfo.delta_ic; % pre-computed observed delta
ofile = fullfile(out_dir, 'ds_mfo.dat');
sim_impact_rm(ru_max, mi_max, resol, N, g, d, k, ofile);
fprintf('done.\n');
% }}}

% BPO {{{
fprintf('generating data for BPO ... ');
N     = numel(loc_ia.bpo.object);
g     = loc_ia.bpo.gamma_ic; % pre-computed observed gamma
d     = loc_ia.bpo.delta_ic; % pre-computed observed delta
ofile = fullfile(out_dir, 'ds_bpo.dat');
sim_impact_rm(ru_max, mi_max, resol, N, g, d, k, ofile);
fprintf('done.\n');
% }}}

% CCO {{{
fprintf('generating data for CCO ... ');
N     = numel(loc_ia.cco.object);
g     = loc_ia.cco.gamma_ic; % pre-computed observed gamma
d     = loc_ia.cco.delta_ic; % pre-computed observed delta
ofile = fullfile(out_dir, 'ds_cco.dat');
sim_impact_rm(ru_max, mi_max, resol, N, g, d, k, ofile);
fprintf('done.\n');
% }}}

% clearing {{{
clear resol loc_ia N g d k ofile ru_max mi_max
% }}}

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Fri 15 Jul 2016 06:02:03 PM E
