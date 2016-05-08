%GENERATE_PRCURVES Generate Precision-Recall curves
%
% This script assumes the following structure presented 
% in the working space
%
%   [[:target proteins:]]
%      ---------------
%   tarlist_all
%       [bpo], [cco], [mfo]
%
%   tarlist_ia
%       t12 (bpo, cco, mfo)
%       t13 (bpo, cco, mfo)
%       t14 (bpo, cco, mfo)
%
%   [[:predictors:]]
%      ----------
%   gotcha - GOtcha predictor
%       [bpo], [cco], [mfo]
%
%   blast - BLAST predictor
%       [bpo], [cco], [mfo]
%
%   com - Swiss-Prot computational annotation
%       [bpo], [cco], [mfo]
%
%   [[:ontology annotation:]]
%      -------------------
%   sp1101
%       [bpoa], [ccoa], [mfoa]
%
%   sp1201
%       [bpoa], [ccoa], [mfoa]
%
%   sp1301
%       [bpoa], [ccoa], [mfoa]
%
%   sp1401
%       [bpoa], [ccoa], [mfoa]
%
% This script produces:
%   gotcha_prcurve
%   gotcha_prcurve_ia
%   blast_prcurve
%   blast_prcurve_ia
%   com_prcurve
%   com_prcurve
%
% -------------
% Yuxiang Jiang
% School of Informatics and Computing
% Indiana University Bloomington
% Last modified: Fri 04 Apr 2014 09:33:02 AM EDT

tar_ia.t12.bpo = tarlist_ia.t12.bpo.object;
tar_ia.t12.cco = tarlist_ia.t12.cco.object;
tar_ia.t12.mfo = tarlist_ia.t12.mfo.object;

tar_ia.t13.bpo = tarlist_ia.t13.bpo.object;
tar_ia.t13.cco = tarlist_ia.t13.cco.object;
tar_ia.t13.mfo = tarlist_ia.t13.mfo.object;

tar_ia.t14.bpo = tarlist_ia.t14.bpo.object;
tar_ia.t14.cco = tarlist_ia.t14.cco.object;
tar_ia.t14.mfo = tarlist_ia.t14.mfo.object;

% resolution
resol = 100;
mode = 2;

% GOtcha Precision-Recall curves
gotcha_prcurve.bpo.c2011 = pfp_avgprcurve(tarlist_all.bpo, mode, gotcha.bpo, sp1101.bpoa, resol);
gotcha_prcurve.bpo.c2012 = pfp_avgprcurve(tarlist_all.bpo, mode, gotcha.bpo, sp1201.bpoa, resol);
gotcha_prcurve.bpo.c2013 = pfp_avgprcurve(tarlist_all.bpo, mode, gotcha.bpo, sp1301.bpoa, resol);
gotcha_prcurve.bpo.c2014 = pfp_avgprcurve(tarlist_all.bpo, mode, gotcha.bpo, sp1401.bpoa, resol);

gotcha_prcurve.cco.c2011 = pfp_avgprcurve(tarlist_all.cco, mode, gotcha.cco, sp1101.ccoa, resol);
gotcha_prcurve.cco.c2012 = pfp_avgprcurve(tarlist_all.cco, mode, gotcha.cco, sp1201.ccoa, resol);
gotcha_prcurve.cco.c2013 = pfp_avgprcurve(tarlist_all.cco, mode, gotcha.cco, sp1301.ccoa, resol);
gotcha_prcurve.cco.c2014 = pfp_avgprcurve(tarlist_all.cco, mode, gotcha.cco, sp1401.ccoa, resol);

gotcha_prcurve.mfo.c2011 = pfp_avgprcurve(tarlist_all.mfo, mode, gotcha.mfo, sp1101.mfoa, resol);
gotcha_prcurve.mfo.c2012 = pfp_avgprcurve(tarlist_all.mfo, mode, gotcha.mfo, sp1201.mfoa, resol);
gotcha_prcurve.mfo.c2013 = pfp_avgprcurve(tarlist_all.mfo, mode, gotcha.mfo, sp1301.mfoa, resol);
gotcha_prcurve.mfo.c2014 = pfp_avgprcurve(tarlist_all.mfo, mode, gotcha.mfo, sp1401.mfoa, resol);

