%script
%GENERATE_RMCURVES Generate RU-MI curves
%
% [] = GENERATE_RMCURVES;
%
% Require
% -------
% (target proteins)
% tarlist_all
%   .bpo, .cco, .mfo
%
% tarlist_ia
%   .t12 (.bpo, .cco, .mfo)
%   .t13 (.bpo, .cco, .mfo)
%   .t14 (.bpo, .cco, .mfo)
%
% (predictors)
% gotcha - GOtcha predictor
%   .bpo, .cco, .mfo
%
% blast - BLAST predictor
%   .bpo, .cco, .mfo
%
% com - Swiss-Prot computational annotation
%   .bpo, .cco, .mfo
%
% (ontology annotation)
% sp1101
%   .bpoa, .ccoa, .mfoa
%
% sp1201
%   .bpoa, .ccoa, .mfoa
%
% sp1301
%   .bpoa, .ccoa, .mfoa
%
% sp1401
%   .bpoa, .ccoa, .mfoa
%
% Provide
% -------
% gotcha_rmcurve
% gotcha_rmcurve_ia
% blast_rmcurve
% blast_rmcurve_ia
% com_rmcurve
% com_rmcurve

% setting up {{{
tar_ia.t12.bpo = tarlist_ia.t12.bpo.object;
tar_ia.t12.cco = tarlist_ia.t12.cco.object;
tar_ia.t12.mfo = tarlist_ia.t12.mfo.object;

tar_ia.t13.bpo = tarlist_ia.t13.bpo.object;
tar_ia.t13.cco = tarlist_ia.t13.cco.object;
tar_ia.t13.mfo = tarlist_ia.t13.mfo.object;

tar_ia.t14.bpo = tarlist_ia.t14.bpo.object;
tar_ia.t14.cco = tarlist_ia.t14.cco.object;
tar_ia.t14.mfo = tarlist_ia.t14.mfo.object;

resol = 100;
mode = 2;
% }}}

