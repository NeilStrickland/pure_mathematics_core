# This file is obsolete.  It was used to generate plots which are now handled by tikz.

with(plots):
#currentdir("c:/Documents and Settings/Neil Strickland/My Documents/teach/core/notes"):

pics := table([]):

nPi := evalf(Pi):
nE := evalf(exp(1)):

#eps2pdf := 
# proc(nam)
#  local prog;
#  prog := "\"C:\\Program Files\\eps2pdf\\eps2pdf.exe\"";
#  if nargs = 0 then
#   system(cat(prog," /d=images"));
#  else
#   system(cat(prog," /f=images\\",nam));
#  fi;
# end:

makepic := 
 proc(nam,pic,d_)
  local d,opt;
  global pics;
  d := `if`(nargs > 2,d_,[5,5]);
  opt := sprintf("portrait,noborder,width=%Acm,height=%Acm",d[1],d[2]);
  plotsetup(cps,plotoptions=opt,plotoutput=cat("pics/",nam,".eps"));
  pics[nam] := eval(pic);
  print(pic);
 end:

makepic(
 "unitsq",
 PLOT(
  POLYGONS([[0,0],[1,0],[1,1],[0,1]],COLOR(RGB,1,0,0)),
  VIEW(-1.2..1.2,-0.2..1.2),
  SCALING(CONSTRAINED),
  AXESTICKS(3,2))):

makepic(
 "unitdisc",
 PLOT(
  POLYGONS([seq([cos(t*nPi/20.),sin(t*nPi/20.)],t=0..40)],COLOR(RGB,1,0,0)),
  SYMBOL(DIAMOND,20),
  POINTS([1,0],[0,1],[-1,0],[0,-1]),
  TEXT([1.2,0.1],"(1,0)"),
  TEXT([-1.22,.1],"(-1,0)"),
  TEXT([0.2,1.1],"(0,1)"),
  TEXT([0.2,-1.1],"(0,-1)"),
  VIEW(-1.4..1.4,-1.4..1.4),
  SCALING(CONSTRAINED),
  AXESTICKS(0,0))):

makepic(
 "unitcirc",
 PLOT(
  CURVES([seq([cos(t*nPi/20.),sin(t*nPi/20.)],t=0..40)],COLOR(RGB,1,0,0)),
  SYMBOL(DIAMOND,20),
  POINTS([1,0],[0,1],[-1,0],[0,-1]),
  TEXT([1.2,0.1],"(1,0)"),
  TEXT([-1.22,.1],"(-1,0)"),
  TEXT([0.2,1.1],"(0,1)"),
  TEXT([0.2,-1.1],"(0,-1)"),
  VIEW(-1.4..1.4,-1.4..1.4),
  SCALING(CONSTRAINED),
  AXESTICKS(0,0))):

npi :=
 proc(n)
  if n<-1 then 
   return(sprintf("- %dp",-n));
  elif n=-1 then
   return("-p");
  elif n=0 then
   return("0");
  elif n=1 then
   return("p")
  else
   return(sprintf("%dp",n));
  fi;
 end:

makepic(
 "bigcosgraph",
 PLOT(
  CURVES(seq([[k,0],[k,-.1]],k=-6..6)),
  seq(TEXT([k,-.3],npi(k),FONT(SYMBOL,8)),k=-6..6),
  op(plot(cos(Pi*t),t=-6..6)),
  VIEW(-6..6,-1.2..1.2),
  SCALING(CONSTRAINED),
  AXESTICKS(0,0)),
  [15,4]):

makepic(
 "floor",
 plot(floor(x),
      x=-5..5,
      scaling=constrained,
      xtickmarks=11,
      ytickmarks=11)):

makepic(
 "sqwave",
 plot((-1)^floor(x),
      x=-5..5,y=-1..1,
      scaling=constrained,
      xtickmarks=11,
      ytickmarks=3),
 [10,2]):

makepic(
 "helix",
 spacecurve([t/3,cos(t),sin(t)],
            t=-4*Pi..4*Pi,
            scaling=constrained,
            axes=normal,
            tickmarks=[0,0,0]));

makepic(
 "subpara",
 PLOT(
  POLYGONS(
   seq([[k/10.,-2],[(k+1)/10.,-2],[(k+1)/10.,(k+1)^2/100.],[k/10.,k^2/100.]],k=-20..19),
   COLOR(RGB,1,0,0),
   STYLE(PATCHNOGRID))));

makepic(
 "expgraph",
 PLOT( op(plot(exp(x),x=-2..2,y=-.5..6)),
  CURVES(
   [[1,0],[1,nE],[0,nE]],
   COLOR(RGB,0,1,0)
  ),
  POINTS([0,1],[0,nE]),
  TEXT([-.1,1],"1"),
  TEXT([-.1,nE],"e")
 ),
 [7,7]
);

