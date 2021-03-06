%script
%OUTPUT_S2MIN_TABLE Output S2-min table
%
% Require
% -------
% (predictor)
% gotcha
%   .bpo, .cco, .mfo
%
% blast
%   .bpo, .cco, .mfo
%
% com
%   .bpo, .cco, .mfo
%
% (target)
% tarlist_all
%   .bpo, .cco, .mfo
%
% tarlist_ia
%   .t12 (.bpo, .cco, .mfo)
%   .t13 (.bpo, .cco, .mfo)
%   .t13 (.bpo, .cco, .mfo)
%
% (curve)
% gotcha_rmcurve
%   .bpo (.c2011, .c2012, .c2013)
%   .cco (.c2011, .c2012, .c2013)
%   .mfo (.c2011, .c2012, .c2013)
%
% gotcha_rmcurve_ia
%   .bpo (.b2012, .b2013, .b2014, .c2012, .c2013, .c2014)
%   .cco (.b2012, .b2013, .b2014, .c2012, .c2013, .c2014)
%   .mfo (.b2012, .b2013, .b2014, .c2012, .c2013, .c2014)
%
% blast_rmcurve
%   .bpo (.c2011, .c2012, .c2013)
%   .cco (.c2011, .c2012, .c2013)
%   .mfo (.c2011, .c2012, .c2013)
%
% blast_rmcurve_ia
%   .bpo (.b2012, .b2013, .b2014, .c2012, .c2013, .c2014)
%   .cco (.b2012, .b2013, .b2014, .c2012, .c2013, .c2014)
%   .mfo (.b2012, .b2013, .b2014, .c2012, .c2013, .c2014)
%
% com_rmcurve
%   .bpo (.c2011, .c2012, .c2013)
%   .cco (.c2011, .c2012, .c2013)
%   .mfo (.c2011, .c2012, .c2013)
%
% com_rmcurve_ia
%   .bpo (.b2012, .b2013, .b2014, .c2012, .c2013, .c2014)
%   .cco (.b2012, .b2013, .b2014, .c2012, .c2013, .c2014)
%   .mfo (.b2012, .b2013, .b2014, .c2012, .c2013, .c2014)
%
% Dependency
% ----------
%[>]pfp_predproj.m
%[>]s2min_from_curve.m

% setting up {{{
tar_ia.t14.mfo = tarlist_ia.t14.mfo.object;
tar_ia.t14.bpo = tarlist_ia.t14.bpo.object;
tar_ia.t14.cco = tarlist_ia.t14.cco.object;
% }}}

% mapping {{{
% mapping GOtcha {{{
mapped_g.mfo = pfp_predproj(gotcha.mfo, tarlist_all.mfo, 'object');
mapped_g.bpo = pfp_predproj(gotcha.bpo, tarlist_all.bpo, 'object');
mapped_g.cco = pfp_predproj(gotcha.cco, tarlist_all.cco, 'object');

mapped_g_ia.t14.mfo = pfp_predproj(gotcha.mfo, tar_ia.t14.mfo, 'object');
mapped_g_ia.t14.bpo = pfp_predproj(gotcha.bpo, tar_ia.t14.bpo, 'object');
mapped_g_ia.t14.cco = pfp_predproj(gotcha.cco, tar_ia.t14.cco, 'object');
% }}}

% mapping BLAST {{{
mapped_b.mfo = pfp_predproj(blast.mfo, tarlist_all.mfo, 'object');
mapped_b.bpo = pfp_predproj(blast.bpo, tarlist_all.bpo, 'object');
mapped_b.cco = pfp_predproj(blast.cco, tarlist_all.cco, 'object');

mapped_b_ia.t14.mfo = pfp_predproj(blast.mfo, tar_ia.t14.mfo, 'object');
mapped_b_ia.t14.bpo = pfp_predproj(blast.bpo, tar_ia.t14.bpo, 'object');
mapped_b_ia.t14.cco = pfp_predproj(blast.cco, tar_ia.t14.cco, 'object');
% }}}

% mapping Swiss-Prot computational annotation {{{
mapped_c.mfo = pfp_predproj(com.mfo, tarlist_all.mfo, 'object');
mapped_c.bpo = pfp_predproj(com.bpo, tarlist_all.bpo, 'object');
mapped_c.cco = pfp_predproj(com.cco, tarlist_all.cco, 'object');

mapped_c_ia.t14.mfo = pfp_predproj(com.mfo, tar_ia.t14.mfo, 'object');
mapped_c_ia.t14.bpo = pfp_predproj(com.bpo, tar_ia.t14.bpo, 'object');
mapped_c_ia.t14.cco = pfp_predproj(com.cco, tar_ia.t14.cco, 'object');
% }}}
% }}}

