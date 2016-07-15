prologues := 3;

verbatimtex
%&latex
\documentclass{article}
\usepackage{bm}
\begin{document}
etex

beginfig(1);
u  := 18bp; % 24bp = 1/3 inch
cellw := 2u;
cellh := 1.5u;

pair anchor[];
anchor0 = origin;

fs := 0.9; % font size scale, 1.0 = 10 pt

draw (anchor0+origin)      -- (anchor0+(0,2*cellh));
draw (anchor0+(cellw,0))   -- (anchor0+(cellw,2*cellh));
draw (anchor0+(2*cellw,0)) -- (anchor0+(2*cellw,2*cellh));
draw (anchor0+origin)      -- (anchor0+(2*cellw,0));
draw (anchor0+(0,cellh))   -- (anchor0+(2*cellw,cellh));
draw (anchor0+(0,2*cellh)) -- (anchor0+(2*cellw,2*cellh));

label(btex $tn$ etex scaled fs, (anchor0+(0.5*cellw,1.5*cellh)));
label(btex $fn$ etex scaled fs, (anchor0+(0.5*cellw,0.5*cellh)));
label(btex $fp$ etex scaled fs, (anchor0+(1.5*cellw,1.5*cellh)));
label(btex $tp$ etex scaled fs, (anchor0+(1.5*cellw,0.5*cellh)));

label.top(btex $0$ etex scaled fs, (anchor0+(0.5*cellw,2.0*cellh)));
label.top(btex $1$ etex scaled fs, (anchor0+(1.5*cellw,2.0*cellh)));
label.lft(btex $0$ etex scaled fs rotated 90, (anchor0+(0.0,1.5*cellh)));
label.lft(btex $1$ etex scaled fs rotated 90, (anchor0+(0.0,0.5*cellh)));

label.top(btex prediction etex scaled fs, (anchor0+(cellw, 2.5*cellh)));
label.lft(btex true etex scaled fs rotated 90, (anchor0+(-.3cellw, cellh)));

anchor1 = (2.8*cellw, 0);
draw (anchor1+origin)      -- (anchor1+(0,2*cellh));
draw (anchor1+(cellw,0))   -- (anchor1+(cellw,2*cellh));
draw (anchor1+(2*cellw,0)) -- (anchor1+(2*cellw,2*cellh));
draw (anchor1+origin)      -- (anchor1+(2*cellw,0));
draw (anchor1+(0,cellh))   -- (anchor1+(2*cellw,cellh));
draw (anchor1+(0,2*cellh)) -- (anchor1+(2*cellw,2*cellh));

drawarrow (anchor1+(2*cellw,1.5*cellh)){dir -10} .. {dir 190}(anchor1+(2*cellw,.5*cellh));
label.rt(btex $\delta=\alpha+\beta$ etex scaled fs, (anchor1+(2.4*cellw,cellh)));

label(btex $tn-\alpha$ etex scaled fs, (anchor1+(0.5*cellw,1.5*cellh)));
label(btex $fn+\alpha$ etex scaled fs, (anchor1+(0.5*cellw,0.5*cellh)));
label(btex $fp-\beta$ etex scaled fs,  (anchor1+(1.5*cellw,1.5*cellh)));
label(btex $tp+\beta$ etex scaled fs,  (anchor1+(1.5*cellw,0.5*cellh)));

label.top(btex $0$ etex scaled fs, (anchor1+(0.5*cellw,2.0*cellh)));
label.top(btex $1$ etex scaled fs, (anchor1+(1.5*cellw,2.0*cellh)));
label.lft(btex $0$ etex scaled fs rotated 90, (anchor1+(0,1.5*cellh)));
label.lft(btex $1$ etex scaled fs rotated 90, (anchor1+(0,0.5*cellh)));

label.top(btex prediction etex scaled fs, (anchor1+(cellw, 2.5*cellh)));

label(btex \textsf{A.~Incomplete data} etex scaled fs, (anchor0+(cellw,-.8cellh)));
label(btex \textsf{B.~Complete data} etex scaled fs, (anchor1+(cellw,-.8cellh)));
endfig;

verbatimtex
\end{document}
etex

end;