makepic(
 "loggraph",
 PLOT(
  op(plot(log(y),y=-1..9,x=-3..3)),
  CURVES([[0,1],[nE,1],[nE,0]],
         [[0,2],[nE^2,2],[nE^2,0]],
         COLOR(RGB,0,1,0)),
  POINTS([nE,0],[nE^2,0]),
  TEXT([nE,-.2],"e"),
  TEXT([nE^2,-.2],"e"),
  TEXT([nE^2+.16,-.16],"2",FONT(SYMBOL,6)),
  TEXT([5,1.3],"log(x)")
 ),
 [7,7]
);

makepic(
 "hypgraph",
 PLOT( op(plot([sinh(x),cosh(x),tanh(x)],
          x=-2..2,
          colour=[red,green,blue])),
  TEXT([1.7,1.77],"sinh(x)"),
  TEXT([0.4,1.43],"cosh(x)"),
  TEXT([1.5,0.61],"tanh(x)")),
 [7,7]
);

th := 0.7:

makepic(
 "trigdef",
 PLOT(
  op(plot([1,t,t=0..Pi],coords=polar)),
  op(plot([.2,t,t=0..th],coords=polar)),
  POINTS([0,sin(th)],[cos(th),sin(th)],[cos(th),0],[1,0]),
  CURVES([[0,0],[cos(th),sin(th)]],COLOR(RGB,0,0,1)),
  CURVES([[-.2,sin(th)],[cos(th),sin(th)],[cos(th),-.2]],COLOR(RGB,1,0,1)),
  TEXT([.3,.36],"1"),
  TEXT([.25,.1],"q",FONT(SYMBOL)),
  TEXT([1,-.1],"A"),
  TEXT([cos(th)+.5,sin(th)+.06],"P=(cos(  ),sin(  ))"),
  TEXT([cos(th)+.50,sin(th)+.06],"q",FONT(SYMBOL)),
  TEXT([cos(th)+.81,sin(th)+.06],"q",FONT(SYMBOL)),
  TEXT([cos(th)/2,-.1],"cos(  )"),
  TEXT([-.15,sin(th)/2],"sin(  )"),
  TEXT([cos(th)/2+.08,-.1],"q",FONT(SYMBOL)),
  TEXT([-.09,sin(th)/2],"q",FONT(SYMBOL)),
  AXESTICKS(0,0), 
  SCALING(CONSTRAINED)
 ),
 [12,7]
);


makepic(
 "singraph",
 PLOT(
  CURVES(seq([[k,0],[k,-.1]],k=-3..3)),
  seq(TEXT([k,-.3],npi(k),FONT(SYMBOL,8)),k=-3..3),
  op(plot(sin(Pi*t),t=-3..3)),
  TEXT([1.5,1.1],"sin(x)"),
  VIEW(-3..3,-1.2..1.2),
  SCALING(CONSTRAINED),
  AXESTICKS(0,0)),
  [7,4]):

makepic(
 "cosgraph",
 PLOT(
  CURVES(seq([[k,0],[k,-.1]],k=-3..3)),
  seq(TEXT([k,-.3],npi(k),FONT(SYMBOL,8)),k=-3..3),
  op(plot(cos(Pi*t),t=-3..3)),
  TEXT([1,1.1],"cos(x)"),
  VIEW(-3..3,-1.2..1.2),
  SCALING(CONSTRAINED),
  AXESTICKS(0,0)),
  [7,4]):

makepic(
 "tangraph",
 PLOT(
  CURVES(seq([[k,0],[k,-.1]],k=-3..3)),
  seq(TEXT([k,-.3],npi(k),FONT(SYMBOL,8)),k=-3..3),
  op(plot(tan(Pi*t),t=-3..3,y=-2..2,discont=true)),
  TEXT([.9,1.8],"tan(x)"),
  VIEW(-3..3,-2..2),
  SCALING(CONSTRAINED),
  AXESTICKS(0,0)),
  [7,7]):


makepic(
 "cotgraph",
 PLOT(
  CURVES(seq([[k,0],[k,-.1]],k=-3..3)),
  seq(TEXT([k,-.3],npi(k),FONT(SYMBOL,8)),k=-3..3),
  op(plot(cot(Pi*t),t=-3..3,y=-2..2,discont=true)),
  TEXT([0.7,1.8],"cot(x)"),
  VIEW(-3..3,-2..2),
  SCALING(CONSTRAINED),
  AXESTICKS(0,0)),
  [7,7]):



