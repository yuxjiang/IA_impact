%script
%OUTPUT_F1MAX_TABLE Output F1-max table
%
% Note
% ----
% This script assumes the following variable presented in the working space.
%
% (Predictors)
% gotcha
% blast
% com
%
% (Target lists)
% tarlist_all
% tarlist_ia
%
% (Curves)
% gotcha_prcurve
% gotcha_prcurve_ia
% blast_prcurve
% blast_prcurve_ia
% com_prcurve
% com_prcurve_ia
%
% (Training sets)
% sp1001
%
% Dependency
% ----------
%[>]pfp_predproj.m
%[>]f1max_from_curve.m

% GOtcha {{{
f1max.gotcha.mfo.f2011 = f1max_from_curve(gotcha_prcurve.mfo.c2011);
f1max.gotcha.mfo.f2014 = f1max_from_curve(gotcha_prcurve.mfo.c2014);

f1max.gotcha.bpo.f2011 = f1max_from_curve(gotcha_prcurve.bpo.c2011);
f1max.gotcha.bpo.f2014 = f1max_from_curve(gotcha_prcurve.bpo.c2014);

f1max.gotcha.cco.f2011 = f1max_from_curve(gotcha_prcurve.cco.c2011);
f1max.gotcha.cco.f2014 = f1max_from_curve(gotcha_prcurve.cco.c2014);
% }}}

% BLAST {{{
f1max.blast.mfo.f2011 = f1max_from_curve(blast_prcurve.mfo.c2011);
f1max.blast.mfo.f2014 = f1max_from_curve(blast_prcurve.mfo.c2014);

f1max.blast.bpo.f2011 = f1max_from_curve(blast_prcurve.bpo.c2011);
f1max.blast.bpo.f2014 = f1max_from_curve(blast_prcurve.bpo.c2014);

f1max.blast.cco.f2011 = f1max_from_curve(blast_prcurve.cco.c2011);
f1max.blast.cco.f2014 = f1max_from_curve(blast_prcurve.cco.c2014);
% }}}

% Swiss-Prot {{{
f1max.com.mfo.f2011 = f1max_from_curve(com_prcurve.mfo.c2011);
f1max.com.mfo.f2014 = f1max_from_curve(com_prcurve.mfo.c2014);

f1max.com.bpo.f2011 = f1max_from_curve(com_prcurve.bpo.c2011);
f1max.com.bpo.f2014 = f1max_from_curve(com_prcurve.bpo.c2014);

f1max.com.cco.f2011 = f1max_from_curve(com_prcurve.cco.c2011);
f1max.com.cco.f2014 = f1max_from_curve(com_prcurve.cco.c2014);
% }}}

% difference of F_1 in percentage {{{
df1.gotcha.mfo = f1max.gotcha.mfo.f2014 - f1max.gotcha.mfo.f2011;
df1.gotcha.bpo = f1max.gotcha.bpo.f2014 - f1max.gotcha.bpo.f2011;
df1.gotcha.cco = f1max.gotcha.cco.f2014 - f1max.gotcha.cco.f2011;

df1.blast.mfo = f1max.blast.mfo.f2014 - f1max.blast.mfo.f2011;
df1.blast.bpo = f1max.blast.bpo.f2014 - f1max.blast.bpo.f2011;
df1.blast.cco = f1max.blast.cco.f2014 - f1max.blast.cco.f2011;

df1.com.mfo = f1max.com.mfo.f2014 - f1max.com.mfo.f2011;
df1.com.bpo = f1max.com.bpo.f2014 - f1max.com.bpo.f2011;
df1.com.cco = f1max.com.cco.f2014 - f1max.com.cco.f2011;

N_ts.mfo = numel(tarlist_all.mfo);
N_ts.bpo = numel(tarlist_all.bpo);
N_ts.cco = numel(tarlist_all.cco);

N_tr.mfo = numel(sp1001.mfoa.object);
N_tr.bpo = numel(sp1001.bpoa.object);
N_tr.cco = numel(sp1001.ccoa.object);
% }}}

