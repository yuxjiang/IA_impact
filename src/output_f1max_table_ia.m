%OUTPUT_F1MAX_TABLE Output F1-max table
%
%   This script assumes the following variable presented in the working space
%
%   [[:predictor:]]
%   gotcha
%       [bpo], [cco], [mfo]
%
%   blast
%       [bpo], [cco], [mfo]
%
%   com
%       [bpo], [cco], [mfo]
%
%   [[:target:]]
%   tarlist_all
%       [bpo], [cco], [mfo]
%
%   tarlist_ia
%       [t12] (bpo, cco, mfo)
%       [t13] (bpo, cco, mfo)
%       [t13] (bpo, cco, mfo)
%
%   [[:curve:]]
%   gotcha_prcurve
%       [bpo] (c2011, c2012, c2013)
%       [cco] (c2011, c2012, c2013)
%       [mfo] (c2011, c2012, c2013)
%
%   gotcha_prcurve_ia
%       [bpo] (b2012, b2013, b2014, c2012, c2013, c2014)
%       [cco] (b2012, b2013, b2014, c2012, c2013, c2014)
%       [mfo] (b2012, b2013, b2014, c2012, c2013, c2014)
%
%   blast_prcurve
%       [bpo] (c2011, c2012, c2013)
%       [cco] (c2011, c2012, c2013)
%       [mfo] (c2011, c2012, c2013)
%
%   blast_prcurve_ia
%       [bpo] (b2012, b2013, b2014, c2012, c2013, c2014)
%       [cco] (b2012, b2013, b2014, c2012, c2013, c2014)
%       [mfo] (b2012, b2013, b2014, c2012, c2013, c2014)
%
%   com_prcurve
%       [bpo] (c2011, c2012, c2013)
%       [cco] (c2011, c2012, c2013)
%       [mfo] (c2011, c2012, c2013)
%
%   com_prcurve_ia
%       [bpo] (b2012, b2013, b2014, c2012, c2013, c2014)
%       [cco] (b2012, b2013, b2014, c2012, c2013, c2014)
%       [mfo] (b2012, b2013, b2014, c2012, c2013, c2014)
%
% Dependence
% ----------
%   pfp_predproj.m
%   pfp_f1max.m
%
% -------------
% Yuxiang Jiang
% School of Informatics and Computing
% Indiana University Bloomington
% Last modified: Thu 03 Apr 2014 04:29:45 PM EDT

tar_ia.t14.mfo = tarlist_ia.t14.mfo.object;
tar_ia.t14.bpo = tarlist_ia.t14.bpo.object;
tar_ia.t14.cco = tarlist_ia.t14.cco.object;

%% mapping

% mapping GOtcha
mapped_g.mfo = pfp_predproj(gotcha.mfo, tarlist_all.mfo, 'object');
mapped_g.bpo = pfp_predproj(gotcha.bpo, tarlist_all.bpo, 'object');
mapped_g.cco = pfp_predproj(gotcha.cco, tarlist_all.cco, 'object');

mapped_g_ia.t14.mfo = pfp_predproj(gotcha.mfo, tar_ia.t14.mfo, 'object');
mapped_g_ia.t14.bpo = pfp_predproj(gotcha.bpo, tar_ia.t14.bpo, 'object');
mapped_g_ia.t14.cco = pfp_predproj(gotcha.cco, tar_ia.t14.cco, 'object');

% mapping BLAST
mapped_b.mfo = pfp_predproj(blast.mfo, tarlist_all.mfo, 'object');
mapped_b.bpo = pfp_predproj(blast.bpo, tarlist_all.bpo, 'object');
mapped_b.cco = pfp_predproj(blast.cco, tarlist_all.cco, 'object');

mapped_b_ia.t14.mfo = pfp_predproj(blast.mfo, tar_ia.t14.mfo, 'object');
mapped_b_ia.t14.bpo = pfp_predproj(blast.bpo, tar_ia.t14.bpo, 'object');
mapped_b_ia.t14.cco = pfp_predproj(blast.cco, tar_ia.t14.cco, 'object');

% mapping Swiss-Prot computational annotation
mapped_c.mfo = pfp_predproj(com.mfo, tarlist_all.mfo, 'object');
mapped_c.bpo = pfp_predproj(com.bpo, tarlist_all.bpo, 'object');
mapped_c.cco = pfp_predproj(com.cco, tarlist_all.cco, 'object');

mapped_c_ia.t14.mfo = pfp_predproj(com.mfo, tar_ia.t14.mfo, 'object');
mapped_c_ia.t14.bpo = pfp_predproj(com.bpo, tar_ia.t14.bpo, 'object');
mapped_c_ia.t14.cco = pfp_predproj(com.cco, tar_ia.t14.cco, 'object');

