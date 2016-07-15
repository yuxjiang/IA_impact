%script
%SAVE_SIM_IMPACT_PR Save simulated impact (on) precision-recall
%
% [] = SAVE_SIM_IMPACT_PR;
%
%   Outputs the simulated impact (as a heatmap) to file.
%   (used to generate data for Fig. 3 in the paper)
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
%[>]sim_impact_pr.m
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
% }}}

% MFO {{{
fprintf('generating data for MFO ... ');
N     = numel(loc_ia.mfo.object);
g     = loc_ia.mfo.gamma; % pre-computed observed gamma
d     = loc_ia.mfo.delta; % pre-computed observed delta
ofile = fullfile(out_dir, 'df_mfo.dat');
sim_impact_pr(resol, N, g, d, k, ofile);
fprintf('done.\n');
% }}}

% BPO {{{
fprintf('generating data for BPO ... ');
N     = numel(loc_ia.bpo.object);
g     = loc_ia.bpo.gamma; % pre-computed observed gamma
d     = loc_ia.bpo.delta; % pre-computed observed delta
ofile = fullfile(out_dir, 'df_bpo.dat');
sim_impact_pr(resol, N, g, d, k, ofile);
fprintf('done.\n');
% }}}

% CCO {{{
fprintf('generating data for CCO ... ');
N     = numel(loc_ia.cco.object);
g     = loc_ia.cco.gamma; % pre-computed observed gamma
d     = loc_ia.cco.delta; % pre-computed observed delta
ofile = fullfile(out_dir, 'df_cco.dat');
sim_impact_pr(resol, N, g, d, k, ofile);
fprintf('done.\n');
% }}}

% clearing {{{
clear resol loc_ia N g d k ofile
% }}}

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Fri 15 Jul 2016 06:01:59 PM E
