#!/usr/bin/gnuplot -persist
#
# GNUPLOT script for Precision-Recall curves
#
# Note
# ----
# [1] Requires gnuplot version 5.0+
# [2] 'in_dir' and 'out_dir' needs to be specified before running this script.
#
# Require (under 'in_dir')
# -------
# (gotcha Precision-Recall curves)
#   pr_gotcha_bpo.dat
#   pr_gotcha_cco.dat
#   pr_gotcha_mfo.dat
#
# (blast Precision-Recall curves)
#   pr_blast_bpo.dat
#   pr_blast_cco.dat
#   pr_blast_mfo.dat
#
# (Swiss-Prot Precision-Recall curves)
#   pr_com_bpo.dat
#   pr_com_cco.dat
#   pr_com_mfo.dat
#
# Note
# ----
# Within each data file, there are 10 blocks of data (curves)
#
# index curve
# ----- -----
# 0     curve (all) at 2011
# 1     curve (all) at 2012
# 2     curve (all) at 2013
# 3     curve (all) at 2014
# 4     curve (ia 2012) at 2011
# 5     curve (ia 2013) at 2011
# 6     curve (ia 2014) at 2011
# 7     curve (ia 2012) at 2012
# 8     curve (ia 2013) at 2013
# 9     curve (ia 2014) at 2014
#
# Provide
# -------
# 'out_dir'/prcurves.tex

# input/output {{{
# Note: try to use absolute path!
in_dir  = '../../result/curves/'
out_dir = './'
# }}}

# setting up {{{
# terminal = epslatex {{{
width = 12
set term epslatex standalone size width,0.8*width color "cmr,14"
set output out_dir . 'prcurves.tex'
# }}}
# # terminal = png {{{
# width = 1200
# set term png enhanced large size width,0.8*width
# set output out_dir . 'prcurves.png'
# # }}}

set xrange [0:1]; set yrange [0:1]
set xlabel "Recall"
set ylabel "Precision"
set zeroaxis lt -1 lw 2
set xtics nomirror
set ytics nomirror
unset border

set lmargin 8
set tmargin 5

set label 1 '\textsf{\large A. GOtcha}' at screen 0.0,0.96
set label 2 '\textsf{\large B. BLAST}' at screen 0.0,0.63
set label 3 '\textsf{\large C. Swiss-Prot}' at screen 0.0,0.3

# line color
col2011 = "#808080"
col2012 = "#008000"
col2013 = "#4169E1"
col2014 = "#DC143C"

set key samplen 1 reverse Left at 1.06,1.05
width1 = 8
width2 = 10

set dashtype 11 (1,1)

# set tics {{{
set macros
NOXTICS = "set xtics ('' 0, '' .2, '' .4, '' .6, '' .8, '' 1); unset xlabel"
XTICS   = "set xtics ('0' 0, '0.2' .2, '0.4' .4, '0.6' .6, '0.8' .8, '1' 1.0); set xlabel 'Recall'"
NOYTICS = "set ytics ('' 0, '' .2, '' .4, '' .6, '' .8, '' 1); unset ylabel"
YTICS   = "set ytics ('0' 0, '0.2' .2, '0.4' .4, '0.6' .6, '0.8' .8, '1' 1.0); set ylabel 'Precision'"
# }}}

set multiplot # layout 3,3
set size 0.35, 0.35
# }}}

# plot GOtcha on MFO {{{
set origin 0.00, 0.66
set title "Molecular function"
@XTICS; @YTICS
plot \
    in_dir . 'pr_gotcha_mfo.dat' index 0 u 2:1 w lines t "2011"  lw width2 lc rgb col2011, \
    in_dir . 'pr_gotcha_mfo.dat' index 4 u 2:1 w lines t "2012"  lw width1 lc rgb col2012, \
    in_dir . 'pr_gotcha_mfo.dat' index 5 u 2:1 w lines t "2013"  lw width1 lc rgb col2013, \
    in_dir . 'pr_gotcha_mfo.dat' index 6 u 2:1 w lines t "2014"  lw width1 lc rgb col2014, \
    in_dir . 'pr_gotcha_mfo.dat' index 7 u 2:1 w lines t "2012'" lw width1 dt 11 lc rgb col2012, \
    in_dir . 'pr_gotcha_mfo.dat' index 8 u 2:1 w lines t "2013'" lw width1 dt 11 lc rgb col2013, \
    in_dir . 'pr_gotcha_mfo.dat' index 9 u 2:1 w lines t "2014'" lw width1 dt 11 lc rgb col2014
# }}}

