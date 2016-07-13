%script
%OUTPUT_S2MIN_TABLE Output F2-min table
%
% Require
% -------
%
% Predictors
% ----------
%   gotcha
%   blast
%   com
%
% Target Lists
% ------------
%   tarlist_all
%   tarlist_ia
%
% Curves
% ------
%   gotcha_prcurve
%   gotcha_prcurve_ia
%   blast_prcurve
%   blast_prcurve_ia
%   com_prcurve
%   com_prcurve_ia
%
% Training sets
% -------------
%   sp1001
%
% Dependence
% ----------
%   pfp_predproj.m
%   pfp_semdistmin.m
%
% -------------
% Yuxiang Jiang
% School of Informatics and Computing
% Indiana University Bloomington
% Last modified: Wed 02 Apr 2014 04:15:45 PM EDT

% GOtcha
s2min.gotcha.mfo.f2011 = pfp_semdistmin(gotcha_rmcurve.mfo.c2011);
s2min.gotcha.mfo.f2014 = pfp_semdistmin(gotcha_rmcurve.mfo.c2014);

s2min.gotcha.bpo.f2011 = pfp_semdistmin(gotcha_rmcurve.bpo.c2011);
s2min.gotcha.bpo.f2014 = pfp_semdistmin(gotcha_rmcurve.bpo.c2014);

s2min.gotcha.cco.f2011 = pfp_semdistmin(gotcha_rmcurve.cco.c2011);
s2min.gotcha.cco.f2014 = pfp_semdistmin(gotcha_rmcurve.cco.c2014);

% BLAST
s2min.blast.mfo.f2011 = pfp_semdistmin(blast_rmcurve.mfo.c2011);
s2min.blast.mfo.f2014 = pfp_semdistmin(blast_rmcurve.mfo.c2014);

s2min.blast.bpo.f2011 = pfp_semdistmin(blast_rmcurve.bpo.c2011);
s2min.blast.bpo.f2014 = pfp_semdistmin(blast_rmcurve.bpo.c2014);

s2min.blast.cco.f2011 = pfp_semdistmin(blast_rmcurve.cco.c2011);
s2min.blast.cco.f2014 = pfp_semdistmin(blast_rmcurve.cco.c2014);

% Swiss-Prot
s2min.com.mfo.f2011 = pfp_semdistmin(com_rmcurve.mfo.c2011);
s2min.com.mfo.f2014 = pfp_semdistmin(com_rmcurve.mfo.c2014);

s2min.com.bpo.f2011 = pfp_semdistmin(com_rmcurve.bpo.c2011);
s2min.com.bpo.f2014 = pfp_semdistmin(com_rmcurve.bpo.c2014);

s2min.com.cco.f2011 = pfp_semdistmin(com_rmcurve.cco.c2011);
s2min.com.cco.f2014 = pfp_semdistmin(com_rmcurve.cco.c2014);

% difference of F_1 in percentage
ds2.gotcha.mfo = s2min.gotcha.mfo.f2014 - s2min.gotcha.mfo.f2011;
ds2.gotcha.bpo = s2min.gotcha.bpo.f2014 - s2min.gotcha.bpo.f2011;
ds2.gotcha.cco = s2min.gotcha.cco.f2014 - s2min.gotcha.cco.f2011;

ds2.blast.mfo = s2min.blast.mfo.f2014 - s2min.blast.mfo.f2011;
ds2.blast.bpo = s2min.blast.bpo.f2014 - s2min.blast.bpo.f2011;
ds2.blast.cco = s2min.blast.cco.f2014 - s2min.blast.cco.f2011;

ds2.com.mfo = s2min.com.mfo.f2014 - s2min.com.mfo.f2011;
ds2.com.bpo = s2min.com.bpo.f2014 - s2min.com.bpo.f2011;
ds2.com.cco = s2min.com.cco.f2014 - s2min.com.cco.f2011;

N_ts.mfo = numel(tarlist_all.mfo);
N_ts.bpo = numel(tarlist_all.bpo);
N_ts.cco = numel(tarlist_all.cco);