% the ia subset
gotcha_prcurve_ia.bpo.b2012 = pfp_avgprcurve(tar_ia.t12.bpo, mode, gotcha.bpo, sp1101.bpoa, resol);
gotcha_prcurve_ia.bpo.b2013 = pfp_avgprcurve(tar_ia.t13.bpo, mode, gotcha.bpo, sp1101.bpoa, resol);
gotcha_prcurve_ia.bpo.b2014 = pfp_avgprcurve(tar_ia.t14.bpo, mode, gotcha.bpo, sp1101.bpoa, resol);

gotcha_prcurve_ia.cco.b2012 = pfp_avgprcurve(tar_ia.t12.cco, mode, gotcha.cco, sp1101.ccoa, resol);
gotcha_prcurve_ia.cco.b2013 = pfp_avgprcurve(tar_ia.t13.cco, mode, gotcha.cco, sp1101.ccoa, resol);
gotcha_prcurve_ia.cco.b2014 = pfp_avgprcurve(tar_ia.t14.cco, mode, gotcha.cco, sp1101.ccoa, resol);

gotcha_prcurve_ia.mfo.b2012 = pfp_avgprcurve(tar_ia.t12.mfo, mode, gotcha.mfo, sp1101.mfoa, resol);
gotcha_prcurve_ia.mfo.b2013 = pfp_avgprcurve(tar_ia.t13.mfo, mode, gotcha.mfo, sp1101.mfoa, resol);
gotcha_prcurve_ia.mfo.b2014 = pfp_avgprcurve(tar_ia.t14.mfo, mode, gotcha.mfo, sp1101.mfoa, resol);

gotcha_prcurve_ia.bpo.c2012 = pfp_avgprcurve(tar_ia.t12.bpo, mode, gotcha.bpo, sp1201.bpoa, resol);
gotcha_prcurve_ia.bpo.c2013 = pfp_avgprcurve(tar_ia.t13.bpo, mode, gotcha.bpo, sp1301.bpoa, resol);
gotcha_prcurve_ia.bpo.c2014 = pfp_avgprcurve(tar_ia.t14.bpo, mode, gotcha.bpo, sp1401.bpoa, resol);

gotcha_prcurve_ia.cco.c2012 = pfp_avgprcurve(tar_ia.t12.cco, mode, gotcha.cco, sp1201.ccoa, resol);
gotcha_prcurve_ia.cco.c2013 = pfp_avgprcurve(tar_ia.t13.cco, mode, gotcha.cco, sp1301.ccoa, resol);
gotcha_prcurve_ia.cco.c2014 = pfp_avgprcurve(tar_ia.t14.cco, mode, gotcha.cco, sp1401.ccoa, resol);

gotcha_prcurve_ia.mfo.c2012 = pfp_avgprcurve(tar_ia.t12.mfo, mode, gotcha.mfo, sp1201.mfoa, resol);
gotcha_prcurve_ia.mfo.c2013 = pfp_avgprcurve(tar_ia.t13.mfo, mode, gotcha.mfo, sp1301.mfoa, resol);
gotcha_prcurve_ia.mfo.c2014 = pfp_avgprcurve(tar_ia.t14.mfo, mode, gotcha.mfo, sp1401.mfoa, resol);

% BLAST Precision-Recall curves
blast_prcurve.bpo.c2011 = pfp_avgprcurve(tarlist_all.bpo, mode, blast.bpo, sp1101.bpoa, resol);
blast_prcurve.bpo.c2012 = pfp_avgprcurve(tarlist_all.bpo, mode, blast.bpo, sp1201.bpoa, resol);
blast_prcurve.bpo.c2013 = pfp_avgprcurve(tarlist_all.bpo, mode, blast.bpo, sp1301.bpoa, resol);
blast_prcurve.bpo.c2014 = pfp_avgprcurve(tarlist_all.bpo, mode, blast.bpo, sp1401.bpoa, resol);

blast_prcurve.cco.c2011 = pfp_avgprcurve(tarlist_all.cco, mode, blast.cco, sp1101.ccoa, resol);
blast_prcurve.cco.c2012 = pfp_avgprcurve(tarlist_all.cco, mode, blast.cco, sp1201.ccoa, resol);
blast_prcurve.cco.c2013 = pfp_avgprcurve(tarlist_all.cco, mode, blast.cco, sp1301.ccoa, resol);
blast_prcurve.cco.c2014 = pfp_avgprcurve(tarlist_all.cco, mode, blast.cco, sp1401.ccoa, resol);