%% computing

% GOtcha
f1max.gotcha.mfo.f2014 = pfp_f1max(gotcha_prcurve_ia.mfo.b2014);
f1max.gotcha.mfo.g2014 = pfp_f1max(gotcha_prcurve_ia.mfo.c2014);

f1max.gotcha.bpo.f2014 = pfp_f1max(gotcha_prcurve_ia.bpo.b2014);
f1max.gotcha.bpo.g2014 = pfp_f1max(gotcha_prcurve_ia.bpo.c2014);

f1max.gotcha.cco.f2014 = pfp_f1max(gotcha_prcurve_ia.cco.b2014);
f1max.gotcha.cco.g2014 = pfp_f1max(gotcha_prcurve_ia.cco.c2014);

coverage.gotcha.mfo.c2014 = full(sum(max(mapped_g_ia.t14.mfo.score, [], 2) ~= 0))/numel(tar_ia.t14.mfo)*100;
coverage.gotcha.bpo.c2014 = full(sum(max(mapped_g_ia.t14.bpo.score, [], 2) ~= 0))/numel(tar_ia.t14.bpo)*100;
coverage.gotcha.cco.c2014 = full(sum(max(mapped_g_ia.t14.cco.score, [], 2) ~= 0))/numel(tar_ia.t14.cco)*100;

df1.gotcha.mfo.d2014 = f1max.gotcha.mfo.g2014 - f1max.gotcha.mfo.f2014;
df1.gotcha.bpo.d2014 = f1max.gotcha.bpo.g2014 - f1max.gotcha.bpo.f2014;
df1.gotcha.cco.d2014 = f1max.gotcha.cco.g2014 - f1max.gotcha.cco.f2014;

% BLAST
f1max.blast.mfo.f2014 = pfp_f1max(blast_prcurve_ia.mfo.b2014);
f1max.blast.mfo.g2014 = pfp_f1max(blast_prcurve_ia.mfo.c2014);

f1max.blast.bpo.f2014 = pfp_f1max(blast_prcurve_ia.bpo.b2014);
f1max.blast.bpo.g2014 = pfp_f1max(blast_prcurve_ia.bpo.c2014);

f1max.blast.cco.f2014 = pfp_f1max(blast_prcurve_ia.cco.b2014);
f1max.blast.cco.g2014 = pfp_f1max(blast_prcurve_ia.cco.c2014);

coverage.blast.mfo.c2014 = full(sum(max(mapped_b_ia.t14.mfo.score, [], 2) ~= 0))/numel(tar_ia.t14.mfo)*100;
coverage.blast.bpo.c2014 = full(sum(max(mapped_b_ia.t14.bpo.score, [], 2) ~= 0))/numel(tar_ia.t14.bpo)*100;
coverage.blast.cco.c2014 = full(sum(max(mapped_b_ia.t14.cco.score, [], 2) ~= 0))/numel(tar_ia.t14.cco)*100;

df1.blast.mfo.d2014 = f1max.blast.mfo.g2014 - f1max.blast.mfo.f2014;
df1.blast.bpo.d2014 = f1max.blast.bpo.g2014 - f1max.blast.bpo.f2014;
df1.blast.cco.d2014 = f1max.blast.cco.g2014 - f1max.blast.cco.f2014;

% Swiss-Prot
f1max.com.mfo.f2014 = pfp_f1max(com_prcurve_ia.mfo.b2014);
f1max.com.mfo.g2014 = pfp_f1max(com_prcurve_ia.mfo.c2014);

f1max.com.bpo.f2014 = pfp_f1max(com_prcurve_ia.bpo.b2014);
f1max.com.bpo.g2014 = pfp_f1max(com_prcurve_ia.bpo.c2014);

f1max.com.cco.f2014 = pfp_f1max(com_prcurve_ia.cco.b2014);
f1max.com.cco.g2014 = pfp_f1max(com_prcurve_ia.cco.c2014);

coverage.com.mfo.c2014 = full(sum(max(mapped_c_ia.t14.mfo.score, [], 2) ~= 0))/numel(tar_ia.t14.mfo)*100;
coverage.com.bpo.c2014 = full(sum(max(mapped_c_ia.t14.bpo.score, [], 2) ~= 0))/numel(tar_ia.t14.bpo)*100;
coverage.com.cco.c2014 = full(sum(max(mapped_c_ia.t14.cco.score, [], 2) ~= 0))/numel(tar_ia.t14.cco)*100;