% GOtcha RU-MI curves {{{
gotcha_rmcurve.bpo.c2011 = pfp_avgrmcurve(tarlist_all.bpo, mode, gotcha.bpo, sp1101.bpoa, ia.bpo, resol);
gotcha_rmcurve.bpo.c2012 = pfp_avgrmcurve(tarlist_all.bpo, mode, gotcha.bpo, sp1201.bpoa, ia.bpo, resol);
gotcha_rmcurve.bpo.c2013 = pfp_avgrmcurve(tarlist_all.bpo, mode, gotcha.bpo, sp1301.bpoa, ia.bpo, resol);
gotcha_rmcurve.bpo.c2014 = pfp_avgrmcurve(tarlist_all.bpo, mode, gotcha.bpo, sp1401.bpoa, ia.bpo, resol);

gotcha_rmcurve.cco.c2011 = pfp_avgrmcurve(tarlist_all.cco, mode, gotcha.cco, sp1101.ccoa, ia.cco, resol);
gotcha_rmcurve.cco.c2012 = pfp_avgrmcurve(tarlist_all.cco, mode, gotcha.cco, sp1201.ccoa, ia.cco, resol);
gotcha_rmcurve.cco.c2013 = pfp_avgrmcurve(tarlist_all.cco, mode, gotcha.cco, sp1301.ccoa, ia.cco, resol);
gotcha_rmcurve.cco.c2014 = pfp_avgrmcurve(tarlist_all.cco, mode, gotcha.cco, sp1401.ccoa, ia.cco, resol);

gotcha_rmcurve.mfo.c2011 = pfp_avgrmcurve(tarlist_all.mfo, mode, gotcha.mfo, sp1101.mfoa, ia.mfo, resol);
gotcha_rmcurve.mfo.c2012 = pfp_avgrmcurve(tarlist_all.mfo, mode, gotcha.mfo, sp1201.mfoa, ia.mfo, resol);
gotcha_rmcurve.mfo.c2013 = pfp_avgrmcurve(tarlist_all.mfo, mode, gotcha.mfo, sp1301.mfoa, ia.mfo, resol);
gotcha_rmcurve.mfo.c2014 = pfp_avgrmcurve(tarlist_all.mfo, mode, gotcha.mfo, sp1401.mfoa, ia.mfo, resol);

% the ia subset
gotcha_rmcurve_ia.bpo.b2012 = pfp_avgrmcurve(tar_ia.t12.bpo, mode, gotcha.bpo, sp1101.bpoa, ia.bpo, resol);
gotcha_rmcurve_ia.bpo.b2013 = pfp_avgrmcurve(tar_ia.t13.bpo, mode, gotcha.bpo, sp1101.bpoa, ia.bpo, resol);
gotcha_rmcurve_ia.bpo.b2014 = pfp_avgrmcurve(tar_ia.t14.bpo, mode, gotcha.bpo, sp1101.bpoa, ia.bpo, resol);

gotcha_rmcurve_ia.cco.b2012 = pfp_avgrmcurve(tar_ia.t12.cco, mode, gotcha.cco, sp1101.ccoa, ia.cco, resol);
gotcha_rmcurve_ia.cco.b2013 = pfp_avgrmcurve(tar_ia.t13.cco, mode, gotcha.cco, sp1101.ccoa, ia.cco, resol);
gotcha_rmcurve_ia.cco.b2014 = pfp_avgrmcurve(tar_ia.t14.cco, mode, gotcha.cco, sp1101.ccoa, ia.cco, resol);

gotcha_rmcurve_ia.mfo.b2012 = pfp_avgrmcurve(tar_ia.t12.mfo, mode, gotcha.mfo, sp1101.mfoa, ia.mfo, resol);
gotcha_rmcurve_ia.mfo.b2013 = pfp_avgrmcurve(tar_ia.t13.mfo, mode, gotcha.mfo, sp1101.mfoa, ia.mfo, resol);
gotcha_rmcurve_ia.mfo.b2014 = pfp_avgrmcurve(tar_ia.t14.mfo, mode, gotcha.mfo, sp1101.mfoa, ia.mfo, resol);

gotcha_rmcurve_ia.bpo.c2012 = pfp_avgrmcurve(tar_ia.t12.bpo, mode, gotcha.bpo, sp1201.bpoa, ia.bpo, resol);
gotcha_rmcurve_ia.bpo.c2013 = pfp_avgrmcurve(tar_ia.t13.bpo, mode, gotcha.bpo, sp1301.bpoa, ia.bpo, resol);
gotcha_rmcurve_ia.bpo.c2014 = pfp_avgrmcurve(tar_ia.t14.bpo, mode, gotcha.bpo, sp1401.bpoa, ia.bpo, resol);

gotcha_rmcurve_ia.cco.c2012 = pfp_avgrmcurve(tar_ia.t12.cco, mode, gotcha.cco, sp1201.ccoa, ia.cco, resol);
gotcha_rmcurve_ia.cco.c2013 = pfp_avgrmcurve(tar_ia.t13.cco, mode, gotcha.cco, sp1301.ccoa, ia.cco, resol);
gotcha_rmcurve_ia.cco.c2014 = pfp_avgrmcurve(tar_ia.t14.cco, mode, gotcha.cco, sp1401.ccoa, ia.cco, resol);

gotcha_rmcurve_ia.mfo.c2012 = pfp_avgrmcurve(tar_ia.t12.mfo, mode, gotcha.mfo, sp1201.mfoa, ia.mfo, resol);
gotcha_rmcurve_ia.mfo.c2013 = pfp_avgrmcurve(tar_ia.t13.mfo, mode, gotcha.mfo, sp1301.mfoa, ia.mfo, resol);
gotcha_rmcurve_ia.mfo.c2014 = pfp_avgrmcurve(tar_ia.t14.mfo, mode, gotcha.mfo, sp1401.mfoa, ia.mfo, resol);
% }}}