% header pattern {{{
h_ptn1 = [...
'\\hline\n', ...
'& \\multicolumn{5}{c|}{Molecular function}\n', ...
'& \\multicolumn{5}{c}{Biological process}\n', ...
'& \\multicolumn{5}{|c}{Cellular component} \\\\ \\hline \\hline\n'];

h_ptn2 = ['&\n', ...
'$N$ & $N^{tr}$ & $F_{\\max}^{2011}$ & $F_{\\max}^{2014}$ & $\\Delta_{F_{\\max}}$ &\n', ...
'$N$ & $N^{tr}$ & $F_{\\max}^{2011}$ & $F_{\\max}^{2014}$ & $\\Delta_{F_{\\max}}$ &\n', ...
'$N$ & $N^{tr}$ & $F_{\\max}^{2011}$ & $F_{\\max}^{2014}$ & $\\Delta_{F_{\\max}}$ \\\\ \\hline \n'];
% }}}

% data pattern {{{
d_ptn1 = ['%s &\n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{$%d$} & $%.3f$ & $%.3f$ & $%+.3f$ &\n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{$%d$} & $%.3f$ & $%.3f$ & $%+.3f$ &\n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{$%d$} & $%.3f$ & $%.3f$ & $%+.3f$ \\\\\n'];

d_ptn2 = ['%s &\n', ...
'& & $%.3f$ & $%.3f$ & $%+.3f$ &\n', ...
'& & $%.3f$ & $%.3f$ & $%+.3f$ &\n', ...
'& & $%.3f$ & $%.3f$ & $%+.3f$ \\\\\n'];
% }}}

%% printing and cleaning {{{
fid = fopen('../table/f1max_table_all.tex', 'w');
fprintf(fid, '\\begin{tabular}{c|ccccc|ccccc|ccccc}\n');
fprintf(fid, h_ptn1);
fprintf(fid, h_ptn2);
fprintf(fid, d_ptn1, 'GOtcha', ...
    N_ts.mfo, N_tr.mfo, sigdigit(f1max.gotcha.mfo.f2011), sigdigit(f1max.gotcha.mfo.f2014), sigdigit(df1.gotcha.mfo), ...
    N_ts.bpo, N_tr.bpo, sigdigit(f1max.gotcha.bpo.f2011), sigdigit(f1max.gotcha.bpo.f2014), sigdigit(df1.gotcha.bpo), ...
    N_ts.cco, N_tr.cco, sigdigit(f1max.gotcha.cco.f2011), sigdigit(f1max.gotcha.cco.f2014), sigdigit(df1.gotcha.cco));
fprintf(fid, d_ptn2, 'BLAST', ...
    sigdigit(f1max.blast.mfo.f2011), sigdigit(f1max.blast.mfo.f2014), sigdigit(df1.blast.mfo), ...
    sigdigit(f1max.blast.bpo.f2011), sigdigit(f1max.blast.bpo.f2014), sigdigit(df1.blast.bpo), ...
    sigdigit(f1max.blast.cco.f2011), sigdigit(f1max.blast.cco.f2014), sigdigit(df1.blast.cco));
fprintf(fid, d_ptn2, 'Swiss-Prot', ...
    sigdigit(f1max.com.mfo.f2011), sigdigit(f1max.com.mfo.f2014), sigdigit(df1.com.mfo), ...
    sigdigit(f1max.com.bpo.f2011), sigdigit(f1max.com.bpo.f2014), sigdigit(df1.com.bpo), ...
    sigdigit(f1max.com.cco.f2011), sigdigit(f1max.com.cco.f2014), sigdigit(df1.com.cco));
fprintf(fid, '\\hline\n');
fprintf(fid, '\\end{tabular}\n');
fclose(fid);

clear h_ptn* d_ptn* gotcha_ptn* fid f1max df1 coverage rho N_ts N_tr
% }}}
