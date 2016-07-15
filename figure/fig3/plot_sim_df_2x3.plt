#!/home/yuxjiang/local/bin/gnuplot -persist
#
# GNUPLOT script for plotting simulation of differences in F1-measure
#
# Note
# ----
# [1] Requires gnuplot version 5.0+
# [2] 'in_dir' and 'out_dir' needs to be specified before running this script.
#
# Require (under 'in_dir')
# -------
# abs_df_mfo.dat
# abs_df_bpo.dat
# abs_df_cco.dat
# rel_df_mfo.dat
# rel_df_bpo.dat
# rel_df_cco.dat
#
# Output
# ------
# to 'out_dir'/sim_df.tex

# input/output {{{
# Note: try to use absolute path!
in_dir  = '/home/yuxjiang/Projects/ia_git/result/sim/'
out_dir = '/home/yuxjiang/Projects/ia_git/figure/fig3/'
# }}}

# setting up {{{
width = 6
set term epslatex standalone size width,0.6*width color solid "cmr,12"
set output out_dir . 'sim_df.tex'

set xtics nomirror
set ytics nomirror
set multiplot

unset surface
set view map
set xrange [0:1]
set yrange [0:1]

set pm3d at b
set palette rgbformulae 33,13,10

set tmargin 0
set lmargin 0
set bmargin 0
set rmargin 0

set macros
NOXTICS = "set xtics ('' 0, '' .2, '' .4, '' .6, '' .8, '' 1); unset xlabel"
XTICS   = "set xtics ('0' 0, '.2' .2, '.4' .4, '.6' .6, '.8' .8, '1' 1.0); set xlabel 'Recall'"
NOYTICS = "set ytics ('' 0, '' .25, '' .5, '' .75, '' 1); unset ylabel"
YTICS   = "set ytics ('0' 0, '' .25, '.5' .5, '' .75, '1' 1.0); set ylabel 'Precision'"

# origins
LX = 0.07
MX = 0.36
RX = 0.65
UY = 0.54
LY = 0.12

set label 1 center 'Molecular function' at screen 0.22,0.88
set label 2 center 'Biological process' at screen 0.51,0.88
set label 3 center 'Cellular component' at screen 0.80,0.88

set label 4 left '\textsf{A: Absolute changes of $F_1$}' at screen 0.0,0.98
set label 5 left '\textsf{B: Relative changes of $F_1$}' at screen 0.0,0.48

set size 0.35,0.4

set cbrange [-0.2:0.2]
set cbtics 0.1
# }}}

# absolute differences {{{
unset colorbox
@NOXTICS; @YTICS
set origin LX,UY
splot in_dir . 'abs_df_mfo.dat' u 1:2:3 w lines notitle

unset ylabel
@NOXTICS; @NOYTICS
set origin MX,UY
splot in_dir . 'abs_df_bpo.dat' u 1:2:3  w lines notitle

set colorbox

@NOXTICS; @NOYTICS
set origin RX,UY
splot in_dir . 'abs_df_cco.dat' u 1:2:3  w lines notitle
# }}}

# relative changes {{{
set cbrange [-0.8:0.8]
set cbtics 0.4
unset colorbox

@XTICS; @YTICS
set origin LX,LY
splot in_dir . 'rel_df_mfo.dat' u 1:2:3 w lines notitle

@XTICS; @NOYTICS
set origin MX,LY
splot in_dir . 'rel_df_bpo.dat' u 1:2:3  w lines notitle

set colorbox

@XTICS; @NOYTICS
set origin RX,LY
splot in_dir . 'rel_df_cco.dat' u 1:2:3  w lines notitle
# }}}

# -------------
# Yuxiang Jiang (yuxjiang@indiana.edu)
# Department of Computer Science
# Indiana University, Bloomington
# Last modified: Fri 15 Jul 2016 05:30:26 PM E
