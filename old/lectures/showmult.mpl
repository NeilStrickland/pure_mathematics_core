latex(0):

ltx := proc()
 convert(cat(`latex/print`(args)),string);
end;

frame := 2:
fd := fopen("mult.tex",WRITE):

showmult := 
 proc(A::{matrix,list(list)},B::{matrix,list(list)})
  local A0,B0,C0,C,n,m,p,i,j,k,l,ii,jj,kk;
  global frame,fd;
  C := evalm(A &* B);
  A0 := convert(A,listlist);
  B0 := convert(B,listlist);
  C0 := convert(C,listlist);
  n := nops(A0);
  m := nops(A0[1]);
  l := nops(B0[1]);
  fprintf(fd,"\\onlySlide*{%d}{\\tiny \\[ \\bbm\n",frame);
  frame := frame + 1;
  for ii to n do 
   for jj to m do
    fprintf(fd,"%s",ltx(A0[ii,jj]));
    if jj < m then fprintf(fd," & "); fi;
   od;
   if ii < n then fprintf(fd,"\\\\\n"); else fprintf(fd,"\n"); fi;
  od;
  fprintf(fd,"\\ebm\n\\bbm\n");
  for ii to m do 
   for jj to l do
    fprintf(fd,"%s",ltx(B0[ii,jj]));
    if jj < l then fprintf(fd," & "); fi;
   od;
   if ii < m then fprintf(fd,"\\\\\n"); else fprintf(fd,"\n"); fi;
  od;
  fprintf(fd,"\\ebm = \n\\bbm\n");
  for ii to n do 
   for jj to l do
    fprintf(fd,"\\WHITE{%s}",ltx(C0[ii,jj]));
    if jj < l then fprintf(fd," & "); fi;
   od;
   if ii < m then fprintf(fd,"\\\\\n"); else fprintf(fd,"\n"); fi;
  od;
  fprintf(fd,"\\ebm\n");
  fprintf(fd,"\\]}\n%%\n");
  for i to n do
   for j to l do
    k := l * (i-1) + (j-1) + 3;
    fprintf(fd,"\\onlySlide*{%d}{\\tiny \\[ \\bbm\n",frame);
    frame := frame + 1;
    for ii to n do 
     for jj to m do
      if ii = i then
       fprintf(fd,"\\RED{%s}",ltx(A0[ii,jj]));
      else
       fprintf(fd,"%s",ltx(A0[ii,jj]));
      fi;
      if jj < m then fprintf(fd," & "); fi;
     od;
     if ii < n then fprintf(fd,"\\\\\n"); else fprintf(fd,"\n"); fi;
    od;
    fprintf(fd,"\\ebm\n\\bbm\n");
    for ii to m do 
     for jj to l do
      if jj = j then
       fprintf(fd,"\\OLG{%s}",ltx(B0[ii,jj]));
      else
       fprintf(fd,"%s",ltx(B0[ii,jj]));
      fi;
      if jj < l then fprintf(fd," & "); fi;
     od;
     if ii < m then fprintf(fd,"\\\\\n"); else fprintf(fd,"\n"); fi;
    od;
    fprintf(fd,"\\ebm = \n\\bbm\n");
    for ii to n do 
     for jj to l do
      if ii < i or (ii = i and jj <= j) then
       fprintf(fd,"%s",ltx(C0[ii,jj]));
      else
       fprintf(fd,"\\WHITE{%s}",ltx(C0[ii,jj]));
      fi;
      if jj < l then fprintf(fd," & "); fi;
     od;
     if ii < m then fprintf(fd,"\\\\\n"); else fprintf(fd,"\n"); fi;
    od;
    fprintf(fd,"\\ebm\n");
    fprintf(fd,"\\]}\n%%\n");
   od;
  od;
  fprintf(fd,"\\fromSlide*{%d}{\\tiny \\[ \\bbm\n",frame);
  for ii to n do 
   for jj to m do
    fprintf(fd,"%s",ltx(A0[ii,jj]));
    if jj < m then fprintf(fd," & "); fi;
   od;
   if ii < n then fprintf(fd,"\\\\\n"); else fprintf(fd,"\n"); fi;
  od;
  fprintf(fd,"\\ebm\n\\bbm\n");
  for ii to m do 
   for jj to l do
    fprintf(fd,"%s",ltx(B0[ii,jj]));
    if jj < l then fprintf(fd," & "); fi;
   od;
   if ii < m then fprintf(fd,"\\\\\n"); else fprintf(fd,"\n"); fi;
  od;
  fprintf(fd,"\\ebm = \n\\bbm\n");
  for ii to n do 
   for jj to l do
    fprintf(fd,"%s",ltx(C0[ii,jj]));
    if jj < l then fprintf(fd," & "); fi;
   od;
   if ii < m then fprintf(fd,"\\\\\n"); else fprintf(fd,"\n"); fi;
  od;
  fprintf(fd,"\\ebm\n");
  fprintf(fd,"\\]}\n%%\n");
 end:

showmult(
 [[1,2,3,4],[4,3,2,1]],
 [[1,2],[1,2],[1,2],[1,2]]
);

showmult(
 [[1,a,0],[0,1,a],[0,0,1]],
 [[1,0,0],[b,1,0],[0,b,1]]
);

showmult(
 [[0,1,0],[0,0,1],[1,0,0]],
 [[1,1,1],[a,b,c],[a^2,b^2,c^2]]
);

showmult(
 [[1,a,a^2/2],[0,1,a],[0,0,1]],
 [[1,b,b^2/2],[0,1,b],[0,0,1]]
);

fclose(fd):

