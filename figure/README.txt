Figure 1
--------
run MetaPost to generate the eps file.
> mpost con_mat.mp
* requires metapost.

Figure 2
--------
run MetaPost to generate the eps file.
> mpost rumi.mp
* requires metapost.

Figure 3
--------
run save_sim_impact_pr.m in src/ to generate simulated data;
run make in figure/fig3
* requires gnuplot(5.0+) in /usr/bin.

Figure 4
--------
run save_sim_impact_rm.m in src/ to generate simulated data;
run make in figure/fig4
* requires gnuplot(5.0+) in /usr/bin.

Figure 5
--------
run MetaPost to generate the eps file.
> mpost timeline.mp
* requires metapost.

Figure 6
--------
run save_prcurves.m in src/ to generate data (curves);
run make in figure/fig6
* requires gnuplot(5.0+) in /usr/bin.
* requires latex, dvipdf.

Figure 7
--------
run save_rmcurves.m in src/ to generate data (curves);
run make in figure/fig7
* requires gnuplot(5.0+) in /usr/bin.
* requires latex, dvipdf.
