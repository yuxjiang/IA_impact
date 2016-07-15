prologues := 3;

verbatimtex
%&latex
\documentclass{article}
\begin{document}
etex

unit := .8in;

beginfig(1);
barH := unit;
h1   := 2/3 barH;
h2   := 3/4 barH;
h3   := 4/5 barH;
h4   := 5/6 barH;

color Green;
Green = (0, .502, 0);

z0 = origin;
z1 = z0 + (unit, 0);
z2 = z1 + (unit, 0);
z3 = z1 + (2unit, 0);
z4 = z1 + (3unit, 0);
z5 = (x4, 1.2barH);

fill z0..(x1,h1){dir 5}..(x2,h2)..(x3,h3)..(x4,h4)--z4--cycle withcolor .5[white, Green];
fill (x1,h1){dir 5}..(x2,h2)..(x3,h3)..(x4,h4)--(x4,h1)--cycle withcolor Green;

label.top(btex collect test set etex, (x1, 1.3barH));
drawarrow (x1, 1.3 barH)--(x1, barH);

drawarrow (-2/3unit, 0)--(4.5unit, 0) withpen pencircle scaled 1.5;
label.rt(btex time etex, (4.5unit, 0));

drawdot z0 withpen pencircle scaled 4;
drawdot z1 withpen pencircle scaled 4;
drawdot z2 withpen pencircle scaled 4;
drawdot z3 withpen pencircle scaled 4;
drawdot z4 withpen pencircle scaled 4;
%drawdot (x3+1/2unit, 1/2barH) withpen pencircle scaled 2;
%drawdot (x3+2/3unit, 1/2barH) withpen pencircle scaled 2;
%drawdot (x3+5/6unit, 1/2barH) withpen pencircle scaled 2;

drawarrow (x0-.5unit, 2/3barH)--(x0, 2/3barH);
label.top(btex training etex, (x0-.5unit, 2/3barH));

draw z0--(z0 + (0, barH)) dashed evenly;
draw z1--(z1 + (0, barH)) dashed evenly;
draw z2--(z2 + (0, barH)) dashed evenly;
draw z3--(z3 + (0, barH)) dashed evenly;
draw z4--(z4 + (0, barH)) dashed evenly;

fill unitsquare scaled 1/15unit shifted z5 withcolor Green;
label.rt(btex \begin{tabular}{@{}l@{}} new\\annotations \end{tabular} etex, (x5+1/15unit, y5+1/30unit));
drawarrow (x5-1/15unit, y5){dir 180}..{dir -160}(1/2[x1,x2], h2) withcolor Green;
drawarrow (x5-1/15unit, y5){dir 180}..(1/2[x2,x3], h3) withcolor Green;
drawarrow (x5-1/15unit, y5){dir 180}..{dir -120}(1/2[x3,x4], h4) withcolor Green;

label.top(btex \begin{tabular}{@{}c@{}} accumulate\\annotations \end{tabular} etex, .5[z0, z1]);

label.bot(btex 2010 etex, z0);
label.bot(btex 2011 etex, z1);
label.bot(btex 2012 etex, z2);
label.bot(btex 2013 etex, z3);
label.bot(btex 2014 etex, z4);
endfig;
end