df1.com.mfo.d2014 = f1max.com.mfo.g2014 - f1max.com.mfo.f2014;
df1.com.bpo.d2014 = f1max.com.bpo.g2014 - f1max.com.bpo.f2014;
df1.com.cco.d2014 = f1max.com.cco.g2014 - f1max.com.cco.f2014;

% median of rho
rho.mfo.r2014 = median(tarlist_ia.t14.mfo.delta ./ tarlist_ia.t14.mfo.gamma);
rho.bpo.r2014 = median(tarlist_ia.t14.bpo.delta ./ tarlist_ia.t14.bpo.gamma);
rho.cco.r2014 = median(tarlist_ia.t14.cco.delta ./ tarlist_ia.t14.cco.gamma);

%% printing
t_ptn1 = ['\\hline\n', ...
'& \\multicolumn{4}{c|}{Molecular function}\n', ...
'& \\multicolumn{4}{c}{Biological process}\n', ...
'& \\multicolumn{4}{|c}{Cellular component} \\\\ \\hline \\hline\n'];

t_ptn2 = ['&\n', ...
'$N$ & $M_{\\rho}$ & $F_{\\max}^{2011}$~(Coverage) & $\\Delta_{F_{\\max}}$ &\n', ...
'$N$ & $M_{\\rho}$ & $F_{\\max}^{2011}$~(Coverage) & $\\Delta_{F_{\\max}}$ &\n', ...
'$N$ & $M_{\\rho}$ & $F_{\\max}^{2011}$~(Coverage) & $\\Delta_{F_{\\max}}$ \\\\ \\hline \n'];

d_ptn1 = ['%s &\n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{$%.2f$} & $%.3f~(%.1f\\%%)$ & $%+.3f$ &\n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{$%.2f$} & $%.3f~(%.1f\\%%)$ & $%+.3f$ &\n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{$%.2f$} & $%.3f~(%.1f\\%%)$ & $%+.3f$ \\\\\n'];

d_ptn2 = ['%s &\n', ...
'& & $%.3f~(%.1f\\%%)$ & $%+.3f$ &\n', ...
'& & $%.3f~(%.1f\\%%)$ & $%+.3f$ &\n', ...
'& & $%.3f~(%.1f\\%%)$ & $%+.3f$ \\\\\n'];

fid = fopen('../table/f1max_table_ia.tex', 'w');

fprintf(fid, '\\begin{tabular}{c|cccc|cccc|cccc}\n');

fprintf(fid, t_ptn1);

fprintf(fid, t_ptn2);
fprintf(fid, d_ptn1, 'GOtcha', ...
    numel(tar_ia.t14.mfo), sigdigit(rho.mfo.r2014), sigdigit(f1max.gotcha.mfo.f2014), sigdigit(coverage.gotcha.mfo.c2014), sigdigit(df1.gotcha.mfo.d2014), ...
    numel(tar_ia.t14.bpo), sigdigit(rho.bpo.r2014), sigdigit(f1max.gotcha.bpo.f2014), sigdigit(coverage.gotcha.bpo.c2014), sigdigit(df1.gotcha.bpo.d2014), ...
    numel(tar_ia.t14.cco), sigdigit(rho.cco.r2014), sigdigit(f1max.gotcha.cco.f2014), sigdigit(coverage.gotcha.cco.c2014), sigdigit(df1.gotcha.cco.d2014));
fprintf(fid, d_ptn2, 'BLAST', ...
    sigdigit(f1max.blast.mfo.f2014), sigdigit(coverage.blast.mfo.c2014), sigdigit(df1.blast.mfo.d2014), ...
    sigdigit(f1max.blast.bpo.f2014), sigdigit(coverage.blast.bpo.c2014), sigdigit(df1.blast.bpo.d2014), ...
    sigdigit(f1max.blast.cco.f2014), sigdigit(coverage.blast.cco.c2014), sigdigit(df1.blast.cco.d2014));
fprintf(fid, d_ptn2, 'Swiss-Prot', ...
    sigdigit(f1max.com.mfo.f2014), sigdigit(coverage.com.mfo.c2014), sigdigit(df1.com.mfo.d2014), ...
    sigdigit(f1max.com.bpo.f2014), sigdigit(coverage.com.bpo.c2014), sigdigit(df1.com.bpo.d2014), ...
    sigdigit(f1max.com.cco.f2014), sigdigit(coverage.com.cco.c2014), sigdigit(df1.com.cco.d2014));
fprintf(fid, '\\hline\n');

fprintf(fid, '\\end{tabular}\n');
fclose(fid);

clear mapped_g* mapped_b* mapped_c* tar_ia t_ptn* d_ptn* fid f1max df1 coverage rho