% computing {{{
% GOtcha {{{
s2min.gotcha.mfo.f2014 = s2min_from_curve(gotcha_rmcurve_ia.mfo.b2014);
s2min.gotcha.mfo.g2014 = s2min_from_curve(gotcha_rmcurve_ia.mfo.c2014);

s2min.gotcha.bpo.f2014 = s2min_from_curve(gotcha_rmcurve_ia.bpo.b2014);
s2min.gotcha.bpo.g2014 = s2min_from_curve(gotcha_rmcurve_ia.bpo.c2014);

s2min.gotcha.cco.f2014 = s2min_from_curve(gotcha_rmcurve_ia.cco.b2014);
s2min.gotcha.cco.g2014 = s2min_from_curve(gotcha_rmcurve_ia.cco.c2014);

coverage.gotcha.mfo.c2014 = full(sum(max(mapped_g_ia.t14.mfo.score, [], 2) ~= 0))/numel(tar_ia.t14.mfo)*100;
coverage.gotcha.bpo.c2014 = full(sum(max(mapped_g_ia.t14.bpo.score, [], 2) ~= 0))/numel(tar_ia.t14.bpo)*100;
coverage.gotcha.cco.c2014 = full(sum(max(mapped_g_ia.t14.cco.score, [], 2) ~= 0))/numel(tar_ia.t14.cco)*100;

ds2.gotcha.mfo.d2014 = s2min.gotcha.mfo.g2014 - s2min.gotcha.mfo.f2014;
ds2.gotcha.bpo.d2014 = s2min.gotcha.bpo.g2014 - s2min.gotcha.bpo.f2014;
ds2.gotcha.cco.d2014 = s2min.gotcha.cco.g2014 - s2min.gotcha.cco.f2014;
% }}}

% BLAST {{{
s2min.blast.mfo.f2014 = s2min_from_curve(blast_rmcurve_ia.mfo.b2014);
s2min.blast.mfo.g2014 = s2min_from_curve(blast_rmcurve_ia.mfo.c2014);

s2min.blast.bpo.f2014 = s2min_from_curve(blast_rmcurve_ia.bpo.b2014);
s2min.blast.bpo.g2014 = s2min_from_curve(blast_rmcurve_ia.bpo.c2014);

s2min.blast.cco.f2014 = s2min_from_curve(blast_rmcurve_ia.cco.b2014);
s2min.blast.cco.g2014 = s2min_from_curve(blast_rmcurve_ia.cco.c2014);

coverage.blast.mfo.c2014 = full(sum(max(mapped_b_ia.t14.mfo.score, [], 2) ~= 0))/numel(tar_ia.t14.mfo)*100;
coverage.blast.bpo.c2014 = full(sum(max(mapped_b_ia.t14.bpo.score, [], 2) ~= 0))/numel(tar_ia.t14.bpo)*100;
coverage.blast.cco.c2014 = full(sum(max(mapped_b_ia.t14.cco.score, [], 2) ~= 0))/numel(tar_ia.t14.cco)*100;

ds2.blast.mfo.d2014 = s2min.blast.mfo.g2014 - s2min.blast.mfo.f2014;
ds2.blast.bpo.d2014 = s2min.blast.bpo.g2014 - s2min.blast.bpo.f2014;
ds2.blast.cco.d2014 = s2min.blast.cco.g2014 - s2min.blast.cco.f2014;
% }}}

% Swiss-Prot {{{
s2min.com.mfo.f2014 = s2min_from_curve(com_rmcurve_ia.mfo.b2014);
s2min.com.mfo.g2014 = s2min_from_curve(com_rmcurve_ia.mfo.c2014);

s2min.com.bpo.f2014 = s2min_from_curve(com_rmcurve_ia.bpo.b2014);
s2min.com.bpo.g2014 = s2min_from_curve(com_rmcurve_ia.bpo.c2014);

s2min.com.cco.f2014 = s2min_from_curve(com_rmcurve_ia.cco.b2014);
s2min.com.cco.g2014 = s2min_from_curve(com_rmcurve_ia.cco.c2014);

coverage.com.mfo.c2011 = full(sum(max(mapped_c.mfo.score, [], 2) ~= 0))/numel(tarlist_all.mfo)*100;
coverage.com.bpo.c2011 = full(sum(max(mapped_c.bpo.score, [], 2) ~= 0))/numel(tarlist_all.bpo)*100;
coverage.com.cco.c2011 = full(sum(max(mapped_c.cco.score, [], 2) ~= 0))/numel(tarlist_all.cco)*100;

coverage.com.mfo.c2014 = full(sum(max(mapped_c_ia.t14.mfo.score, [], 2) ~= 0))/numel(tar_ia.t14.mfo)*100;
coverage.com.bpo.c2014 = full(sum(max(mapped_c_ia.t14.bpo.score, [], 2) ~= 0))/numel(tar_ia.t14.bpo)*100;
coverage.com.cco.c2014 = full(sum(max(mapped_c_ia.t14.cco.score, [], 2) ~= 0))/numel(tar_ia.t14.cco)*100;

ds2.com.mfo.d2014 = s2min.com.mfo.g2014 - s2min.com.mfo.f2014;
ds2.com.bpo.d2014 = s2min.com.bpo.g2014 - s2min.com.bpo.f2014;
ds2.com.cco.d2014 = s2min.com.cco.g2014 - s2min.com.cco.f2014;
% }}}

% median of rho
rho.mfo.r2014 = median(tarlist_ia.t14.mfo.delta_ic ./ tarlist_ia.t14.mfo.gamma_ic);
rho.bpo.r2014 = median(tarlist_ia.t14.bpo.delta_ic ./ tarlist_ia.t14.bpo.gamma_ic);
rho.cco.r2014 = median(tarlist_ia.t14.cco.delta_ic ./ tarlist_ia.t14.cco.gamma_ic);
% }}}