# plot GOtcha on BPO {{{
set origin 0.33, 0.66
set title "Biological process"
@XTICS; @YTICS
plot \
    in_dir . 'pr_gotcha_bpo.dat' index 0 u 2:1 w lines notitle lw width2 lc rgb col2011, \
    in_dir . 'pr_gotcha_bpo.dat' index 4 u 2:1 w lines notitle lw width1 lc rgb col2012, \
    in_dir . 'pr_gotcha_bpo.dat' index 5 u 2:1 w lines notitle lw width1 lc rgb col2013, \
    in_dir . 'pr_gotcha_bpo.dat' index 6 u 2:1 w lines notitle lw width1 lc rgb col2014, \
    in_dir . 'pr_gotcha_bpo.dat' index 7 u 2:1 w lines notitle lw width1 dt 11 lc rgb col2012, \
    in_dir . 'pr_gotcha_bpo.dat' index 8 u 2:1 w lines notitle lw width1 dt 11 lc rgb col2013, \
    in_dir . 'pr_gotcha_bpo.dat' index 9 u 2:1 w lines notitle lw width1 dt 11 lc rgb col2014
# }}}

# plot GOtcha on CCO {{{
set origin 0.66, 0.66
set title "Cellular component"
@XTICS; @YTICS
plot \
    in_dir . 'pr_gotcha_cco.dat' index 0 u 2:1 w lines notitle lw width2 lc rgb col2011, \
    in_dir . 'pr_gotcha_cco.dat' index 4 u 2:1 w lines notitle lw width1 lc rgb col2012, \
    in_dir . 'pr_gotcha_cco.dat' index 5 u 2:1 w lines notitle lw width1 lc rgb col2013, \
    in_dir . 'pr_gotcha_cco.dat' index 6 u 2:1 w lines notitle lw width1 lc rgb col2014, \
    in_dir . 'pr_gotcha_cco.dat' index 7 u 2:1 w lines notitle lw width1 dt 11 lc rgb col2012, \
    in_dir . 'pr_gotcha_cco.dat' index 8 u 2:1 w lines notitle lw width1 dt 11 lc rgb col2013, \
    in_dir . 'pr_gotcha_cco.dat' index 9 u 2:1 w lines notitle lw width1 dt 11 lc rgb col2014
# }}}

unset title

# plot BLAST on MFO {{{
set origin 0.00, 0.33
set title "Molecular function"
@XTICS; @YTICS
plot \
    in_dir . 'pr_blast_mfo.dat' index 0 u 2:1 w lines t "2011"  lw width2 lc rgb col2011, \
    in_dir . 'pr_blast_mfo.dat' index 4 u 2:1 w lines t "2012"  lw width1 lc rgb col2012, \
    in_dir . 'pr_blast_mfo.dat' index 5 u 2:1 w lines t "2013"  lw width1 lc rgb col2013, \
    in_dir . 'pr_blast_mfo.dat' index 6 u 2:1 w lines t "2014"  lw width1 lc rgb col2014, \
    in_dir . 'pr_blast_mfo.dat' index 7 u 2:1 w lines t "2012'" lw width1 dt 11 lc rgb col2012, \
    in_dir . 'pr_blast_mfo.dat' index 8 u 2:1 w lines t "2013'" lw width1 dt 11 lc rgb col2013, \
    in_dir . 'pr_blast_mfo.dat' index 9 u 2:1 w lines t "2014'" lw width1 dt 11 lc rgb col2014
# }}}

# plot BLAST on BPO {{{
set origin 0.33, 0.33
set title "Biological process"
@XTICS; @YTICS
plot \
    in_dir . 'pr_blast_bpo.dat' index 0 u 2:1 w lines notitle lw width2 lc rgb col2011, \
    in_dir . 'pr_blast_bpo.dat' index 4 u 2:1 w lines notitle lw width1 lc rgb col2012, \
    in_dir . 'pr_blast_bpo.dat' index 5 u 2:1 w lines notitle lw width1 lc rgb col2013, \
    in_dir . 'pr_blast_bpo.dat' index 6 u 2:1 w lines notitle lw width1 lc rgb col2014, \
    in_dir . 'pr_blast_bpo.dat' index 7 u 2:1 w lines notitle lw width1 dt 11 lc rgb col2012, \
    in_dir . 'pr_blast_bpo.dat' index 8 u 2:1 w lines notitle lw width1 dt 11 lc rgb col2013, \
    in_dir . 'pr_blast_bpo.dat' index 9 u 2:1 w lines notitle lw width1 dt 11 lc rgb col2014
# }}}

