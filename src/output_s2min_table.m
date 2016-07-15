%script
%OUTPUT_s2min_TABLE Output S2-min table
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
tar_ia.t12.bpo = tarlist_ia.t12.bpo.object;
tar_ia.t12.cco = tarlist_ia.t12.cco.object;
tar_ia.t12.mfo = tarlist_ia.t12.mfo.object;

tar_ia.t13.bpo = tarlist_ia.t13.bpo.object;
tar_ia.t13.cco = tarlist_ia.t13.cco.object;
tar_ia.t13.mfo = tarlist_ia.t13.mfo.object;

tar_ia.t14.bpo = tarlist_ia.t14.bpo.object;
tar_ia.t14.cco = tarlist_ia.t14.cco.object;
tar_ia.t14.mfo = tarlist_ia.t14.mfo.object;
% }}}

% mapping {{{
% mapping GOtcha {{{
mapped_g.bpo = pfp_predproj(gotcha.bpo, tarlist_all.bpo, 'object');
mapped_g.cco = pfp_predproj(gotcha.cco, tarlist_all.cco, 'object');
mapped_g.mfo = pfp_predproj(gotcha.mfo, tarlist_all.mfo, 'object');

mapped_g_ia.t12.bpo = pfp_predproj(gotcha.bpo, tar_ia.t12.bpo, 'object');
mapped_g_ia.t12.cco = pfp_predproj(gotcha.cco, tar_ia.t12.cco, 'object');
mapped_g_ia.t12.mfo = pfp_predproj(gotcha.mfo, tar_ia.t12.mfo, 'object');

mapped_g_ia.t13.bpo = pfp_predproj(gotcha.bpo, tar_ia.t13.bpo, 'object');
mapped_g_ia.t13.cco = pfp_predproj(gotcha.cco, tar_ia.t13.cco, 'object');
mapped_g_ia.t13.mfo = pfp_predproj(gotcha.mfo, tar_ia.t13.mfo, 'object');

mapped_g_ia.t14.bpo = pfp_predproj(gotcha.bpo, tar_ia.t14.bpo, 'object');
mapped_g_ia.t14.cco = pfp_predproj(gotcha.cco, tar_ia.t14.cco, 'object');
mapped_g_ia.t14.mfo = pfp_predproj(gotcha.mfo, tar_ia.t14.mfo, 'object');
% }}}

% mapping BLAST {{{
mapped_b.bpo = pfp_predproj(blast.bpo, tarlist_all.bpo, 'object');
mapped_b.cco = pfp_predproj(blast.cco, tarlist_all.cco, 'object');
mapped_b.mfo = pfp_predproj(blast.mfo, tarlist_all.mfo, 'object');

mapped_b_ia.t12.bpo = pfp_predproj(blast.bpo, tar_ia.t12.bpo, 'object');
mapped_b_ia.t12.cco = pfp_predproj(blast.cco, tar_ia.t12.cco, 'object');
mapped_b_ia.t12.mfo = pfp_predproj(blast.mfo, tar_ia.t12.mfo, 'object');

mapped_b_ia.t13.bpo = pfp_predproj(blast.bpo, tar_ia.t13.bpo, 'object');
mapped_b_ia.t13.cco = pfp_predproj(blast.cco, tar_ia.t13.cco, 'object');
mapped_b_ia.t13.mfo = pfp_predproj(blast.mfo, tar_ia.t13.mfo, 'object');

mapped_b_ia.t14.bpo = pfp_predproj(blast.bpo, tar_ia.t14.bpo, 'object');
mapped_b_ia.t14.cco = pfp_predproj(blast.cco, tar_ia.t14.cco, 'object');
mapped_b_ia.t14.mfo = pfp_predproj(blast.mfo, tar_ia.t14.mfo, 'object');
% }}}

% mapping Swiss-Prot computational annotation {{{
mapped_c.bpo = pfp_predproj(com.bpo, tarlist_all.bpo, 'object');
mapped_c.cco = pfp_predproj(com.cco, tarlist_all.cco, 'object');
mapped_c.mfo = pfp_predproj(com.mfo, tarlist_all.mfo, 'object');

mapped_c_ia.t12.bpo = pfp_predproj(com.bpo, tar_ia.t12.bpo, 'object');
mapped_c_ia.t12.cco = pfp_predproj(com.cco, tar_ia.t12.cco, 'object');
mapped_c_ia.t12.mfo = pfp_predproj(com.mfo, tar_ia.t12.mfo, 'object');

mapped_c_ia.t13.bpo = pfp_predproj(com.bpo, tar_ia.t13.bpo, 'object');
mapped_c_ia.t13.cco = pfp_predproj(com.cco, tar_ia.t13.cco, 'object');
mapped_c_ia.t13.mfo = pfp_predproj(com.mfo, tar_ia.t13.mfo, 'object');

mapped_c_ia.t14.bpo = pfp_predproj(com.bpo, tar_ia.t14.bpo, 'object');
mapped_c_ia.t14.cco = pfp_predproj(com.cco, tar_ia.t14.cco, 'object');
mapped_c_ia.t14.mfo = pfp_predproj(com.mfo, tar_ia.t14.mfo, 'object');
% }}}
% }}}