blast_prcurve.mfo.c2011 = pfp_avgprcurve(tarlist_all.mfo, mode, blast.mfo, sp1101.mfoa, resol);
blast_prcurve.mfo.c2012 = pfp_avgprcurve(tarlist_all.mfo, mode, blast.mfo, sp1201.mfoa, resol);
blast_prcurve.mfo.c2013 = pfp_avgprcurve(tarlist_all.mfo, mode, blast.mfo, sp1301.mfoa, resol);
blast_prcurve.mfo.c2014 = pfp_avgprcurve(tarlist_all.mfo, mode, blast.mfo, sp1401.mfoa, resol);

% the ia subset
blast_prcurve_ia.bpo.b2012 = pfp_avgprcurve(tar_ia.t12.bpo, mode, blast.bpo, sp1101.bpoa, resol);
blast_prcurve_ia.bpo.b2013 = pfp_avgprcurve(tar_ia.t13.bpo, mode, blast.bpo, sp1101.bpoa, resol);
blast_prcurve_ia.bpo.b2014 = pfp_avgprcurve(tar_ia.t14.bpo, mode, blast.bpo, sp1101.bpoa, resol);

blast_prcurve_ia.cco.b2012 = pfp_avgprcurve(tar_ia.t12.cco, mode, blast.cco, sp1101.ccoa, resol);
blast_prcurve_ia.cco.b2013 = pfp_avgprcurve(tar_ia.t13.cco, mode, blast.cco, sp1101.ccoa, resol);
blast_prcurve_ia.cco.b2014 = pfp_avgprcurve(tar_ia.t14.cco, mode, blast.cco, sp1101.ccoa, resol);

blast_prcurve_ia.mfo.b2012 = pfp_avgprcurve(tar_ia.t12.mfo, mode, blast.mfo, sp1101.mfoa, resol);
blast_prcurve_ia.mfo.b2013 = pfp_avgprcurve(tar_ia.t13.mfo, mode, blast.mfo, sp1101.mfoa, resol);
blast_prcurve_ia.mfo.b2014 = pfp_avgprcurve(tar_ia.t14.mfo, mode, blast.mfo, sp1101.mfoa, resol);

blast_prcurve_ia.bpo.c2012 = pfp_avgprcurve(tar_ia.t12.bpo, mode, blast.bpo, sp1201.bpoa, resol);
blast_prcurve_ia.bpo.c2013 = pfp_avgprcurve(tar_ia.t13.bpo, mode, blast.bpo, sp1301.bpoa, resol);
blast_prcurve_ia.bpo.c2014 = pfp_avgprcurve(tar_ia.t14.bpo, mode, blast.bpo, sp1401.bpoa, resol);

blast_prcurve_ia.cco.c2012 = pfp_avgprcurve(tar_ia.t12.cco, mode, blast.cco, sp1201.ccoa, resol);
blast_prcurve_ia.cco.c2013 = pfp_avgprcurve(tar_ia.t13.cco, mode, blast.cco, sp1301.ccoa, resol);
blast_prcurve_ia.cco.c2014 = pfp_avgprcurve(tar_ia.t14.cco, mode, blast.cco, sp1401.ccoa, resol);

blast_prcurve_ia.mfo.c2012 = pfp_avgprcurve(tar_ia.t12.mfo, mode, blast.mfo, sp1201.mfoa, resol);
blast_prcurve_ia.mfo.c2013 = pfp_avgprcurve(tar_ia.t13.mfo, mode, blast.mfo, sp1301.mfoa, resol);
blast_prcurve_ia.mfo.c2014 = pfp_avgprcurve(tar_ia.t14.mfo, mode, blast.mfo, sp1401.mfoa, resol);

% Swiss-Prot computational annotation Precision-Recall curves
com_prcurve.bpo.c2011 = pfp_avgprcurve(tarlist_all.bpo, mode, com.bpo, sp1101.bpoa, resol);
com_prcurve.bpo.c2012 = pfp_avgprcurve(tarlist_all.bpo, mode, com.bpo, sp1201.bpoa, resol);
com_prcurve.bpo.c2013 = pfp_avgprcurve(tarlist_all.bpo, mode, com.bpo, sp1301.bpoa, resol);
com_prcurve.bpo.c2014 = pfp_avgprcurve(tarlist_all.bpo, mode, com.bpo, sp1401.bpoa, resol);

