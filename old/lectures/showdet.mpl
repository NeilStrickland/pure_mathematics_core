with(linalg):
latex(0):

ltx := proc(x,c_)
 local i,j,m,n,s,c0,c1;
 if type(x,matrix) then
  m := rowdim(x);
  n := coldim(x);
  s := "";
  if nargs > 1 then
   c0 := cat("\\",c_,"{");
   c1 := "}";
  else
   c0 := "";
   c1 := "";
  fi;
  for i to m do 
   for j to n do
    s := s,sprintf("%s%s%s",c0,ltx(x[i,j]),c1);
    if j < n then 
     s := s," & ";
    fi;
   od;
   if i < m then 
    s := s,"\\\\\n";
   else
    s := s,"\n";
   fi;
  od;
  return(cat("{\\ss{\\bbm",s,"\\ebm}}"));
 else
  return(cat("\\ss{",convert(cat(`latex/print`(args)),string),"}"));
 fi;
end;

showminor :=
 proc(x::matrix,u,v)
  local i,j,n,m,s,c;
  n := rowdim(x);
  m := coldim(x);
  s := "\\bbm\n";
  for i to n do
   for j to m do
    c := `if`(i=u,`if`(j=v,"RED","YLW"),`if`(j=v,"YLW","OLG"));
    s := s,sprintf("\\%s{%s}",c,ltx(x[i,j]));
    if j < m then s := s," & "; fi;
   od;
   if i < n then s := s,"\\\\\n"; fi;
  od; 
  s := s,"\n\\ebm\n";
  return(cat(s));
 end:

frame := 2:
fd := fopen("det.tex",WRITE):

showdet := 
 proc(A::{matrix,list(list)},num_,row_or_col_::{identical(ROW),identical(COL)})
  local A0,A1,B0,B,M,m,n,j,k,ii,jj,num,row_or_col,a,c,x,y,s;
  global frame,fd;
  num := `if`(nargs>1,num_,1);
  row_or_col := `if`(nargs>2,row_or_col_,ROW);
  A0 := convert(A,listlist);
  n := nops(A0);
  A1 := matrix(A0);
  fprintf(fd,"{\\tiny \\[\n");
  fprintf(fd,"\\onlySlide*{%d}{ \\det%s\\WHITE{=}\n",
   frame,ltx(eval(A1)));
  frame := frame + 1;
  M := table();
  m := table();
  for j to n do
   if row_or_col = ROW then
    M[j] := minor(A1,num,j);
    m[j] := A1[num,j];
    s[j] := `if`(type(num+j,even),"+","-");
    x[j] := j;
    y[j] := num;
   else
    M[j] := minor(A1,j,num);
    m[j] := A1[j,num];
    s[j] := `if`(type(num+j,even),"+","-");
    x[j] := num;
    y[j] := j;
   fi;
   fprintf(fd,
    "\\WHITE{%s%s\\det%s}",
    s[j],ltx(m[j]),ltx(eval(M[j])));
  od;
  fprintf(fd,"}\n");
  for j to n do
   fprintf(fd,"\\onlySlide*{%d}{ \\det\\bbm\n",frame);
   frame := frame + 1;
   for ii to n do 
    for jj to n do
     if ii = y[j] and jj = x[j] then
      c := "RED";
     elif ii = y[j] or jj = x[j] then
      c := "YELLOW";
     else
      c := "OLG";
     fi;
     fprintf(fd,"\\%s{%s}",c,ltx(A0[ii,jj]));
     if jj < n then fprintf(fd," & "); fi;
    od;
    if ii < n then fprintf(fd,"\\\\\n"); else fprintf(fd,"\n"); fi;
   od;
   fprintf(fd,"\\ebm =\n");
   for k to n do
    if k > j then
     fprintf(fd,
      "\\WHITE{{%s}%s\\det%s}\n",
      s[k],ltx(m[k]),ltx(eval(M[k])));
    elif k = j then 
     fprintf(fd,
      "\\MAGENTA{%s}\\RED{%s}\\det%s\n",
      s[k],ltx(m[k]),ltx(eval(M[k]),"OLG"));
    elif k < j then 
     fprintf(fd,
      "\\BLACK{%s}\\BLACK{%s}\\det%s\n",
      s[k],ltx(m[k]),ltx(eval(M[k])));
    fi;
   od;
  fprintf(fd,"}\n");
  od;
  fprintf(fd,"\\fromSlide*{%d}{ \\det%s=\n",frame,ltx(eval(A1)));
  for j to n do
   fprintf(fd,
    "\\BLACK{%s}\\BLACK{%s}\\det%s\n",
    s[j],ltx(m[j]),ltx(eval(M[j])));
  od;
  fprintf(fd,"}\n");
  fprintf(fd,"\\]}\n");
 end:

