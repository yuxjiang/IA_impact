#!/home/yuxjiang/local/bin/gnuplot -persist
#
# GNUPLOT script for RU-MI curves
#
# Note
# ----
# [1] Requires gnuplot version 5.0+
# [2] 'in_dir' and 'out_dir' needs to be specified before running this script.

# Require (under 'in_dir')
# -------
# (gotcha RU-MI curves)
#   rm_gotcha_bpo.dat
#   rm_gotcha_cco.dat
#   rm_gotcha_mfo.dat
#
# (blast RU-MI curves)
#   rm_blast_bpo.dat
#   rm_blast_cco.dat
#   rm_blast_mfo.dat
#
# (Swiss-Prot RU-MI curves)
#   rm_com_bpo.dat
#   rm_com_cco.dat
#   rm_com_mfo.dat
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
# Output
# ------
# 'out_dir'/rmcurves.tex

# input/output {{{
in_dir  = '/u/yuxjiang/Projects/ia_git/result/curves/'
out_dir = '/u/yuxjiang/Projects/ia_git/figure/fig7/'
# }}}

# setting up {{{
# terminal = epslatex {{{
width = 12
set term epslatex standalone size width,0.8*width color "cmr,14"
set output out_dir . 'rmcurves.tex'
# }}}
# # terminal = png {{{
# width = 1200
# set term png enhanced large size width,0.8*width
# set output out_dir . 'rmcurves.png'
# # }}}

set autoscale
set xlabel "Remaining uncertainty"
set ylabel "Misinformation"
set zeroaxis lt -1 lw 2
set xtics nomirror
set ytics nomirror
unset border

set lmargin 8
set tmargin 5

set label 1 '\textsf{\large A. GOtcha}' at screen 0.0,0.96
set label 2 '\textsf{\large B. BLAST}' at screen 0.0,0.63
set label 3 '\textsf{\large C. Swiss-Prot}' at screen 0.0,0.3

# line color:
col2011 = "#808080"
col2012 = "#008000"
col2013 = "#4169E1"
col2014 = "#DC143C"

set key samplen 1 reverse Left
width1 = 8
width2 = 10

set dashtype 11 (1,1)

set multiplot
set size 0.35,0.35
# }}}

# plot GOtcha on MFO {{{
set key at 16,105
set title "Molecular function"
set xrange [0:16]
set ytics 20
set origin 0,0.66
plot \
    in_dir . 'rm_gotcha_mfo.dat' index 0 u 1:2 w lines t "2011"  lw width2 lc rgb col2011, \
    in_dir . 'rm_gotcha_mfo.dat' index 4 u 1:2 w lines t "2012"  lw width1 lc rgb col2012, \
    in_dir . 'rm_gotcha_mfo.dat' index 5 u 1:2 w lines t "2013"  lw width1 lc rgb col2013, \
    in_dir . 'rm_gotcha_mfo.dat' index 6 u 1:2 w lines t "2014"  lw width1 lc rgb col2014, \
    in_dir . 'rm_gotcha_mfo.dat' index 7 u 1:2 w lines t "2012'" lw width1 dt 11 lc rgb col2012, \
    in_dir . 'rm_gotcha_mfo.dat' index 8 u 1:2 w lines t "2013'" lw width1 dt 11 lc rgb col2013, \
    in_dir . 'rm_gotcha_mfo.dat' index 9 u 1:2 w lines t "2014'" lw width1 dt 11 lc rgb col2014
# }}}

# plot GOtcha on BPO {{{
set title "Biological process"
set xrange [0:30]
set ytics 100
set origin 0.33,0.66
plot \
    in_dir . 'rm_gotcha_bpo.dat' index 0 u 1:2 w lines notitle lw width2 lc rgb col2011, \
    in_dir . 'rm_gotcha_bpo.dat' index 4 u 1:2 w lines notitle lw width1 lc rgb col2012, \
    in_dir . 'rm_gotcha_bpo.dat' index 5 u 1:2 w lines notitle lw width1 lc rgb col2013, \
    in_dir . 'rm_gotcha_bpo.dat' index 6 u 1:2 w lines notitle lw width1 lc rgb col2014, \
    in_dir . 'rm_gotcha_bpo.dat' index 7 u 1:2 w lines notitle lw width1 dt 11 lc rgb col2012, \
    in_dir . 'rm_gotcha_bpo.dat' index 8 u 1:2 w lines notitle lw width1 dt 11 lc rgb col2013, \
    in_dir . 'rm_gotcha_bpo.dat' index 9 u 1:2 w lines notitle lw width1 dt 11 lc rgb col2014