N_tr.mfo = numel(sp1001.mfoa.object);
N_tr.bpo = numel(sp1001.bpoa.object);
N_tr.cco = numel(sp1001.ccoa.object);

% header pattern
h_ptn1 = [...
'\\hline\n', ...
'& \\multicolumn{5}{c|}{Molecular function}\n', ...
'& \\multicolumn{5}{c}{Biological process}\n', ...
'& \\multicolumn{5}{|c}{Cellular component} \\\\ \\hline \\hline\n'];

h_ptn2 = ['&\n', ...
'$N$ & $N^{tr}$ & $S_{\\min}^{2011}$ & $S_{\\min}^{2014}$ & $\\Delta_{S_{\\min}}$ &\n', ...
'$N$ & $N^{tr}$ & $S_{\\min}^{2011}$ & $S_{\\min}^{2014}$ & $\\Delta_{S_{\\min}}$ &\n', ...
'$N$ & $N^{tr}$ & $S_{\\min}^{2011}$ & $S_{\\min}^{2014}$ & $\\Delta_{S_{\\min}}$ \\\\ \\hline \n'];

% data pattern
d_ptn1 = ['%s &\n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{$%d$} & $%.2f$ & $%.2f$ & $%+.2f$ &\n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{$%d$} & $%.2f$ & $%.2f$ & $%+.2f$ &\n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{$%d$} & $%.2f$ & $%.2f$ & $%+.2f$ \\\\\n'];

d_ptn2 = ['%s &\n', ...
'& & $%.2f$ & $%.2f$ & $%+.2f$ &\n', ...
'& & $%.2f$ & $%.2f$ & $%+.2f$ &\n', ...
'& & $%.2f$ & $%.2f$ & $%+.2f$ \\\\\n'];

fid = fopen('../table/s2min_table_all.tex', 'w');

%% printing
fprintf(fid, '\\begin{tabular}{c|ccccc|ccccc|ccccc}\n');

fprintf(fid, h_ptn1);
fprintf(fid, h_ptn2);
fprintf(fid, d_ptn1, 'GOtcha', ...
    N_ts.mfo, N_tr.mfo, sigdigit(s2min.gotcha.mfo.f2011), sigdigit(s2min.gotcha.mfo.f2014), sigdigit(ds2.gotcha.mfo), ...
    N_ts.bpo, N_tr.bpo, sigdigit(s2min.gotcha.bpo.f2011), sigdigit(s2min.gotcha.bpo.f2014), sigdigit(ds2.gotcha.bpo), ...
    N_ts.cco, N_tr.cco, sigdigit(s2min.gotcha.cco.f2011), sigdigit(s2min.gotcha.cco.f2014), sigdigit(ds2.gotcha.cco));
fprintf(fid, d_ptn2, 'BLAST', ...
    sigdigit(s2min.blast.mfo.f2011), sigdigit(s2min.blast.mfo.f2014), sigdigit(ds2.blast.mfo), ...
    sigdigit(s2min.blast.bpo.f2011), sigdigit(s2min.blast.bpo.f2014), sigdigit(ds2.blast.bpo), ...
    sigdigit(s2min.blast.cco.f2011), sigdigit(s2min.blast.cco.f2014), sigdigit(ds2.blast.cco));
fprintf(fid, d_ptn2, 'Swiss-Prot', ...
    sigdigit(s2min.com.mfo.f2011), sigdigit(s2min.com.mfo.f2014), sigdigit(ds2.com.mfo), ...
    sigdigit(s2min.com.bpo.f2011), sigdigit(s2min.com.bpo.f2014), sigdigit(ds2.com.bpo), ...
    sigdigit(s2min.com.cco.f2011), sigdigit(s2min.com.cco.f2014), sigdigit(ds2.com.cco));
fprintf(fid, '\\hline\n');

fprintf(fid, '\\end{tabular}\n');
fclose(fid);

clear h_ptn* d_ptn* gotcha_ptn* fid s2min ds2 coverage rho N_ts N_tr