com_prcurve.cco.c2011 = pfp_avgprcurve(tarlist_all.cco, mode, com.cco, sp1101.ccoa, resol);
com_prcurve.cco.c2012 = pfp_avgprcurve(tarlist_all.cco, mode, com.cco, sp1201.ccoa, resol);
com_prcurve.cco.c2013 = pfp_avgprcurve(tarlist_all.cco, mode, com.cco, sp1301.ccoa, resol);
com_prcurve.cco.c2014 = pfp_avgprcurve(tarlist_all.cco, mode, com.cco, sp1401.ccoa, resol);

com_prcurve.mfo.c2011 = pfp_avgprcurve(tarlist_all.mfo, mode, com.mfo, sp1101.mfoa, resol);
com_prcurve.mfo.c2012 = pfp_avgprcurve(tarlist_all.mfo, mode, com.mfo, sp1201.mfoa, resol);
com_prcurve.mfo.c2013 = pfp_avgprcurve(tarlist_all.mfo, mode, com.mfo, sp1301.mfoa, resol);
com_prcurve.mfo.c2014 = pfp_avgprcurve(tarlist_all.mfo, mode, com.mfo, sp1401.mfoa, resol);

% the ia subset
com_prcurve_ia.bpo.b2012 = pfp_avgprcurve(tar_ia.t12.bpo, mode, com.bpo, sp1101.bpoa, resol);
com_prcurve_ia.bpo.b2013 = pfp_avgprcurve(tar_ia.t13.bpo, mode, com.bpo, sp1101.bpoa, resol);
com_prcurve_ia.bpo.b2014 = pfp_avgprcurve(tar_ia.t14.bpo, mode, com.bpo, sp1101.bpoa, resol);

com_prcurve_ia.cco.b2012 = pfp_avgprcurve(tar_ia.t12.cco, mode, com.cco, sp1101.ccoa, resol);
com_prcurve_ia.cco.b2013 = pfp_avgprcurve(tar_ia.t13.cco, mode, com.cco, sp1101.ccoa, resol);
com_prcurve_ia.cco.b2014 = pfp_avgprcurve(tar_ia.t14.cco, mode, com.cco, sp1101.ccoa, resol);

com_prcurve_ia.mfo.b2012 = pfp_avgprcurve(tar_ia.t12.mfo, mode, com.mfo, sp1101.mfoa, resol);
com_prcurve_ia.mfo.b2013 = pfp_avgprcurve(tar_ia.t13.mfo, mode, com.mfo, sp1101.mfoa, resol);
com_prcurve_ia.mfo.b2014 = pfp_avgprcurve(tar_ia.t14.mfo, mode, com.mfo, sp1101.mfoa, resol);

com_prcurve_ia.bpo.c2012 = pfp_avgprcurve(tar_ia.t12.bpo, mode, com.bpo, sp1201.bpoa, resol);
com_prcurve_ia.bpo.c2013 = pfp_avgprcurve(tar_ia.t13.bpo, mode, com.bpo, sp1301.bpoa, resol);
com_prcurve_ia.bpo.c2014 = pfp_avgprcurve(tar_ia.t14.bpo, mode, com.bpo, sp1401.bpoa, resol);

com_prcurve_ia.cco.c2012 = pfp_avgprcurve(tar_ia.t12.cco, mode, com.cco, sp1201.ccoa, resol);
com_prcurve_ia.cco.c2013 = pfp_avgprcurve(tar_ia.t13.cco, mode, com.cco, sp1301.ccoa, resol);
com_prcurve_ia.cco.c2014 = pfp_avgprcurve(tar_ia.t14.cco, mode, com.cco, sp1401.ccoa, resol);

com_prcurve_ia.mfo.c2012 = pfp_avgprcurve(tar_ia.t12.mfo, mode, com.mfo, sp1201.mfoa, resol);
com_prcurve_ia.mfo.c2013 = pfp_avgprcurve(tar_ia.t13.mfo, mode, com.mfo, sp1301.mfoa, resol);
com_prcurve_ia.mfo.c2014 = pfp_avgprcurve(tar_ia.t14.mfo, mode, com.mfo, sp1401.mfoa, resol);

% clearing
clear tar_ia resol
% end
