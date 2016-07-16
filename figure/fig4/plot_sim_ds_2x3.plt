#!/usr/bin/gnuplot -persist
#
# GNUPLOT script for plotting simulation of differences in S2-distance
#
# Note
# ----
# [1] Requires gnuplot version 5.0+
# [2] 'in_dir' and 'out_dir' needs to be specified before running this script.
#
# Require (under 'in_dir')
# -------
# abs_ds_mfo.dat
# abs_ds_bpo.dat
# abs_ds_cco.dat
# rel_ds_mfo.dat
# rel_ds_bpo.dat
# rel_ds_cco.dat
#
# Output
# ------
# to 'out_dir'/sim_ds.tex

# input/output {{{
# Note: try to use absolute path!
in_dir  = '../../result/sim/'
out_dir = './'
# }}}

# setting up {{{
width = 6
set term epslatex standalone size width,0.6*width color solid "cmr,12"
set output out_dir . 'sim_ds.tex'

set xtics nomirror
set ytics nomirror
set multiplot

unset surface
set view map
set xrange [0:20]
set yrange [0:100]

set pm3d at b
set palette rgbformulae 33,13,10

set tmargin 0
set lmargin 0
set bmargin 0
set rmargin 0

set macros
NOXTICS = "set xtics ('' 0, '' 5, '' 10, '' 15, '' 20); unset xlabel"
NOYTICS = "set ytics ('' 0, '' 25, '' 50, '' 75, '' 100); unset ylabel"
XTICS   = "set xtics ('0' 0, '5' 5, '10' 10, '15' 15, '20' 20); set xlabel '$ru$'"
YTICS   = "set ytics ('0' 0, '' 25, '50' 50, '' 75, '100' 100); set ylabel '$mi$'"

# origins
LX = 0.07
MX = 0.36
RX = 0.65
UY = 0.54
LY = 0.12

set label 1 center 'Molecular function' at screen 0.22,0.88
set label 2 center 'Biological process' at screen 0.51,0.88
set label 3 center 'Cellular component' at screen 0.80,0.88

set label 4 left '\textsf{A: Absolute changes of $S_2$}' at screen 0.0,0.98
set label 5 left '\textsf{B: Relative changes of $S_2$}' at screen 0.0,0.48

set size 0.32,0.4

set cbrange [-8:8]
set cbtics 4
# }}}

# absolute differences {{{
unset colorbox
@NOXTICS; @YTICS
set origin LX,UY
splot in_dir . 'abs_ds_mfo.dat' u 1:2:3 w lines notitle

unset ylabel
@NOXTICS; @NOYTICS
set origin MX,UY
splot in_dir . 'abs_ds_bpo.dat' u 1:2:3  w lines notitle

set colorbox

@NOXTICS; @NOYTICS
set origin RX,UY
splot in_dir . 'abs_ds_cco.dat' u 1:2:3  w lines notitle
# }}}

# relative changes {{{
set cbrange [-0.4:0.4]
set cbtics 0.2
unset colorbox

@XTICS; @YTICS
set origin LX,LY
splot in_dir . 'rel_ds_mfo.dat' u 1:2:3 w lines notitle

@XTICS; @NOYTICS
set origin MX,LY
splot in_dir . 'rel_ds_bpo.dat' u 1:2:3  w lines notitle

set colorbox

@XTICS; @NOYTICS
set origin RX,LY
splot in_dir . 'rel_ds_cco.dat' u 1:2:3  w lines notitle
# }}}

# -------------
# Yuxiang Jiang (yuxjiang@indiana.edu)
# Department of Computer Science
# Indiana University, Bloomington
# Last modified: Sat 16 Jul 2016 03:53:53 PM E
