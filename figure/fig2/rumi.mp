prologues := 3;

verbatimtex
%&latex
\documentclass{article}
\usepackage{bm}
\begin{document}
etex

input boxes;

unit := 2in;

color RoyalBlue, Crimson, Green;
RoyalBlue = (.255, .412, .882);
Crimson = (.863, .078, .235);
Green = (0, .502, 0);

color Pcolor, Tcolor, newTcolor;
Pcolor = .6[white, RoyalBlue];
Tcolor = .2[white, Green];
newTcolor = .5[white, Green];

def drawellipse(expr a, b, d, t) =
    draw fullcircle xscaled (abs(b-a)+2d) yscaled (t*(abs(b-a)+2d))
            rotated angle(b-a) shifted .5[a, b] 
            withpen pencircle scaled 2
            withcolor .5white dashed evenly;
enddef;

pair anchor[];

anchor0 = origin;
anchor1 = anchor0 shifted (1.3unit, .3unit);

beginfig(1);
a1 = 0.6unit; b1 = 0.4unit;
a2 = 0.4unit; b2 = 0.3unit;
c = 0.4unit;
d = 0.1unit;
z00 = anchor0 + (-0.5a1, 0.0);
z01 = anchor0 + (c+0.5a1, 0);
z11 = anchor0 + (0.0, 0.8b1);
z21 = anchor0 + (c-0.15a1, 0.8b1);
z22 = anchor0 + (c+0.15a1, 0.8b1);

path P, T, newT, qP[], halfP, alpha, beta;

P = fullcircle xscaled a1 yscaled b1;
halfP = halfcircle rotated -90 xscaled a1 yscaled b1;
qP1 = quartercircle xscaled a1 yscaled b1;
qP2 = quartercircle rotated -90 xscaled a1 yscaled b1;
newT = P shifted (c, 0);
T = fullcircle xscaled a2 yscaled b2 shifted (c, 0);
beta = buildcycle(qP1, newT, qP2, T);

fill P withcolor Pcolor;
fill newT withcolor newTcolor;
fill beta withcolor .5[Pcolor, newTcolor];
fill T withcolor Tcolor;
fill buildcycle(halfP, T) withcolor .5[white, Crimson];

draw P withpen pencircle scaled 1.2;
draw T withpen pencircle scaled 1.2 dashed evenly;
draw newT withpen pencircle scaled 1.2;

label(btex $mi(P, T)$ etex, .5[point 4 of P, point 4 of newT]);
label(btex $ru(P, T)$ etex, .5[point 0 of P, point 0 of T]);

path pp[];
pp11 = fullcircle scaled d shifted z11;
pp21 = fullcircle scaled d shifted z21;
pp22 = fullcircle scaled d shifted z22;
draw pp11;
draw pp21 dashed evenly scaled .5;
draw pp22;
label(btex $P$ etex, z11);
label(btex $T$ etex, z21);
label(btex $T'$ etex, z22);
drawarrow z21--z22 cutbefore pp21 cutafter pp22;

label(btex $\alpha$ etex, .5[point 0 of newT, point 0 of T]);
label(btex $\beta$ etex, .5[point 4 of newT, point 4 of T]);

%%
diameter = 0.15unit;
yskip = 0.3unit;
ang1 = 35;
ang2 = 20;
xskip1 = yskip / cosd(ang1) * sind(ang1);
xskip2 = yskip / cosd(ang2) * sind(ang2);

z99 = anchor1;
z50 = z99 shifted (-xskip1, -yskip);
z51 = z99 shifted (+xskip1, -yskip);
z60 = z50 shifted (-xskip1, -yskip);
z61 = z99 shifted (0, -2yskip);
z62 = z51 shifted (+xskip1, -yskip);
z70 = z60 shifted (-xskip2, -yskip);
z71 = z60 shifted (+xskip2, -yskip);
z72 = z61 shifted (-xskip2, -yskip);
z73 = z61 shifted (+xskip2, -yskip);

z40 = .4[z60, z61];
z41 = .5[z71, z72] shifted (0, -.4yskip);

path p[];
p00 = fullcircle scaled diameter shifted z99;
p10 = fullcircle scaled diameter shifted z50;
p11 = fullcircle scaled diameter shifted z51;
p20 = fullcircle scaled diameter shifted z60;
p21 = fullcircle scaled diameter shifted z61;
p22 = fullcircle scaled diameter shifted z62;
p30 = fullcircle scaled diameter shifted z70;
p31 = fullcircle scaled diameter shifted z71;
p32 = fullcircle scaled diameter shifted z72;
p33 = fullcircle scaled diameter shifted z73;

p40 = fullcircle scaled .5diameter shifted z40;
p41 = fullcircle scaled .5diameter shifted z41;

fill p00 withcolor .5[white, Crimson];
fill p10 withcolor .5[white, Crimson];
fill p11 withcolor .5[white, Crimson];
fill p21 withcolor .5[white, Crimson];
fill p20 withcolor .5[Pcolor, newTcolor];
fill p22 withcolor Tcolor;
fill p33 withcolor Tcolor;
fill p30 withcolor Pcolor;
fill p31 withcolor newTcolor;
fill p32 withcolor newTcolor;

draw p00 withpen pencircle scaled 1.5;
draw p10 withpen pencircle scaled 1.5;
draw p11 withpen pencircle scaled 1.5;
draw p20 withpen pencircle scaled 1.5;
draw p21 withpen pencircle scaled 1.5;
draw p22 withpen pencircle scaled 1.5;
draw p30 withpen pencircle scaled 1.5;
draw p31 withpen pencircle scaled 1.5;
draw p32 withpen pencircle scaled 1.5;
draw p33 withpen pencircle scaled 1.5;

drawellipse(z73, z62, diameter, 0.35);
drawellipse(z70, z60, diameter, 0.4);

drawarrow z99--z50 cutbefore p00 cutafter p10;
drawarrow z99--z51 cutbefore p00 cutafter p11;
drawarrow z50--z60 cutbefore p10 cutafter p20;
drawarrow z50--z61 cutbefore p10 cutafter p21;
drawarrow z51--z61 cutbefore p11 cutafter p21;
drawarrow z51--z62 cutbefore p11 cutafter p22;
drawarrow z60--z70 cutbefore p20 cutafter p30;
drawarrow z60--z71 cutbefore p20 cutafter p31;
drawarrow z61--z72 cutbefore p21 cutafter p32;
drawarrow z61--z73 cutbefore p21 cutafter p33;

label(btex $p_1$ etex, z70);
label(btex $p_2$ etex, z61);
label(btex $t_1$ etex, z73);
label(btex $t_2$ etex, z62);
label(btex $t_3$ etex, z71);
label(btex $t_4$ etex, z72);
label.rt(btex root of ontology etex, z99 shifted (.5diameter, 0));
label.lft(btex $mi(P, T)$ etex, .6[z60, z70] shifted (-diameter, 0));
label.rt(btex $ru(P, T)$ etex, .9[z62, z73] shifted (diameter, -0.3diameter));
label(btex $\beta$ etex, z40);
label(btex $\alpha$ etex, z41);

drawarrow z40--z60 cutbefore p40 cutafter p20 withcolor RoyalBlue;
drawarrow z41--z71 cutbefore p41 cutafter p31 withcolor Green;
drawarrow z41--z72 cutbefore p41 cutafter p32 withcolor Green;

%% labelling A and B
label(btex \textsf{\textbf{A}.} etex, (x11-.5a1,y11));
label(btex \textsf{\textbf{B}.} etex, (x22+.6a1,y22));
endfig;
end
