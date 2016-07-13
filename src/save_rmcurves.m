%script
%SAVE_RMCURVES Save RU-MI curves
%
% [] = SAVE_RMCURVES;
%
%   Saves RU-MI curves to data files
%
% Note
% ----
% !Specifiy the output director as 'out_dir' before run this script!
%
% This script assumes the follow curves:
% gotcha_rmcurve
%   [bpo], [cco], [mfo] and each of them has 4 curves:
%   [c2011], [c2012], [c2013], [c2014]
%
% gotcha_rmcurve_ia
%   [bpo], [cco], [mfo] and each of them has 3 curves:
%   [c2012], [c2013], [c2014]
%
% blast_rmcurve
%   [bpo], [cco], [mfo] and each of them has 4 curves:
%   [c2011], [c2012], [c2013], [c2014]
%
% blast_rmcurve_ia
%   [bpo], [cco], [mfo] and each of them has 3 curves:
%   [c2012], [c2013], [c2014]
%
% com_rmcurve
%   [bpo], [cco], [mfo] and each of them has 4 curves:
%   [c2011], [c2012], [c2013], [c2014]
%
% com_rmcurve_ia
%   [bpo], [cco], [mfo] and each of them has 3 curves:
%   [c2012], [c2013], [c2014]
%
% Output
% ------
% None.

% set output dir {{{
out_dir = '~/Documents/ia_results/curves_np';

if exist(out_dir, 'd')
  mkdir(out_dir);
end
% }}}

% Output curves averaged over 'all' targets {{{
% output GOtcha on BPO {{{
fid = fopen([out_dir, 'rm_gotcha_bpo.dat'], 'w');
write_curve(fid, gotcha_rmcurve.bpo.c2011); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve.bpo.c2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve.bpo.c2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve.bpo.c2014); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.bpo.b2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.bpo.b2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.bpo.b2014); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.bpo.c2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.bpo.c2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.bpo.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}

% output GOtcha on CCO {{{
fid = fopen([out_dir, 'rm_gotcha_cco.dat'], 'w');
write_curve(fid, gotcha_rmcurve.cco.c2011); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve.cco.c2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve.cco.c2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve.cco.c2014); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.cco.b2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.cco.b2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.cco.b2014); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.cco.c2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.cco.c2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.cco.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}

% output GOtcha on MFO {{{
fid = fopen([out_dir, 'rm_gotcha_mfo.dat'], 'w');
write_curve(fid, gotcha_rmcurve.mfo.c2011); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve.mfo.c2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve.mfo.c2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve.mfo.c2014); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.mfo.b2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.mfo.b2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.mfo.b2014); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.mfo.c2012); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.mfo.c2013); fprintf(fid, '\n\n');
write_curve(fid, gotcha_rmcurve_ia.mfo.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}

% output BLAST on BPO {{{
fid = fopen([out_dir, 'rm_blast_bpo.dat'], 'w');
write_curve(fid, blast_rmcurve.bpo.c2011); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve.bpo.c2012); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve.bpo.c2013); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve.bpo.c2014); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.bpo.b2012); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.bpo.b2013); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.bpo.b2014); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.bpo.c2012); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.bpo.c2013); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.bpo.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}

% output BLAST on CCO {{{
fid = fopen([out_dir, 'rm_blast_cco.dat'], 'w');
write_curve(fid, blast_rmcurve.cco.c2011); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve.cco.c2012); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve.cco.c2013); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve.cco.c2014); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.cco.b2012); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.cco.b2013); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.cco.b2014); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.cco.c2012); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.cco.c2013); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.cco.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}

% output BLAST on MFO {{{
fid = fopen([out_dir, 'rm_blast_mfo.dat'], 'w');
write_curve(fid, blast_rmcurve.mfo.c2011); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve.mfo.c2012); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve.mfo.c2013); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve.mfo.c2014); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.mfo.b2012); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.mfo.b2013); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.mfo.b2014); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.mfo.c2012); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.mfo.c2013); fprintf(fid, '\n\n');
write_curve(fid, blast_rmcurve_ia.mfo.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}

% output Swiss-Prot on BPO {{{
fid = fopen([out_dir, 'rm_com_bpo.dat'], 'w');
write_curve(fid, com_rmcurve.bpo.c2011); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve.bpo.c2012); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve.bpo.c2013); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve.bpo.c2014); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.bpo.b2012); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.bpo.b2013); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.bpo.b2014); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.bpo.c2012); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.bpo.c2013); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.bpo.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}

% output Swiss-Prot on CCO {{{
fid = fopen([out_dir, 'rm_com_cco.dat'], 'w');
write_curve(fid, com_rmcurve.cco.c2011); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve.cco.c2012); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve.cco.c2013); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve.cco.c2014); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.cco.b2012); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.cco.b2013); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.cco.b2014); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.cco.c2012); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.cco.c2013); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.cco.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}

% output Swiss-Prot on MFO {{{
fid = fopen([out_dir, 'rm_com_mfo.dat'], 'w');
write_curve(fid, com_rmcurve.mfo.c2011); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve.mfo.c2012); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve.mfo.c2013); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve.mfo.c2014); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.mfo.b2012); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.mfo.b2013); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.mfo.b2014); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.mfo.c2012); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.mfo.c2013); fprintf(fid, '\n\n');
write_curve(fid, com_rmcurve_ia.mfo.c2014); fprintf(fid, '\n\n');
fclose(fid);
% }}}
% }}}

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Mon 11 Jul 2016 04:54:04 PM E
