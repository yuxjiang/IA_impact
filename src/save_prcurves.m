%script
%SAVE_PRCURVES Save Precision-Recall curves
%
% [] = SAVE_PRCURVES;
%
%   Saves Precision-Recall curves to files.
%
% Note
% ----
% [1] Load the required data into workspace by executing 'load_data'
% [2] Specifiy the output director as 'out_dir' before run this script!
%
% Require
% -------
% gotcha_prcurve
%   .bpo, .cco, .mfo and each of them has 4 curves:
%   .c2011, .c2012, .c2013, .c2014
%
% gotcha_prcurve_ia
%   .bpo, .cco, .mfo and each of them has 3 curves:
%   .c2012, .c2013, .c2014
%
% blast_prcurve
%   .bpo, .cco, .mfo and each of them has 4 curves:
%   .c2011, .c2012, .c2013, .c2014
%
% blast_prcurve_ia
%   .bpo, .cco, .mfo and each of them has 3 curves:
%   .c2012, .c2013, .c2014
%
% com_prcurve
%   .bpo, .cco, .mfo and each of them has 4 curves:
%   .c2011, .c2012, .c2013, .c2014
%
% com_prcurve_ia
%   .bpo, .cco, .mfo and each of them has 3 curves:
%   .c2012, .c2013, .c2014
%
% Provide
% -------
% data files into 'out_dir'.
%
% See Also
% --------
%[>]load_data.m

% set output dir {{{
out_dir = '../result/curves';
if ~exist(out_dir, 'dir')
  mkdir(out_dir);
end
% }}}

% Output curves averaged over 'all' targets {{{
% output GOtcha on BPO {{{
fid = fopen(fullfile(out_dir, 'pr_gotcha_bpo.dat'), 'w');
write_curve(fid, gotcha_prcurve.bpo.c2011); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve.bpo.c2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve.bpo.c2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve.bpo.c2014); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.bpo.b2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.bpo.b2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.bpo.b2014); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.bpo.c2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.bpo.c2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.bpo.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}

% output GOtcha on CCO {{{
fid = fopen(fullfile(out_dir, 'pr_gotcha_cco.dat'), 'w');
write_curve(fid, gotcha_prcurve.cco.c2011); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve.cco.c2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve.cco.c2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve.cco.c2014); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.cco.b2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.cco.b2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.cco.b2014); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.cco.c2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.cco.c2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.cco.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}

% output GOtcha on MFO {{{
fid = fopen(fullfile(out_dir, 'pr_gotcha_mfo.dat'), 'w');
write_curve(fid, gotcha_prcurve.mfo.c2011); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve.mfo.c2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve.mfo.c2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve.mfo.c2014); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.mfo.b2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.mfo.b2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.mfo.b2014); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.mfo.c2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.mfo.c2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_prcurve_ia.mfo.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}

% output BLAST on BPO {{{
fid = fopen(fullfile(out_dir, 'pr_blast_bpo.dat'), 'w');
write_curve(fid, blast_prcurve.bpo.c2011); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve.bpo.c2012); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve.bpo.c2013); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve.bpo.c2014); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.bpo.b2012); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.bpo.b2013); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.bpo.b2014); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.bpo.c2012); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.bpo.c2013); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.bpo.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}

% output BLAST on CCO {{{
fid = fopen(fullfile(out_dir, 'pr_blast_cco.dat'), 'w');
write_curve(fid, blast_prcurve.cco.c2011); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve.cco.c2012); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve.cco.c2013); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve.cco.c2014); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.cco.b2012); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.cco.b2013); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.cco.b2014); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.cco.c2012); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.cco.c2013); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.cco.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}

% output BLAST on MFO {{{
fid = fopen(fullfile(out_dir, 'pr_blast_mfo.dat'), 'w');
write_curve(fid, blast_prcurve.mfo.c2011); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve.mfo.c2012); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve.mfo.c2013); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve.mfo.c2014); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.mfo.b2012); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.mfo.b2013); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.mfo.b2014); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.mfo.c2012); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.mfo.c2013); fprintf(fid, '\n\n');
write_curve(fid, blast_prcurve_ia.mfo.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}

% output Swiss-Prot on BPO {{{
fid = fopen(fullfile(out_dir, 'pr_com_bpo.dat'), 'w');
write_curve(fid, com_prcurve.bpo.c2011); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve.bpo.c2012); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve.bpo.c2013); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve.bpo.c2014); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.bpo.b2012); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.bpo.b2013); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.bpo.b2014); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.bpo.c2012); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.bpo.c2013); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.bpo.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}

% output Swiss-Prot on CCO {{{
fid = fopen(fullfile(out_dir, 'pr_com_cco.dat'), 'w');
write_curve(fid, com_prcurve.cco.c2011); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve.cco.c2012); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve.cco.c2013); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve.cco.c2014); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.cco.b2012); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.cco.b2013); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.cco.b2014); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.cco.c2012); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.cco.c2013); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.cco.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}

% output Swiss-Prot on MFO {{{
fid = fopen(fullfile(out_dir, 'pr_com_mfo.dat'), 'w');
write_curve(fid, com_prcurve.mfo.c2011); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve.mfo.c2012); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve.mfo.c2013); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve.mfo.c2014); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.mfo.b2012); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.mfo.b2013); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.mfo.b2014); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.mfo.c2012); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.mfo.c2013); fprintf(fid, '\n\n');
write_curve(fid, com_prcurve_ia.mfo.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}
% }}}

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Sun 17 Jul 2016 06:28:04 PM E