#  showdet := 
#   proc(A::{matrix,list(list)},num_,row_or_col_::{identical(ROW),identical(COL)})
#    local A0,n,j,k,ii,jj,num,row_or_col;
#    global frame,fd;
#    num := `if`(nargs>1,num_,1);
#    row_or_col := `if`(nargs>2,row_or_col_,ROW);
#    A0 := convert(A,listlist);
#    n := nops(A0);
#    fprintf(fd,"{\\tiny \\[\n");
#    fprintf(fd,"\\onlySlide*{%d}{ \\det\\bbm\n",frame);
#    frame := frame + 1;
#    for ii to n do 
#     for jj to n do
#      fprintf(fd,"%s",ltx(A0[ii,jj]));
#      if jj < n then fprintf(fd," & "); fi;
#     od;
#     if ii < n then fprintf(fd,"\\\\\n"); else fprintf(fd,"\n"); fi;
#    od;
#    fprintf(fd,"\\ebm =\n");
#    for j to n do
#     fprintf(fd,
#      "\\WHITE{%s%s\\det\\bbm\n",
#      `if`(type(j,odd),"+","-"),
#      ltx(A0[1,j]));
#     for ii from 2 to n do 
#      for jj to n do
#       if jj <> j then 
#  	fprintf(fd,"%s",ltx(A0[ii,jj]));
#  	if (j < n and jj < n) or (j = n and jj < n-1) then
#  	 fprintf(fd," & "); 
#  	fi;
#       fi; 
#      od;
#      if ii < n then 
#       fprintf(fd,"\\\\\n");
#      else
#       fprintf(fd,"\n");
#      fi;
#     od;
#     fprintf(fd,"\\ebm}\n");
#    od;
#    fprintf(fd,"}\n");
#    for j to n do
#     fprintf(fd,"\\onlySlide*{%d}{ \\det\\bbm\n",frame);
#     frame := frame + 1;
#     for jj to n do
#      if jj = j then 
#       fprintf(fd,"\\RED{%s}",ltx(A0[1,jj]));
#      else
#       fprintf(fd,"\\YELLOW{%s}",ltx(A0[1,jj]));
#      fi;
#      if jj < n then fprintf(fd," & "); fi;
#     od;
#     fprintf(fd," \\\\\n");
#     for ii from 2 to n do 
#      for jj to n do
#       if jj = j then
#        fprintf(fd,"\\YELLOW{%s}",ltx(A0[ii,jj]));
#       else
#        fprintf(fd,"\\OLG{%s}",ltx(A0[ii,jj]));
#       fi;
#       if jj < n then fprintf(fd," & "); fi;
#      od;
#      if ii < n then fprintf(fd,"\\\\\n"); else fprintf(fd,"\n"); fi;
#     od;
#     fprintf(fd,"\\ebm =\n");
#     for k to n do
#      if k > j then
#       fprintf(fd,
#        "\\WHITE{{%s}%s\\det\\bbm\n",
#        `if`(type(k,odd),"+","-"),
#        ltx(A0[1,k]));
#       for ii from 2 to n do 
#        for jj to n do
#         if jj <> j then 
#  	fprintf(fd,"%s",ltx(A0[ii,jj]));
#  	if (j < n and jj < n) or (j = n and jj < n-1) then
#  	 fprintf(fd," & "); 
#  	fi;
#         fi; 
#        od;
#        if ii < n then 
#         fprintf(fd,"\\\\\n");
#        else
#         fprintf(fd,"\n");
#        fi;
#       od;
#       fprintf(fd,"\\ebm}\n");
#      elif k = j then 
#       fprintf(fd,
#        "\\MAGENTA{%s}\\RED%s\\det\\bbm\n",
#        `if`(type(j,odd),"+","-"),
#        ltx(A0[1,j]));
#       for ii from 2 to n do 
#        for jj to n do
#         if jj <> j then 
#  	fprintf(fd,"\\OLG%s",ltx(A0[ii,jj]));
#  	if (j < n and jj < n) or (j = n and jj < n-1) then
#  	 fprintf(fd," & "); 
#  	fi;
#         fi; 
#        od;
#        if ii < n then 
#         fprintf(fd,"\\\\\n");
#        else
#         fprintf(fd,"\n");
#        fi;
#       od;
#       fprintf(fd,"\\ebm\n");
#      elif k < j then 
#       fprintf(fd,
#        "\\BLACK{%s}\\BLACK%s\\det\\bbm\n",
#        `if`(type(k,odd),"+","-"),
#        ltx(A0[1,k]));
#       for ii from 2 to n do 
#        for jj to n do
#         if jj <> j then 
#  	fprintf(fd,"\\BLACK%s",ltx(A0[ii,jj]));
#  	if (j < n and jj < n) or (j = n and jj < n-1) then
#  	 fprintf(fd," & "); 
#  	fi;
#         fi; 
#        od;
#        if ii < n then 
#         fprintf(fd,"\\\\\n");
#        else
#         fprintf(fd,"\n");
#        fi;
#       od;
#       fprintf(fd,"\\ebm\n");
#      fi;
#     od;
#    fprintf(fd,"}\n");
#    od;
#    fprintf(fd,"\\fromSlide*{%d}{ \\det\\bbm\n",frame);
#    for ii to n do 
#     for jj to n do
#      fprintf(fd,"\\BLACK%s",ltx(A0[ii,jj]));
#      if jj < n then fprintf(fd," & "); fi;
#     od;
#     if ii < n then fprintf(fd,"\\\\\n"); else fprintf(fd,"\n"); fi;
#    od;
#    fprintf(fd,"\\ebm =\n");
#    for j to n do
#     fprintf(fd,
#      "\\BLACK{%s}\\BLACK%s\\det\\bbm\n",
#      `if`(type(j,odd),"+","-"),
#      ltx(A0[1,j]));
#     for ii from 2 to n do 
#      for jj to n do
#       if jj <> j then 
#  	fprintf(fd,"\\BLACK%s",ltx(A0[ii,jj]));
#  	if (j < n and jj < n) or (j = n and jj < n-1) then
#  	 fprintf(fd," & "); 
#  	fi;
#       fi; 
#      od;
#      if ii < n then 
#       fprintf(fd,"\\\\\n");
#      else
#       fprintf(fd,"\n");
#      fi;
#     od;
#     fprintf(fd,"\\ebm\n");
#    od;
#    fprintf(fd,"}\n");
#    fprintf(fd,"\\]}\n");
#   end:

#showdet(
# [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
#):

#frame := 8:
#stopat(showdet);

frame := 11:
showdet(
 [[1,a,b],[b,1,1],[a,1,1]]
):

#read("showinv.mpl"):

fclose(fd):