# }}}

# plot GOtcha on CCO {{{
set title "Cellular component"
set xrange [0:12]
set ytics 20
set origin 0.66,0.66
plot \
    in_dir . 'rm_gotcha_cco.dat' index 0 u 1:2 w lines notitle lw width2 lc rgb col2011, \
    in_dir . 'rm_gotcha_cco.dat' index 4 u 1:2 w lines notitle lw width1 lc rgb col2012, \
    in_dir . 'rm_gotcha_cco.dat' index 5 u 1:2 w lines notitle lw width1 lc rgb col2013, \
    in_dir . 'rm_gotcha_cco.dat' index 6 u 1:2 w lines notitle lw width1 lc rgb col2014, \
    in_dir . 'rm_gotcha_cco.dat' index 7 u 1:2 w lines notitle lw width1 dt 11 lc rgb col2012, \
    in_dir . 'rm_gotcha_cco.dat' index 8 u 1:2 w lines notitle lw width1 dt 11 lc rgb col2013, \
    in_dir . 'rm_gotcha_cco.dat' index 9 u 1:2 w lines notitle lw width1 dt 11 lc rgb col2014
# }}}

# plot BLAST on MFO {{{
set title "Molecular function"
set xrange [0:16]
set ytics 20
set origin 0,0.33
plot \
    in_dir . 'rm_blast_mfo.dat' index 0 u 1:2 w lines t "2011"  lw width2 lc rgb col2011, \
    in_dir . 'rm_blast_mfo.dat' index 4 u 1:2 w lines t "2012"  lw width1 lc rgb col2012, \
    in_dir . 'rm_blast_mfo.dat' index 5 u 1:2 w lines t "2013"  lw width1 lc rgb col2013, \
    in_dir . 'rm_blast_mfo.dat' index 6 u 1:2 w lines t "2014"  lw width1 lc rgb col2014, \
    in_dir . 'rm_blast_mfo.dat' index 7 u 1:2 w lines t "2012'" lw width1 dt 11 lc rgb col2012, \
    in_dir . 'rm_blast_mfo.dat' index 8 u 1:2 w lines t "2013'" lw width1 dt 11 lc rgb col2013, \
    in_dir . 'rm_blast_mfo.dat' index 9 u 1:2 w lines t "2014'" lw width1 dt 11 lc rgb col2014
# }}}

# plot BLAST on BPO {{{
set title "Biological process"
set xrange [0:30]
set ytics 100
set origin 0.33,0.33
plot \
    in_dir . 'rm_blast_bpo.dat' index 0 u 1:2 w lines notitle lw width2 lc rgb col2011, \
    in_dir . 'rm_blast_bpo.dat' index 4 u 1:2 w lines notitle lw width1 lc rgb col2012, \
    in_dir . 'rm_blast_bpo.dat' index 5 u 1:2 w lines notitle lw width1 lc rgb col2013, \
    in_dir . 'rm_blast_bpo.dat' index 6 u 1:2 w lines notitle lw width1 lc rgb col2014, \
    in_dir . 'rm_blast_bpo.dat' index 7 u 1:2 w lines notitle lw width1 dt 11 lc rgb col2012, \
    in_dir . 'rm_blast_bpo.dat' index 8 u 1:2 w lines notitle lw width1 dt 11 lc rgb col2013, \
    in_dir . 'rm_blast_bpo.dat' index 9 u 1:2 w lines notitle lw width1 dt 11 lc rgb col2014
# }}}

# plot BLAST on CCO {{{
set title "Cellular component"
set xrange [0:12]
set ytics 20
set origin 0.66,0.33
plot \
    in_dir . 'rm_blast_cco.dat' index 0 u 1:2 w lines notitle lw width2 lc rgb col2011, \
    in_dir . 'rm_blast_cco.dat' index 4 u 1:2 w lines notitle lw width1 lc rgb col2012, \
    in_dir . 'rm_blast_cco.dat' index 5 u 1:2 w lines notitle lw width1 lc rgb col2013, \
    in_dir . 'rm_blast_cco.dat' index 6 u 1:2 w lines notitle lw width1 lc rgb col2014, \
    in_dir . 'rm_blast_cco.dat' index 7 u 1:2 w lines notitle lw width1 dt 11 lc rgb col2012, \
    in_dir . 'rm_blast_cco.dat' index 8 u 1:2 w lines notitle lw width1 dt 11 lc rgb col2013, \
    in_dir . 'rm_blast_cco.dat' index 9 u 1:2 w lines notitle lw width1 dt 11 lc rgb col2014