% computing {{{
% GOtcha {{{
s2min.gotcha.bpo.f2011 = s2min_from_curve(gotcha_rmcurve.bpo.c2011);
s2min.gotcha.bpo.f2012 = s2min_from_curve(gotcha_rmcurve_ia.bpo.b2012);
s2min.gotcha.bpo.f2013 = s2min_from_curve(gotcha_rmcurve_ia.bpo.b2013);
s2min.gotcha.bpo.f2014 = s2min_from_curve(gotcha_rmcurve_ia.bpo.b2014);
s2min.gotcha.bpo.g2012 = s2min_from_curve(gotcha_rmcurve_ia.bpo.c2012);
s2min.gotcha.bpo.g2013 = s2min_from_curve(gotcha_rmcurve_ia.bpo.c2013);
s2min.gotcha.bpo.g2014 = s2min_from_curve(gotcha_rmcurve_ia.bpo.c2014);

s2min.gotcha.cco.f2011 = s2min_from_curve(gotcha_rmcurve.cco.c2011);
s2min.gotcha.cco.f2012 = s2min_from_curve(gotcha_rmcurve_ia.cco.b2012);
s2min.gotcha.cco.f2013 = s2min_from_curve(gotcha_rmcurve_ia.cco.b2013);
s2min.gotcha.cco.f2014 = s2min_from_curve(gotcha_rmcurve_ia.cco.b2014);
s2min.gotcha.cco.g2012 = s2min_from_curve(gotcha_rmcurve_ia.cco.c2012);
s2min.gotcha.cco.g2013 = s2min_from_curve(gotcha_rmcurve_ia.cco.c2013);
s2min.gotcha.cco.g2014 = s2min_from_curve(gotcha_rmcurve_ia.cco.c2014);

s2min.gotcha.mfo.f2011 = s2min_from_curve(gotcha_rmcurve.mfo.c2011);
s2min.gotcha.mfo.f2012 = s2min_from_curve(gotcha_rmcurve_ia.mfo.b2012);
s2min.gotcha.mfo.f2013 = s2min_from_curve(gotcha_rmcurve_ia.mfo.b2013);
s2min.gotcha.mfo.f2014 = s2min_from_curve(gotcha_rmcurve_ia.mfo.b2014);
s2min.gotcha.mfo.g2012 = s2min_from_curve(gotcha_rmcurve_ia.mfo.c2012);
s2min.gotcha.mfo.g2013 = s2min_from_curve(gotcha_rmcurve_ia.mfo.c2013);
s2min.gotcha.mfo.g2014 = s2min_from_curve(gotcha_rmcurve_ia.mfo.c2014);

coverage.gotcha.bpo.c2011 = full(sum(max(mapped_g.bpo.score, [], 2) ~= 0))/numel(tarlist_all.bpo)*100;
coverage.gotcha.cco.c2011 = full(sum(max(mapped_g.cco.score, [], 2) ~= 0))/numel(tarlist_all.cco)*100;
coverage.gotcha.mfo.c2011 = full(sum(max(mapped_g.mfo.score, [], 2) ~= 0))/numel(tarlist_all.mfo)*100;

coverage.gotcha.bpo.c2012 = full(sum(max(mapped_g_ia.t12.bpo.score, [], 2) ~= 0))/numel(tar_ia.t12.bpo)*100;
coverage.gotcha.cco.c2012 = full(sum(max(mapped_g_ia.t12.cco.score, [], 2) ~= 0))/numel(tar_ia.t12.cco)*100;
coverage.gotcha.mfo.c2012 = full(sum(max(mapped_g_ia.t12.mfo.score, [], 2) ~= 0))/numel(tar_ia.t12.mfo)*100;

coverage.gotcha.bpo.c2013 = full(sum(max(mapped_g_ia.t13.bpo.score, [], 2) ~= 0))/numel(tar_ia.t13.bpo)*100;
coverage.gotcha.cco.c2013 = full(sum(max(mapped_g_ia.t13.cco.score, [], 2) ~= 0))/numel(tar_ia.t13.cco)*100;
coverage.gotcha.mfo.c2013 = full(sum(max(mapped_g_ia.t13.mfo.score, [], 2) ~= 0))/numel(tar_ia.t13.mfo)*100;

coverage.gotcha.bpo.c2014 = full(sum(max(mapped_g_ia.t14.bpo.score, [], 2) ~= 0))/numel(tar_ia.t14.bpo)*100;
coverage.gotcha.cco.c2014 = full(sum(max(mapped_g_ia.t14.cco.score, [], 2) ~= 0))/numel(tar_ia.t14.cco)*100;
coverage.gotcha.mfo.c2014 = full(sum(max(mapped_g_ia.t14.mfo.score, [], 2) ~= 0))/numel(tar_ia.t14.mfo)*100;

ds2.gotcha.bpo.d2012 = s2min.gotcha.bpo.g2012 - s2min.gotcha.bpo.f2012;
ds2.gotcha.cco.d2012 = s2min.gotcha.cco.g2012 - s2min.gotcha.cco.f2012;
ds2.gotcha.mfo.d2012 = s2min.gotcha.mfo.g2012 - s2min.gotcha.mfo.f2012;

ds2.gotcha.bpo.d2013 = s2min.gotcha.bpo.g2013 - s2min.gotcha.bpo.f2013;
ds2.gotcha.cco.d2013 = s2min.gotcha.cco.g2013 - s2min.gotcha.cco.f2013;
ds2.gotcha.mfo.d2013 = s2min.gotcha.mfo.g2013 - s2min.gotcha.mfo.f2013;

ds2.gotcha.bpo.d2014 = s2min.gotcha.bpo.g2014 - s2min.gotcha.bpo.f2014;
ds2.gotcha.cco.d2014 = s2min.gotcha.cco.g2014 - s2min.gotcha.cco.f2014;
ds2.gotcha.mfo.d2014 = s2min.gotcha.mfo.g2014 - s2min.gotcha.mfo.f2014;
% }}}

% BLAST {{{
s2min.blast.bpo.f2011 = s2min_from_curve(blast_rmcurve.bpo.c2011);
s2min.blast.bpo.f2012 = s2min_from_curve(blast_rmcurve_ia.bpo.b2012);
s2min.blast.bpo.f2013 = s2min_from_curve(blast_rmcurve_ia.bpo.b2013);
s2min.blast.bpo.f2014 = s2min_from_curve(blast_rmcurve_ia.bpo.b2014);
s2min.blast.bpo.g2012 = s2min_from_curve(blast_rmcurve_ia.bpo.c2012);
s2min.blast.bpo.g2013 = s2min_from_curve(blast_rmcurve_ia.bpo.c2013);
s2min.blast.bpo.g2014 = s2min_from_curve(blast_rmcurve_ia.bpo.c2014);

s2min.blast.cco.f2011 = s2min_from_curve(blast_rmcurve.cco.c2011);
s2min.blast.cco.f2012 = s2min_from_curve(blast_rmcurve_ia.cco.b2012);
s2min.blast.cco.f2013 = s2min_from_curve(blast_rmcurve_ia.cco.b2013);
s2min.blast.cco.f2014 = s2min_from_curve(blast_rmcurve_ia.cco.b2014);
s2min.blast.cco.g2012 = s2min_from_curve(blast_rmcurve_ia.cco.c2012);
s2min.blast.cco.g2013 = s2min_from_curve(blast_rmcurve_ia.cco.c2013);
s2min.blast.cco.g2014 = s2min_from_curve(blast_rmcurve_ia.cco.c2014);

s2min.blast.mfo.f2011 = s2min_from_curve(blast_rmcurve.mfo.c2011);
s2min.blast.mfo.f2012 = s2min_from_curve(blast_rmcurve_ia.mfo.b2012);
s2min.blast.mfo.f2013 = s2min_from_curve(blast_rmcurve_ia.mfo.b2013);
s2min.blast.mfo.f2014 = s2min_from_curve(blast_rmcurve_ia.mfo.b2014);
s2min.blast.mfo.g2012 = s2min_from_curve(blast_rmcurve_ia.mfo.c2012);
s2min.blast.mfo.g2013 = s2min_from_curve(blast_rmcurve_ia.mfo.c2013);
s2min.blast.mfo.g2014 = s2min_from_curve(blast_rmcurve_ia.mfo.c2014);

coverage.blast.bpo.c2011 = full(sum(max(mapped_b.bpo.score, [], 2) ~= 0))/numel(tarlist_all.bpo)*100;
coverage.blast.cco.c2011 = full(sum(max(mapped_b.cco.score, [], 2) ~= 0))/numel(tarlist_all.cco)*100;
coverage.blast.mfo.c2011 = full(sum(max(mapped_b.mfo.score, [], 2) ~= 0))/numel(tarlist_all.mfo)*100;

coverage.blast.bpo.c2012 = full(sum(max(mapped_b_ia.t12.bpo.score, [], 2) ~= 0))/numel(tar_ia.t12.bpo)*100;
coverage.blast.cco.c2012 = full(sum(max(mapped_b_ia.t12.cco.score, [], 2) ~= 0))/numel(tar_ia.t12.cco)*100;
coverage.blast.mfo.c2012 = full(sum(max(mapped_b_ia.t12.mfo.score, [], 2) ~= 0))/numel(tar_ia.t12.mfo)*100;

coverage.blast.bpo.c2013 = full(sum(max(mapped_b_ia.t13.bpo.score, [], 2) ~= 0))/numel(tar_ia.t13.bpo)*100;
coverage.blast.cco.c2013 = full(sum(max(mapped_b_ia.t13.cco.score, [], 2) ~= 0))/numel(tar_ia.t13.cco)*100;
coverage.blast.mfo.c2013 = full(sum(max(mapped_b_ia.t13.mfo.score, [], 2) ~= 0))/numel(tar_ia.t13.mfo)*100;

coverage.blast.bpo.c2014 = full(sum(max(mapped_b_ia.t14.bpo.score, [], 2) ~= 0))/numel(tar_ia.t14.bpo)*100;
coverage.blast.cco.c2014 = full(sum(max(mapped_b_ia.t14.cco.score, [], 2) ~= 0))/numel(tar_ia.t14.cco)*100;
coverage.blast.mfo.c2014 = full(sum(max(mapped_b_ia.t14.mfo.score, [], 2) ~= 0))/numel(tar_ia.t14.mfo)*100;

ds2.blast.bpo.d2012 = s2min.blast.bpo.g2012 - s2min.blast.bpo.f2012;
ds2.blast.cco.d2012 = s2min.blast.cco.g2012 - s2min.blast.cco.f2012;
ds2.blast.mfo.d2012 = s2min.blast.mfo.g2012 - s2min.blast.mfo.f2012;

ds2.blast.bpo.d2013 = s2min.blast.bpo.g2013 - s2min.blast.bpo.f2013;
ds2.blast.cco.d2013 = s2min.blast.cco.g2013 - s2min.blast.cco.f2013;
ds2.blast.mfo.d2013 = s2min.blast.mfo.g2013 - s2min.blast.mfo.f2013;

ds2.blast.bpo.d2014 = s2min.blast.bpo.g2014 - s2min.blast.bpo.f2014;
ds2.blast.cco.d2014 = s2min.blast.cco.g2014 - s2min.blast.cco.f2014;
ds2.blast.mfo.d2014 = s2min.blast.mfo.g2014 - s2min.blast.mfo.f2014;
% }}}

% Swiss-Prot {{{
s2min.com.bpo.f2011 = s2min_from_curve(com_rmcurve.bpo.c2011);
s2min.com.bpo.f2012 = s2min_from_curve(com_rmcurve_ia.bpo.b2012);
s2min.com.bpo.f2013 = s2min_from_curve(com_rmcurve_ia.bpo.b2013);
s2min.com.bpo.f2014 = s2min_from_curve(com_rmcurve_ia.bpo.b2014);
s2min.com.bpo.g2012 = s2min_from_curve(com_rmcurve_ia.bpo.c2012);
s2min.com.bpo.g2013 = s2min_from_curve(com_rmcurve_ia.bpo.c2013);
s2min.com.bpo.g2014 = s2min_from_curve(com_rmcurve_ia.bpo.c2014);

s2min.com.cco.f2011 = s2min_from_curve(com_rmcurve.cco.c2011);
s2min.com.cco.f2012 = s2min_from_curve(com_rmcurve_ia.cco.b2012);
s2min.com.cco.f2013 = s2min_from_curve(com_rmcurve_ia.cco.b2013);
s2min.com.cco.f2014 = s2min_from_curve(com_rmcurve_ia.cco.b2014);
s2min.com.cco.g2012 = s2min_from_curve(com_rmcurve_ia.cco.c2012);
s2min.com.cco.g2013 = s2min_from_curve(com_rmcurve_ia.cco.c2013);
s2min.com.cco.g2014 = s2min_from_curve(com_rmcurve_ia.cco.c2014);

s2min.com.mfo.f2011 = s2min_from_curve(com_rmcurve.mfo.c2011);
s2min.com.mfo.f2012 = s2min_from_curve(com_rmcurve_ia.mfo.b2012);
s2min.com.mfo.f2013 = s2min_from_curve(com_rmcurve_ia.mfo.b2013);
s2min.com.mfo.f2014 = s2min_from_curve(com_rmcurve_ia.mfo.b2014);
s2min.com.mfo.g2012 = s2min_from_curve(com_rmcurve_ia.mfo.c2012);
s2min.com.mfo.g2013 = s2min_from_curve(com_rmcurve_ia.mfo.c2013);
s2min.com.mfo.g2014 = s2min_from_curve(com_rmcurve_ia.mfo.c2014);

coverage.com.bpo.c2011 = full(sum(max(mapped_c.bpo.score, [], 2) ~= 0))/numel(tarlist_all.bpo)*100;
coverage.com.cco.c2011 = full(sum(max(mapped_c.cco.score, [], 2) ~= 0))/numel(tarlist_all.cco)*100;
coverage.com.mfo.c2011 = full(sum(max(mapped_c.mfo.score, [], 2) ~= 0))/numel(tarlist_all.mfo)*100;

coverage.com.bpo.c2012 = full(sum(max(mapped_c_ia.t12.bpo.score, [], 2) ~= 0))/numel(tar_ia.t12.bpo)*100;
coverage.com.cco.c2012 = full(sum(max(mapped_c_ia.t12.cco.score, [], 2) ~= 0))/numel(tar_ia.t12.cco)*100;
coverage.com.mfo.c2012 = full(sum(max(mapped_c_ia.t12.mfo.score, [], 2) ~= 0))/numel(tar_ia.t12.mfo)*100;

coverage.com.bpo.c2013 = full(sum(max(mapped_c_ia.t13.bpo.score, [], 2) ~= 0))/numel(tar_ia.t13.bpo)*100;
coverage.com.cco.c2013 = full(sum(max(mapped_c_ia.t13.cco.score, [], 2) ~= 0))/numel(tar_ia.t13.cco)*100;
coverage.com.mfo.c2013 = full(sum(max(mapped_c_ia.t13.mfo.score, [], 2) ~= 0))/numel(tar_ia.t13.mfo)*100;

coverage.com.bpo.c2014 = full(sum(max(mapped_c_ia.t14.bpo.score, [], 2) ~= 0))/numel(tar_ia.t14.bpo)*100;
coverage.com.cco.c2014 = full(sum(max(mapped_c_ia.t14.cco.score, [], 2) ~= 0))/numel(tar_ia.t14.cco)*100;
coverage.com.mfo.c2014 = full(sum(max(mapped_c_ia.t14.mfo.score, [], 2) ~= 0))/numel(tar_ia.t14.mfo)*100;

ds2.com.bpo.d2012 = s2min.com.bpo.g2012 - s2min.com.bpo.f2012;
ds2.com.cco.d2012 = s2min.com.cco.g2012 - s2min.com.cco.f2012;
ds2.com.mfo.d2012 = s2min.com.mfo.g2012 - s2min.com.mfo.f2012;

ds2.com.bpo.d2013 = s2min.com.bpo.g2013 - s2min.com.bpo.f2013;
ds2.com.cco.d2013 = s2min.com.cco.g2013 - s2min.com.cco.f2013;
ds2.com.mfo.d2013 = s2min.com.mfo.g2013 - s2min.com.mfo.f2013;

ds2.com.bpo.d2014 = s2min.com.bpo.g2014 - s2min.com.bpo.f2014;
ds2.com.cco.d2014 = s2min.com.cco.g2014 - s2min.com.cco.f2014;
ds2.com.mfo.d2014 = s2min.com.mfo.g2014 - s2min.com.mfo.f2014;
% }}}

% median of rho
rho.mfo.r2012 = median(tarlist_ia.t12.mfo.delta_ic ./ tarlist_ia.t12.mfo.gamma_ic);
rho.bpo.r2012 = median(tarlist_ia.t12.bpo.delta_ic ./ tarlist_ia.t12.bpo.gamma_ic);
rho.cco.r2012 = median(tarlist_ia.t12.cco.delta_ic ./ tarlist_ia.t12.cco.gamma_ic);

rho.mfo.r2013 = median(tarlist_ia.t13.mfo.delta_ic ./ tarlist_ia.t13.mfo.gamma_ic);
rho.bpo.r2013 = median(tarlist_ia.t13.bpo.delta_ic ./ tarlist_ia.t13.bpo.gamma_ic);
rho.cco.r2013 = median(tarlist_ia.t13.cco.delta_ic ./ tarlist_ia.t13.cco.gamma_ic);

rho.mfo.r2014 = median(tarlist_ia.t14.mfo.delta_ic ./ tarlist_ia.t14.mfo.gamma_ic);
rho.bpo.r2014 = median(tarlist_ia.t14.bpo.delta_ic ./ tarlist_ia.t14.bpo.gamma_ic);
rho.cco.r2014 = median(tarlist_ia.t14.cco.delta_ic ./ tarlist_ia.t14.cco.gamma_ic);
% }}}