% BLAST RU-MI curves {{{
blast_rmcurve.bpo.c2011 = pfp_avgrmcurve(tarlist_all.bpo, mode, blast.bpo, sp1101.bpoa, ia.bpo, resol);
blast_rmcurve.bpo.c2012 = pfp_avgrmcurve(tarlist_all.bpo, mode, blast.bpo, sp1201.bpoa, ia.bpo, resol);
blast_rmcurve.bpo.c2013 = pfp_avgrmcurve(tarlist_all.bpo, mode, blast.bpo, sp1301.bpoa, ia.bpo, resol);
blast_rmcurve.bpo.c2014 = pfp_avgrmcurve(tarlist_all.bpo, mode, blast.bpo, sp1401.bpoa, ia.bpo, resol);

blast_rmcurve.cco.c2011 = pfp_avgrmcurve(tarlist_all.cco, mode, blast.cco, sp1101.ccoa, ia.cco, resol);
blast_rmcurve.cco.c2012 = pfp_avgrmcurve(tarlist_all.cco, mode, blast.cco, sp1201.ccoa, ia.cco, resol);
blast_rmcurve.cco.c2013 = pfp_avgrmcurve(tarlist_all.cco, mode, blast.cco, sp1301.ccoa, ia.cco, resol);
blast_rmcurve.cco.c2014 = pfp_avgrmcurve(tarlist_all.cco, mode, blast.cco, sp1401.ccoa, ia.cco, resol);

blast_rmcurve.mfo.c2011 = pfp_avgrmcurve(tarlist_all.mfo, mode, blast.mfo, sp1101.mfoa, ia.mfo, resol);
blast_rmcurve.mfo.c2012 = pfp_avgrmcurve(tarlist_all.mfo, mode, blast.mfo, sp1201.mfoa, ia.mfo, resol);
blast_rmcurve.mfo.c2013 = pfp_avgrmcurve(tarlist_all.mfo, mode, blast.mfo, sp1301.mfoa, ia.mfo, resol);
blast_rmcurve.mfo.c2014 = pfp_avgrmcurve(tarlist_all.mfo, mode, blast.mfo, sp1401.mfoa, ia.mfo, resol);

% the ia subset
blast_rmcurve_ia.bpo.b2012 = pfp_avgrmcurve(tar_ia.t12.bpo, mode, blast.bpo, sp1101.bpoa, ia.bpo, resol);
blast_rmcurve_ia.bpo.b2013 = pfp_avgrmcurve(tar_ia.t13.bpo, mode, blast.bpo, sp1101.bpoa, ia.bpo, resol);
blast_rmcurve_ia.bpo.b2014 = pfp_avgrmcurve(tar_ia.t14.bpo, mode, blast.bpo, sp1101.bpoa, ia.bpo, resol);

blast_rmcurve_ia.cco.b2012 = pfp_avgrmcurve(tar_ia.t12.cco, mode, blast.cco, sp1101.ccoa, ia.cco, resol);
blast_rmcurve_ia.cco.b2013 = pfp_avgrmcurve(tar_ia.t13.cco, mode, blast.cco, sp1101.ccoa, ia.cco, resol);
blast_rmcurve_ia.cco.b2014 = pfp_avgrmcurve(tar_ia.t14.cco, mode, blast.cco, sp1101.ccoa, ia.cco, resol);

blast_rmcurve_ia.mfo.b2012 = pfp_avgrmcurve(tar_ia.t12.mfo, mode, blast.mfo, sp1101.mfoa, ia.mfo, resol);
blast_rmcurve_ia.mfo.b2013 = pfp_avgrmcurve(tar_ia.t13.mfo, mode, blast.mfo, sp1101.mfoa, ia.mfo, resol);
blast_rmcurve_ia.mfo.b2014 = pfp_avgrmcurve(tar_ia.t14.mfo, mode, blast.mfo, sp1101.mfoa, ia.mfo, resol);

blast_rmcurve_ia.bpo.c2012 = pfp_avgrmcurve(tar_ia.t12.bpo, mode, blast.bpo, sp1201.bpoa, ia.bpo, resol);
blast_rmcurve_ia.bpo.c2013 = pfp_avgrmcurve(tar_ia.t13.bpo, mode, blast.bpo, sp1301.bpoa, ia.bpo, resol);
blast_rmcurve_ia.bpo.c2014 = pfp_avgrmcurve(tar_ia.t14.bpo, mode, blast.bpo, sp1401.bpoa, ia.bpo, resol);

blast_rmcurve_ia.cco.c2012 = pfp_avgrmcurve(tar_ia.t12.cco, mode, blast.cco, sp1201.ccoa, ia.cco, resol);
blast_rmcurve_ia.cco.c2013 = pfp_avgrmcurve(tar_ia.t13.cco, mode, blast.cco, sp1301.ccoa, ia.cco, resol);
blast_rmcurve_ia.cco.c2014 = pfp_avgrmcurve(tar_ia.t14.cco, mode, blast.cco, sp1401.ccoa, ia.cco, resol);

blast_rmcurve_ia.mfo.c2012 = pfp_avgrmcurve(tar_ia.t12.mfo, mode, blast.mfo, sp1201.mfoa, ia.mfo, resol);
blast_rmcurve_ia.mfo.c2013 = pfp_avgrmcurve(tar_ia.t13.mfo, mode, blast.mfo, sp1301.mfoa, ia.mfo, resol);
blast_rmcurve_ia.mfo.c2014 = pfp_avgrmcurve(tar_ia.t14.mfo, mode, blast.mfo, sp1401.mfoa, ia.mfo, resol);
% }}}