# plot BLAST on CCO {{{
set origin 0.66, 0.33
set title "Cellular component"
@XTICS; @YTICS
plot \
    in_dir . 'pr_blast_cco.dat' index 0 u 2:1 w lines notitle lw width2 lc rgb col2011, \
    in_dir . 'pr_blast_cco.dat' index 4 u 2:1 w lines notitle lw width1 lc rgb col2012, \
    in_dir . 'pr_blast_cco.dat' index 5 u 2:1 w lines notitle lw width1 lc rgb col2013, \
    in_dir . 'pr_blast_cco.dat' index 6 u 2:1 w lines notitle lw width1 lc rgb col2014, \
    in_dir . 'pr_blast_cco.dat' index 7 u 2:1 w lines notitle lw width1 dt 11 lc rgb col2012, \
    in_dir . 'pr_blast_cco.dat' index 8 u 2:1 w lines notitle lw width1 dt 11 lc rgb col2013, \
    in_dir . 'pr_blast_cco.dat' index 9 u 2:1 w lines notitle lw width1 dt 11 lc rgb col2014
# }}}

# plot Swiss-Prot on MFO {{{
set style fill solid noborder
set origin 0.00, 0.00
set title "Molecular function"
#set key at 1.055,1.05
#set key at 1.02,1.05
@XTICS; @YTICS
plot \
       in_dir . 'pr_com_mfo.dat' index 0 u 2:1:(0.02) w circles t "2011" lc rgb col2011, \
       in_dir . 'pr_com_mfo.dat' index 4 u 2:1:(0.02) w circles t "2012" lc rgb col2012, \
       in_dir . 'pr_com_mfo.dat' index 5 u 2:1:(0.02) w circles t "2013" lc rgb col2013, \
       in_dir . 'pr_com_mfo.dat' index 6 u 2:1:(0.02) w circles t "2014" lc rgb col2014, \
       in_dir . 'pr_com_mfo.dat' index 7 u 2:1:(0.02) w circles t "2012'" fs fill empty lw width1 lc rgb col2012, \
       in_dir . 'pr_com_mfo.dat' index 8 u 2:1:(0.02) w circles t "2013'" fs fill empty lw width1 lc rgb col2013, \
       in_dir . 'pr_com_mfo.dat' index 9 u 2:1:(0.02) w circles t "2014'" fs fill empty lw width1 lc rgb col2014
# }}}

# plot Swiss-Prot on BPO {{{
set style fill solid noborder
set origin 0.33, 0.00
set title "Biological process"
@XTICS; @YTICS
plot \
       in_dir . 'pr_com_bpo.dat' index 0 u 2:1:(0.02) w circles notitle lc rgb col2011, \
       in_dir . 'pr_com_bpo.dat' index 4 u 2:1:(0.02) w circles notitle lc rgb col2012, \
       in_dir . 'pr_com_bpo.dat' index 5 u 2:1:(0.02) w circles notitle lc rgb col2013, \
       in_dir . 'pr_com_bpo.dat' index 6 u 2:1:(0.02) w circles notitle lc rgb col2014, \
       in_dir . 'pr_com_bpo.dat' index 7 u 2:1:(0.02) w circles notitle fs fill empty lw width1 lc rgb col2012, \
       in_dir . 'pr_com_bpo.dat' index 8 u 2:1:(0.02) w circles notitle fs fill empty lw width1 lc rgb col2013, \
       in_dir . 'pr_com_bpo.dat' index 9 u 2:1:(0.02) w circles notitle fs fill empty lw width1 lc rgb col2014
# }}}

# plot Swiss-Prot on CCO {{{
set style fill solid noborder
set origin 0.66, 0.00
set title "Cellular component"
@XTICS; @YTICS
plot \
    in_dir . 'pr_com_cco.dat' index 0 u 2:1:(0.02) w circles notitle lc rgb col2011, \
    in_dir . 'pr_com_cco.dat' index 4 u 2:1:(0.02) w circles notitle lc rgb col2012, \
    in_dir . 'pr_com_cco.dat' index 5 u 2:1:(0.02) w circles notitle lc rgb col2013, \
    in_dir . 'pr_com_cco.dat' index 6 u 2:1:(0.02) w circles notitle lc rgb col2014, \
    in_dir . 'pr_com_cco.dat' index 7 u 2:1:(0.02) w circles notitle fs fill empty lw width1 lc rgb col2012, \
    in_dir . 'pr_com_cco.dat' index 8 u 2:1:(0.02) w circles notitle fs fill empty lw width1 lc rgb col2013, \
    in_dir . 'pr_com_cco.dat' index 9 u 2:1:(0.02) w circles notitle fs fill empty lw width1 lc rgb col2014
# }}}

# -------------
# Yuxiang Jiang
# School of Informatics and Computing
# Indiana Univesity Bloomington
# Last modified: Sat 16 Jul 2016 03:55:29 PM E