makepic(
 "sinarc",
 PLOT(
  op(plot(sin(Pi*t/2),t=-1..1)),
  CURVES([[-1,0],[-1,-.05]],[[1,0],[1,-.05]]),
  TEXT([-1,-.1],"- p",FONT(SYMBOL)),
  TEXT([+1,-.1],"p",FONT(SYMBOL)),
  CURVES([[-.05,1],[0,1]],[[-.05,-1],[0,-1]]),
  TEXT([-.1,1],"1"),
  TEXT([-.1,-1],"-1"),
  TEXT([0.5,0.9],"sin(x)"),
  VIEW(-1.2..1.2,-1.2..1.2),
  SCALING(CONSTRAINED),
  AXESTICKS(0,0))
):

makepic(
 "arcsin",
 PLOT(
  op(plot(arcsin(t)*2/Pi,t=-1..1)),
  CURVES([[-1,0],[-1,-.05]],[[1,0],[1,-.05]]),
  TEXT([+1,-.1],"1"),
  TEXT([-1,-.1],"-1"),
  CURVES([[-.05,1],[0,1]],[[-.05,-1],[0,-1]]),
  TEXT([-.20,-1],"- p",FONT(SYMBOL)),
  TEXT([-.12,+1],"p",FONT(SYMBOL)),
  TEXT([0.5,0.9],"arcsin(x)"),
  VIEW(-1.2..1.2,-1.2..1.2),
  SCALING(CONSTRAINED),
  AXESTICKS(0,0))
):


makepic(
 "cosarc",
 PLOT(
  op(plot(cos(Pi*t/2),t=0..2)),
  CURVES([[2,0],[2,-.05]]),
  TEXT([+2,-.1],"p",FONT(SYMBOL)),
  CURVES([[-.05,1],[0,1]],[[-.05,-1],[0,-1]]),
  TEXT([-.1,1],"1"),
  TEXT([-.1,-1],"-1"),
  TEXT([0.5,0.9],"cos(x)"),
  VIEW(-0.2..2.2,-1.2..1.2),
  SCALING(CONSTRAINED),
  AXESTICKS(0,0))
):

makepic(
 "arccos",
 PLOT(
  op(plot(arccos(t)*2/Pi,t=-1..1)),
  CURVES([[1,0],[1,-.05]],[[-1,0],[-1,-.05]]),
  TEXT([+1,-.1],"1"),
  TEXT([-1,-.1],"-1"),
  CURVES([[-.05,2],[0,2]]),
  TEXT([-.12,+2],"p",FONT(SYMBOL)),
  TEXT([0.5,0.9],"arccos(x)"),
  VIEW(-1.2..1.2,-0.2..2.2),
  SCALING(CONSTRAINED),
  AXESTICKS(0,0))
):

makepic(
 "tanarc",
 PLOT(
  op(plot(tan(x),x=-Pi/2..Pi/2,y=-4..4,xtickmarks=0,scaling=constrained)),
  CURVES([[-nPi/2,-.2],[-nPi/2,.2]],[[nPi/2,-.2],[nPi/2,.2]]),
  TEXT([-nPi/2,-.6],"- p/2",FONT(SYMBOL)),
  TEXT([nPi/2,-.6],"p/2",FONT(SYMBOL)),
  TEXT([.6,3.8],"tan(x)")
 ),
 [4,8]
):

makepic(
 "arctan",
 PLOT(
  op(plot(arctan(y),y=-4..4,x=-Pi/2..Pi/2,ytickmarks=0,scaling=constrained)),
  CURVES([[-.2,-nPi/2],[.2,-nPi/2]],[[-.2,nPi/2],[.2,nPi/2]]),
  TEXT([-.6,-nPi/2],"- p/2",FONT(SYMBOL)),
  TEXT([-.6,nPi/2],"p/2",FONT(SYMBOL)),
  TEXT([1.5,1.4],"arctan(y)")
 ),
 [8,4]
):

d := 2:
rr := evalf(sqrt(3)):