# }}}

# plot Swiss-Prot on MFO {{{
set key at 16,10.5
set style fill solid noborder
set title "Molecular function"
set xrange [0:16]
set yrange [0:10]
set ytics 2
set origin 0,0
plot \
    in_dir . 'rm_com_mfo.dat' index 0 u 1:2:(0.3) w circles t "2011"  lc rgb col2011, \
    in_dir . 'rm_com_mfo.dat' index 4 u 1:2:(0.3) w circles t "2012"  lc rgb col2012, \
    in_dir . 'rm_com_mfo.dat' index 5 u 1:2:(0.3) w circles t "2013"  lc rgb col2013, \
    in_dir . 'rm_com_mfo.dat' index 6 u 1:2:(0.3) w circles t "2014"  lc rgb col2014, \
    in_dir . 'rm_com_mfo.dat' index 7 u 1:2:(0.3) w circles t "2012'" fs fill empty lw width1 lc rgb col2012, \
    in_dir . 'rm_com_mfo.dat' index 8 u 1:2:(0.3) w circles t "2013'" fs fill empty lw width1 lc rgb col2013, \
    in_dir . 'rm_com_mfo.dat' index 9 u 1:2:(0.3) w circles t "2014'" fs fill empty lw width1 lc rgb col2014
# }}}

# plot Swiss-Prot on BPO {{{
set style fill solid noborder
set title "Biological process"
set xrange [0:30]
set yrange [0:10]
set ytics 2
set origin 0.33,0
plot \
    in_dir . 'rm_com_bpo.dat' index 0 u 1:2:(0.6) w circles notitle lc rgb col2011, \
    in_dir . 'rm_com_bpo.dat' index 4 u 1:2:(0.6) w circles notitle lc rgb col2012, \
    in_dir . 'rm_com_bpo.dat' index 5 u 1:2:(0.6) w circles notitle lc rgb col2013, \
    in_dir . 'rm_com_bpo.dat' index 6 u 1:2:(0.6) w circles notitle lc rgb col2014, \
    in_dir . 'rm_com_bpo.dat' index 7 u 1:2:(0.6) w circles notitle fs fill empty lw width1 lc rgb col2012, \
    in_dir . 'rm_com_bpo.dat' index 8 u 1:2:(0.6) w circles notitle fs fill empty lw width1 lc rgb col2013, \
    in_dir . 'rm_com_bpo.dat' index 9 u 1:2:(0.6) w circles notitle fs fill empty lw width1 lc rgb col2014
# }}}

# plot Swiss-Prot on CCO {{{
set style fill solid noborder
set title "Cellular component"
set xrange [0:12]
set yrange [0:10]
set ytics 2
set origin 0.66,0
plot \
    in_dir . 'rm_com_cco.dat' index 0 u 1:2:(0.225) w circles notitle lc rgb col2011, \
    in_dir . 'rm_com_cco.dat' index 4 u 1:2:(0.225) w circles notitle lc rgb col2012, \
    in_dir . 'rm_com_cco.dat' index 5 u 1:2:(0.225) w circles notitle lc rgb col2013, \
    in_dir . 'rm_com_cco.dat' index 6 u 1:2:(0.225) w circles notitle lc rgb col2014, \
    in_dir . 'rm_com_cco.dat' index 7 u 1:2:(0.225) w circles notitle fs fill empty lw width1 lc rgb col2012, \
    in_dir . 'rm_com_cco.dat' index 8 u 1:2:(0.225) w circles notitle fs fill empty lw width1 lc rgb col2013, \
    in_dir . 'rm_com_cco.dat' index 9 u 1:2:(0.225) w circles notitle fs fill empty lw width1 lc rgb col2014
# }}}

# -------------
# Yuxiang Jiang (yuxjiang@indiana.edu)
# Department of Computer Science
# Indiana University, Bloomington
# Last modified: Fri 15 Jul 2016 05:14:55 PM E