% output {{{
t_ptn = [...
'\\hline\n', ...
'& \\multicolumn{4}{c|}{Molecular function}\n', ...
'& \\multicolumn{4}{c}{Biological process}\n', ...
'& \\multicolumn{4}{|c}{Cellular component} \\\\ \\hline \\hline\n'];

t_ptn2 = [...
'%d &\n', ...
'$N$ & $\\mathrm{M}_{\\rho}$ & $S_{\\min}$~(Coverage) & $\\Delta_{S_{\\min}}$ &\n', ...
'$N$ & $\\mathrm{M}_{\\rho}$ & $S_{\\min}$~(Coverage) & $\\Delta_{S_{\\min}}$ &\n', ...
'$N$ & $\\mathrm{M}_{\\rho}$ & $S_{\\min}$~(Coverage) & $\\Delta_{S_{\\min}}$ \\\\ \\hline \n'];

gotcha_ptn1 = [...
'GOtcha & \n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{-} & $%.3f~(%.1f\\%%)$ & - &\n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{-} & $%.3f~(%.1f\\%%)$ & - &\n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{-} & $%.3f~(%.1f\\%%)$ & - \\\\\n'];

gotcha_ptn2 = [...
'GOtcha & \n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{$%.2f$} & $%.3f~(%.1f\\%%)$ & $%+.3f$ &\n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{$%.2f$} & $%.3f~(%.1f\\%%)$ & $%+.3f$ &\n', ...
'\\multirow{3}{*}{$%d$} & \\multirow{3}{*}{$%.2f$} & $%.3f~(%.1f\\%%)$ & $%+.3f$ \\\\\n'];

d_ptn1 = [...
'%s &\n', ...
'& & $%.3f~(%.1f\\%%)$ & - &\n', ...
'& & $%.3f~(%.1f\\%%)$ & - &\n', ...
'& & $%.3f~(%.1f\\%%)$ & - \\\\\n'];

d_ptn2 = [...
'%s &\n', ...
'& & $%.3f~(%.1f\\%%)$ & $%+.3f$ &\n', ...
'& & $%.3f~(%.1f\\%%)$ & $%+.3f$ &\n', ...
'& & $%.3f~(%.1f\\%%)$ & $%+.3f$ \\\\\n'];

fid = fopen('../table/s2min_table.tex', 'w');
fprintf(fid, '\\begin{tabular}{c|cccc|cccc|cccc}\n');
fprintf(fid, t_ptn);
fprintf(fid, t_ptn2, 2011);
fprintf(fid, gotcha_ptn1, ...
    numel(tarlist_all.mfo), s2min.gotcha.mfo.f2011, coverage.gotcha.mfo.c2011, ...
    numel(tarlist_all.bpo), s2min.gotcha.bpo.f2011, coverage.gotcha.bpo.c2011, ...
    numel(tarlist_all.cco), s2min.gotcha.cco.f2011, coverage.gotcha.cco.c2011);
fprintf(fid, d_ptn1, 'BLAST', ...
    s2min.blast.mfo.f2011, coverage.blast.mfo.c2011, ...
    s2min.blast.bpo.f2011, coverage.blast.bpo.c2011, ...
    s2min.blast.cco.f2011, coverage.blast.cco.c2011);
fprintf(fid, d_ptn1, 'Swiss-Prot', ...
    s2min.com.mfo.f2011, coverage.com.mfo.c2011, ...
    s2min.com.bpo.f2011, coverage.com.bpo.c2011, ...
    s2min.com.cco.f2011, coverage.com.cco.c2011);
fprintf(fid, '\\hline\n');

fprintf(fid, t_ptn2, 2012);
fprintf(fid, gotcha_ptn2, ...
    numel(tar_ia.t12.mfo), rho.mfo.r2012, s2min.gotcha.mfo.f2012, coverage.gotcha.mfo.c2012, ds2.gotcha.mfo.d2012, ...
    numel(tar_ia.t12.bpo), rho.bpo.r2012, s2min.gotcha.bpo.f2012, coverage.gotcha.bpo.c2012, ds2.gotcha.bpo.d2012, ...
    numel(tar_ia.t12.cco), rho.cco.r2012, s2min.gotcha.cco.f2012, coverage.gotcha.cco.c2012, ds2.gotcha.cco.d2012);
fprintf(fid, d_ptn2, 'BLAST', ...
    s2min.blast.mfo.f2012, coverage.blast.mfo.c2012, ds2.blast.mfo.d2012, ...
    s2min.blast.bpo.f2012, coverage.blast.bpo.c2012, ds2.blast.bpo.d2012, ...
    s2min.blast.cco.f2012, coverage.blast.cco.c2012, ds2.blast.cco.d2012);
fprintf(fid, d_ptn2, 'Swiss-Prot', ...
    s2min.com.mfo.f2012, coverage.com.mfo.c2012, ds2.com.mfo.d2012, ...
    s2min.com.bpo.f2012, coverage.com.bpo.c2012, ds2.com.bpo.d2012, ...
    s2min.com.cco.f2012, coverage.com.cco.c2012, ds2.com.cco.d2012);
fprintf(fid, '\\hline\n');

fprintf(fid, t_ptn2, 2013);
fprintf(fid, gotcha_ptn2, ...
    numel(tar_ia.t13.mfo), rho.mfo.r2013, s2min.gotcha.mfo.f2013, coverage.gotcha.mfo.c2013, ds2.gotcha.mfo.d2013, ...
    numel(tar_ia.t13.bpo), rho.bpo.r2013, s2min.gotcha.bpo.f2013, coverage.gotcha.bpo.c2013, ds2.gotcha.bpo.d2013, ...
    numel(tar_ia.t13.cco), rho.cco.r2013, s2min.gotcha.cco.f2013, coverage.gotcha.cco.c2013, ds2.gotcha.cco.d2013);
fprintf(fid, d_ptn2, 'BLAST', ...
    s2min.blast.mfo.f2013, coverage.blast.mfo.c2013, ds2.blast.mfo.d2013, ...
    s2min.blast.bpo.f2013, coverage.blast.bpo.c2013, ds2.blast.bpo.d2013, ...
    s2min.blast.cco.f2013, coverage.blast.cco.c2013, ds2.blast.cco.d2013);
fprintf(fid, d_ptn2, 'Swiss-Prot', ...
    s2min.com.mfo.f2013, coverage.com.mfo.c2013, ds2.com.mfo.d2013, ...
    s2min.com.bpo.f2013, coverage.com.bpo.c2013, ds2.com.bpo.d2013, ...
    s2min.com.cco.f2013, coverage.com.cco.c2013, ds2.com.cco.d2013);
fprintf(fid, '\\hline\n');

fprintf(fid, t_ptn2, 2014);
fprintf(fid, gotcha_ptn2, ...
    numel(tar_ia.t14.mfo), rho.mfo.r2014, s2min.gotcha.mfo.f2014, coverage.gotcha.mfo.c2014, ds2.gotcha.mfo.d2014, ...
    numel(tar_ia.t14.bpo), rho.bpo.r2014, s2min.gotcha.bpo.f2014, coverage.gotcha.bpo.c2014, ds2.gotcha.bpo.d2014, ...
    numel(tar_ia.t14.cco), rho.cco.r2014, s2min.gotcha.cco.f2014, coverage.gotcha.cco.c2014, ds2.gotcha.cco.d2014);
fprintf(fid, d_ptn2, 'BLAST', ...
    s2min.blast.mfo.f2014, coverage.blast.mfo.c2014, ds2.blast.mfo.d2014, ...
    s2min.blast.bpo.f2014, coverage.blast.bpo.c2014, ds2.blast.bpo.d2014, ...
    s2min.blast.cco.f2014, coverage.blast.cco.c2014, ds2.blast.cco.d2014);
fprintf(fid, d_ptn2, 'Swiss-Prot', ...
    s2min.com.mfo.f2014, coverage.com.mfo.c2014, ds2.com.mfo.d2014, ...
    s2min.com.bpo.f2014, coverage.com.bpo.c2014, ds2.com.bpo.d2014, ...
    s2min.com.cco.f2014, coverage.com.cco.c2014, ds2.com.cco.d2014);
fprintf(fid, '\\hline\n');
fprintf(fid, '\\end{tabular}\n');
fclose(fid);
% }}}

% clearing {{{
clear mapped_g* mapped_b* mapped_c* tar_ia t_ptn* d_ptn* gotcha_ptn* fid s2min ds2 coverage rho
% }}}

% -------------
% Yuxiang Jiang (yuxjiang@indiana.edu)
% Department of Computer Science
% Indiana University, Bloomington
% Last modified: Thu 14 Jul 2016 05:30:41 PM E