% output {{{
h_ptn1 = ['\\hline\n', ...
'& \\multicolumn{4}{c|}{Molecular function}\n', ...
'& \\multicolumn{4}{c}{Biological process}\n', ...
'& \\multicolumn{4}{|c}{Cellular component} \\\\ \\hline \\hline\n'];

h_ptn2 = ['&\n', ...
'$N$ & $M_{\\rho}$ & $S_{\\min}^{2011}$~(Coverage) & $\\Delta_{S_{\\min}}$ &\n', ...
'$N$ & $M_{\\rho}$ & $S_{\\min}^{2011}$~(Coverage) & $\\Delta_{S_{\\min}}$ &\n', ...
'$N$ & $M_{\\rho}$ & $S_{\\min}^{2011}$~(Coverage) & $\\Delta_{S_{\\min}}$ \\\\ \\hline \n'];

d_ptn1 = ['%s &\n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{$%.2f$} & $%.2f~(%.1f\\%%)$ & $%+.2f$ &\n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{$%.2f$} & $%.2f~(%.1f\\%%)$ & $%+.2f$ &\n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{$%.2f$} & $%.2f~(%.1f\\%%)$ & $%+.2f$ \\\\\n'];

d_ptn2 = ['%s &\n', ...
'& & $%.2f~(%.1f\\%%)$ & $%+.2f$ &\n', ...
'& & $%.2f~(%.1f\\%%)$ & $%+.2f$ &\n', ...
'& & $%.2f~(%.1f\\%%)$ & $%+.2f$ \\\\\n'];

fid = fopen('../table/s2min_table_ia.tex', 'w');
fprintf(fid, '\\begin{tabular}{c|cccc|cccc|cccc}\n');
fprintf(fid, h_ptn1);
fprintf(fid, h_ptn2);
fprintf(fid, d_ptn1, 'GOtcha', ...
    numel(tar_ia.t14.mfo), sigdigit(rho.mfo.r2014), sigdigit(s2min.gotcha.mfo.f2014), sigdigit(coverage.gotcha.mfo.c2014), sigdigit(ds2.gotcha.mfo.d2014), ...
    numel(tar_ia.t14.bpo), sigdigit(rho.bpo.r2014), sigdigit(s2min.gotcha.bpo.f2014), sigdigit(coverage.gotcha.bpo.c2014), sigdigit(ds2.gotcha.bpo.d2014), ...
    numel(tar_ia.t14.cco), sigdigit(rho.cco.r2014), sigdigit(s2min.gotcha.cco.f2014), sigdigit(coverage.gotcha.cco.c2014), sigdigit(ds2.gotcha.cco.d2014));
fprintf(fid, d_ptn2, 'BLAST', ...
    sigdigit(s2min.blast.mfo.f2014), sigdigit(coverage.blast.mfo.c2014), sigdigit(ds2.blast.mfo.d2014), ...
    sigdigit(s2min.blast.bpo.f2014), sigdigit(coverage.blast.bpo.c2014), sigdigit(ds2.blast.bpo.d2014), ...
    sigdigit(s2min.blast.cco.f2014), sigdigit(coverage.blast.cco.c2014), sigdigit(ds2.blast.cco.d2014));
fprintf(fid, d_ptn2, 'Swiss-Prot', ...
    sigdigit(s2min.com.mfo.f2014), sigdigit(coverage.com.mfo.c2014), sigdigit(ds2.com.mfo.d2014), ...
    sigdigit(s2min.com.bpo.f2014), sigdigit(coverage.com.bpo.c2014), sigdigit(ds2.com.bpo.d2014), ...
    sigdigit(s2min.com.cco.f2014), sigdigit(coverage.com.cco.c2014), sigdigit(ds2.com.cco.d2014));
fprintf(fid, '\\hline\n');
fprintf(fid, '\\end{tabular}\n');
fclose(fid);
% }}}

% clearing {{{
clear mapped_g* mapped_b* mapped_c* tar_ia h_ptn* d_ptn* fid s2min ds2 coverage rho
% }}}

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Thu 14 Jul 2016 05:30:01 PM E