makepic(
 "trigval",
 PLOT(
  CURVES([[0,0],[1,0],[0,1],[0,0]]),
  CURVES([[.1,0],[.1,.1],[0,.1]],COLOR(RGB,1,0,0)),
  op(plot([1 - .1*cos(t),.1*sin(t),t=0..Pi/4])),
  op(plot([.1*sin(t),1-.1*cos(t),t=0..Pi/4])),
  CURVES([[d-1/rr,0],[d+1/rr,0],[d,1],[d-1/rr,0]],
         [[d,0],[d,1]]),
  CURVES([[d-.1,0],[d-.1,.1],[d+.1,.1],[d+.1,0]],
         COLOR(RGB,1,0,0)),
  op(plot([d-1/rr+.1*cos(t),.1*sin(t),t=0..Pi/3])),
  op(plot([d+1/rr-.1*cos(t),.1*sin(t),t=0..Pi/3])),
  op(plot([d+.1*sin(t),1-.1*cos(t),t=-Pi/6..Pi/6])),
  TEXT([.16,.10],"p/2",FONT(SYMBOL,8)),
  TEXT([.81,.06],"p/4",FONT(SYMBOL,8)),
  TEXT([.06,.85],"p/4",FONT(SYMBOL,8)),
  TEXT([d-.16,.10],"p/2",FONT(SYMBOL,8)),
  TEXT([d+.16,.10],"p/2",FONT(SYMBOL,8)),
  TEXT([d-.42,.07],"p/3",FONT(SYMBOL,8)),
  TEXT([d+.42,.07],"p/3",FONT(SYMBOL,8)),
  TEXT([d-.05,.82],"p/6",FONT(SYMBOL,8)),
  TEXT([d+.05,.82],"p/6",FONT(SYMBOL,8)),
  TEXT([d-.5/rr-.1,.5],"d"),
  TEXT([d+.5/rr+.1,.5],"d"),
  TEXT([d-.5/rr,-.06],"d/2"),
  TEXT([d+.5/rr,-.06],"d/2"),
  TEXT([.5,-.06],"1"),
  TEXT([-.06,.5],"1"),
  TEXT([.55,.55],"c"),
  TEXT([d+.06,.4],"1"),
  AXESSTYLE(NONE), 
  SCALING(CONSTRAINED)
 ),
 [16,8]
):

makepic(
 "sineq",
 PLOT(
  op(plot(sin(Pi*t),t=-5..5,tickmarks=[0,0])),
  CURVES([[-5,.5],[5,.5]],
         seq([[(-1)^n*1/6+n,.5],[(-1)^n*1/6+n,-.1]],n=-5..5),
         COLOR(RGB,0,0,1)),
  TEXT([-23/6,-.3],"- 4p+q",FONT(SYMBOL,7)),
  TEXT([-19/6,-.3],"- 3p-q",FONT(SYMBOL,7)),
  TEXT([-11/6,-.3],"- 2p+q",FONT(SYMBOL,7)),
  TEXT([-7/6,-.3],"- p-q",  FONT(SYMBOL,7)),
  TEXT([1/6,-.3],"q",       FONT(SYMBOL,7)),
  TEXT([5/6,-.3],"p-q",     FONT(SYMBOL,7)),
  TEXT([13/6,-.3],"2p+q",   FONT(SYMBOL,7)),
  TEXT([17/6,-.3],"3p-q",   FONT(SYMBOL,7)),
  TEXT([25/6,-.3],"4p+q",   FONT(SYMBOL,7)),
  TEXT([29/6,-.3],"5p-q",   FONT(SYMBOL,7)),
  SCALING(CONSTRAINED)
 ),
 [16,6]
):

makepic(
 "trigeq",
 PLOT(
  op(plot((sin(2*t*Pi)-cos(3*t*Pi))/2,t=-3..3,scaling=constrained,tickmarks=[0,0])),
  CURVES(seq([[(4*n-1)/2,0],[(4*n-1)/2,-.5]],n=-4..4),COLOR(RGB,0,0,1),THICKNESS(4)),
  CURVES(seq([[(4*n+1)/10,0],[(4*n+1)/10,.5]],n=-10..10),COLOR(RGB,0,1,0),THICKNESS(4))
 ),
 [16,6]
):

makepic(
 "humps",
 PLOT(
  op(plot(sin(t*Pi),t=-3..3,scaling=constrained,tickmarks=[0,0])),
  CURVES(seq([[n+3/8,0],[n+3/8,(-1)^n*.92]],n=-4..4),
         THICKNESS(4),COLOR(RGB,0,0,1)),
  CURVES(seq([[n+5/8,0],[n+5/8,(-1)^n*.92]],n=-4..4),
         THICKNESS(4),COLOR(RGB,0,1,0)),
  CURVES(seq([[n+3/8,(-1)^n*.92],[n+5/8,(-1)^n*.92]],n=-4..4),
         THICKNESS(4),COLOR(RGB,1,0,1))
 ),
 [16,6]
):

xx  := -(4+sin(3*t/2))*cos(t):
yy  := (4+sin(3*t/2))*sin(t):
x0  := evalf(subs(t=7,xx)):
y0  := evalf(subs(t=7,yy)):
dx0 := evalf(subs(t=7,diff(xx,t))):
dy0 := evalf(subs(t=7,diff(yy,t))):

makepic(
 "tangent",
 PLOT(
  op(plot([xx,yy,t=0..4*Pi])),
  POINTS([x0,y0]),
  CURVES([[x0 - 2*dx0,y0 - 2*dy0],[x0 + 2*dx0,y0 + 2*dy0]],
         COLOR(RGB,0,0,1)),
  CURVES([[x0,y0],[x0+.6*dx0,y0],[x0+.6*dx0,y0+.6*dy0]],
         COLOR(RGB,1,0,1)),
  AXESSTYLE(NONE),
  SCALING(CONSTRAINED)
 )
):

plotsetup(default):

