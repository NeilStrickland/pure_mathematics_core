cd := currentdir():
currentdir("C:/Tomcat/webapps/AiM/WEB-INF/maple"):
read("Console.mpl"):
currentdir(cd):

f := (t) -> (t-0.8)^2 + 1:
xmin := 0:
xmax := 1.7:
ymin := 0:
x0 := 1:

pictex := 
 "\\begin{center}\\begin{pspicture}[1](-0.2,-0.2)(@xmax@,@ymax@)
    \\psset{linewidth=0.1pt}
    \\psaxes[labels=none,ticksize=1pt]{->}(0,0)(-0.1,0)(@xmax@,@ymax@)
    \\psplot[linecolor=red]{0}{@xmax@}{x -0.8 add dup mul 1 add}
    \\psline[linecolor=OliveGreen](0,@bchord@)(@xmax@,@cchord@)
    \\psline[linecolor=Orange](0,@btangent@)(@xmax@,@ctangent@)
    \\psline[linecolor=blue](@x0@,0)(@x0@,@y0@)(0,@y0@)
    \\psline[linecolor=blue](@x1@,0)(@x1@,@y1@)(0,@y1@)
    \\rput[tr](@x0@,-0.05){${\\scriptstyle x}$}
    \\rput[tl](@x1@,-0.05){${\\scriptstyle x+\\dl x}$}
    \\rput[r](@xmin-0.05@,@y0@){${\\scriptstyle y}$}
    \\rput[r](@xmin-0.05@,@y1@){${\\scriptstyle y+\\dl y}$}
    \\psline[linecolor=OliveGreen,arrows=<->](@x0@,@y0@)(@x1@,@y0@)
    \\psline[linecolor=OliveGreen,arrows=<->](@x0@,@y0@)(@x0@,@y1@)
    \\rput[t](@x0+dx/2@,@y0-0.1@){${\\scriptstyle \\dl x}$} 
    \\rput[r](@x0-0.1@,@y0+dy/2@){${\\scriptstyle \\dl y}$}
    \\rput[bl](@xmax+.05@,@cchord@){slope $\\scriptstyle \\dl y/\\dl x$}
    \\rput[tl](@xmax+.05@,@ctangent@){slope $\\scriptstyle dy/dx$}
  \\end{pspicture}\\end{center}":

makepic := proc() 
 global ymax,y0,x1,y1,dy,mchord,bchord,cchord,mtangent,btangent,ctangent;
 ymax := f(xmax):
 y0 := f(x0):
 x1 := x0 + dx:
 y1 := f(x1):
 dy := y1 - y0:
 mchord := dy/dx:
 bchord := y0 - mchord * x0:
 cchord := bchord + mchord * (xmax - xmin):
 mtangent := eval(subs(x = x0,diff(f(x),x))):
 btangent := y0 - mtangent * x0:
 ctangent := btangent + mtangent * (xmax - xmin):
 printf(`aim/LaTeX/Subs`(pictex));
end:

dx := 0.5:
makepic():

dx := dx/2:
makepic():

dx := dx/2:
makepic():