% Swiss-Prot computational annotation RU-MI curves {{{
com_rmcurve.bpo.c2011 = pfp_avgrmcurve(tarlist_all.bpo, mode, com.bpo, sp1101.bpoa, ia.bpo, resol);
com_rmcurve.bpo.c2012 = pfp_avgrmcurve(tarlist_all.bpo, mode, com.bpo, sp1201.bpoa, ia.bpo, resol);
com_rmcurve.bpo.c2013 = pfp_avgrmcurve(tarlist_all.bpo, mode, com.bpo, sp1301.bpoa, ia.bpo, resol);
com_rmcurve.bpo.c2014 = pfp_avgrmcurve(tarlist_all.bpo, mode, com.bpo, sp1401.bpoa, ia.bpo, resol);

com_rmcurve.cco.c2011 = pfp_avgrmcurve(tarlist_all.cco, mode, com.cco, sp1101.ccoa, ia.cco, resol);
com_rmcurve.cco.c2012 = pfp_avgrmcurve(tarlist_all.cco, mode, com.cco, sp1201.ccoa, ia.cco, resol);
com_rmcurve.cco.c2013 = pfp_avgrmcurve(tarlist_all.cco, mode, com.cco, sp1301.ccoa, ia.cco, resol);
com_rmcurve.cco.c2014 = pfp_avgrmcurve(tarlist_all.cco, mode, com.cco, sp1401.ccoa, ia.cco, resol);

com_rmcurve.mfo.c2011 = pfp_avgrmcurve(tarlist_all.mfo, mode, com.mfo, sp1101.mfoa, ia.mfo, resol);
com_rmcurve.mfo.c2012 = pfp_avgrmcurve(tarlist_all.mfo, mode, com.mfo, sp1201.mfoa, ia.mfo, resol);
com_rmcurve.mfo.c2013 = pfp_avgrmcurve(tarlist_all.mfo, mode, com.mfo, sp1301.mfoa, ia.mfo, resol);
com_rmcurve.mfo.c2014 = pfp_avgrmcurve(tarlist_all.mfo, mode, com.mfo, sp1401.mfoa, ia.mfo, resol);

% the ia subset
com_rmcurve_ia.bpo.b2012 = pfp_avgrmcurve(tar_ia.t12.bpo, mode, com.bpo, sp1101.bpoa, ia.bpo, resol);
com_rmcurve_ia.bpo.b2013 = pfp_avgrmcurve(tar_ia.t13.bpo, mode, com.bpo, sp1101.bpoa, ia.bpo, resol);
com_rmcurve_ia.bpo.b2014 = pfp_avgrmcurve(tar_ia.t14.bpo, mode, com.bpo, sp1101.bpoa, ia.bpo, resol);

com_rmcurve_ia.cco.b2012 = pfp_avgrmcurve(tar_ia.t12.cco, mode, com.cco, sp1101.ccoa, ia.cco, resol);
com_rmcurve_ia.cco.b2013 = pfp_avgrmcurve(tar_ia.t13.cco, mode, com.cco, sp1101.ccoa, ia.cco, resol);
com_rmcurve_ia.cco.b2014 = pfp_avgrmcurve(tar_ia.t14.cco, mode, com.cco, sp1101.ccoa, ia.cco, resol);

com_rmcurve_ia.mfo.b2012 = pfp_avgrmcurve(tar_ia.t12.mfo, mode, com.mfo, sp1101.mfoa, ia.mfo, resol);
com_rmcurve_ia.mfo.b2013 = pfp_avgrmcurve(tar_ia.t13.mfo, mode, com.mfo, sp1101.mfoa, ia.mfo, resol);
com_rmcurve_ia.mfo.b2014 = pfp_avgrmcurve(tar_ia.t14.mfo, mode, com.mfo, sp1101.mfoa, ia.mfo, resol);

com_rmcurve_ia.bpo.c2012 = pfp_avgrmcurve(tar_ia.t12.bpo, mode, com.bpo, sp1201.bpoa, ia.bpo, resol);
com_rmcurve_ia.bpo.c2013 = pfp_avgrmcurve(tar_ia.t13.bpo, mode, com.bpo, sp1301.bpoa, ia.bpo, resol);
com_rmcurve_ia.bpo.c2014 = pfp_avgrmcurve(tar_ia.t14.bpo, mode, com.bpo, sp1401.bpoa, ia.bpo, resol);

com_rmcurve_ia.cco.c2012 = pfp_avgrmcurve(tar_ia.t12.cco, mode, com.cco, sp1201.ccoa, ia.cco, resol);
com_rmcurve_ia.cco.c2013 = pfp_avgrmcurve(tar_ia.t13.cco, mode, com.cco, sp1301.ccoa, ia.cco, resol);
com_rmcurve_ia.cco.c2014 = pfp_avgrmcurve(tar_ia.t14.cco, mode, com.cco, sp1401.ccoa, ia.cco, resol);

com_rmcurve_ia.mfo.c2012 = pfp_avgrmcurve(tar_ia.t12.mfo, mode, com.mfo, sp1201.mfoa, ia.mfo, resol);
com_rmcurve_ia.mfo.c2013 = pfp_avgrmcurve(tar_ia.t13.mfo, mode, com.mfo, sp1301.mfoa, ia.mfo, resol);
com_rmcurve_ia.mfo.c2014 = pfp_avgrmcurve(tar_ia.t14.mfo, mode, com.mfo, sp1401.mfoa, ia.mfo, resol);
% }}}

% clearing {{{
clear tar_ia resol
% }}}

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Tue 12 Jul 2016 04:16:46 PM E
