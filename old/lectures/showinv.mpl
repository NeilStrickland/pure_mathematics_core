writeto("inv.tex"):

A := matrix([[0,0,3],[0,3,3],[3,3,3]]):
B := matrix([[0$3]$3]):
C := matrix([[0$3]$3]):
for i to 3 do
 for j to 3 do
  B[i,j] := det(minor(A,i,j));
  C[i,j] := (-1)^(i+j) * B[i,j];
 od;
od;

printf("\\parbox[t][2cm][c]{2cm}{\n"):
printf(" \\onlySlide*{2}{\n$%s$\n }\n", ltx(eval(A))):
for i to 3 do
 for j to 3 do
  printf("\\onlySlide*{%d}{\n$%s$}\n",3*i+j-1,showminor(A,i,j)):
 od:
od:
printf(" \\untilSlide*{16}{\\fromSlide*{12}{\n$%s$\n }}\n", ltx(eval(A))):
printf("\\onlySlide*{17}{$\\bbm \n");
for i to 3 do
 for j to 3 do
  if i = 1 then
   printf("\\OLG{%s}",ltx(A[i,j]));
  else
   printf(ltx(A[i,j]));
  fi;
  if j < 3 then printf(" & "): fi;
 od;
 if i < 3 then printf("\\\\\n"): fi;
od;
printf("\\ebm$}\n"):
printf("\\fromSlide*{18}{\n$%s$\n }\n", ltx(eval(A))):
printf("\n}\n"):
printf(" \\parbox[t][2cm][c]{0.5cm}{\\fromSlide{3}{$\\xra{}$}}\n"):

printf("\\parbox[t][2cm][c]{2cm}{\n"):
for i to 3 do
 for j to 3 do
  printf("\\onlySlide*{%d}{\n $\\bbm\n",3*i+j-1);
  for ii to 3 do
   for jj to 3 do
    if 3*ii+jj < 3*i+j then
     c := "BLACK":
    elif 3*ii+jj=3*i+j then
     c := "BLUE":
    else
     c := "WHITE":
    fi;
    printf("\\ss{\\%s{%d}}",c,B[ii,jj]):
    if jj < 3 then printf(" & "): fi;
   od;
   if ii < 3 then printf(" \\\\\n"): fi;
  od;
  printf("\\ebm $}\n"):
 od;
od;
printf(" \\fromSlide*{12}{\n$%s$\n }\n", ltx(eval(B))):
printf("\n}\n"):

printf(" \\parbox[t][2cm][c]{0.5cm}{\\fromSlide{13}{$\\xra{}$}}\n"):

printf(" \\parbox[t][2cm][c]{2.8cm}{\n"):
printf("\\onlySlide*{13}{$\\bbm\n"):
for i to 3 do
 for j to 3 do
  if (-1)^(i+j) = 1 then
   printf("\\ss{\\BLUE{\\mathbf{\\oplus}}%s}",ltx(B[i,j]));
  else
   printf("\\ss{\\MAGENTA{\\mathbf{\\ominus}}%s}",ltx(B[i,j]));
  fi;
  if j < 3 then printf(" & "): fi;
 od;
 if i < 3 then printf("\\\\\n"): fi;
od;
printf("\\ebm$}\n"):
printf(" \\onlySlide*{14}{\n$%s$\n }\n", ltx(eval(C))):
printf("\\onlySlide*{15}{$\\bbm\n"):
for i to 3 do
 for j to 3 do
  c := ["RED","OLG","BLUE"][i]:
  printf("\\%s{%s}",c,ltx(C[i,j]));
  if j < 3 then printf(" & "): fi;
 od;
 if i < 3 then printf("\\\\\n"): fi;
od;
printf("\\ebm$}\n"):
printf("\\onlySlide*{16}{$\\bbm\n"):
for i to 3 do
 for j to 3 do
  c := ["RED","OLG","BLUE"][i]:
  printf("\\%s{%s}",c,ltx(C[i,j]));
  if j < 3 then printf(" & "): fi;
 od;
 if i < 3 then printf("\\\\\n"): fi;
od;
printf("\\ebm$}\n"):
printf(" \\fromSlide*{17}{\n$%s$\n }\n", ltx(eval(C))):
printf("\n}\n"):
printf(" \\parbox[t][2cm][c]{0.5cm}{\\fromSlide{16}{$\\xra{}$}}\n"):

printf(" \\parbox[t][2cm][c]{2.0cm}{\n"):
printf("\\onlySlide*{16}{$\\bbm\n"):
for i to 3 do
 for j to 3 do
  c := ["RED","OLG","BLUE"][j]:
  printf("\\%s{%s}",c,ltx(C[j,i]));
  if j < 3 then printf(" & "): fi;
 od;
 if i < 3 then printf("\\\\\n"): fi;
od;
printf("\\ebm$}\n"):
printf("\\onlySlide*{17}{$\\bbm \n");
for i to 3 do
 for j to 3 do
  if i = 1 then
   printf("\\RED{%s}",ltx(C[j,i]));
  else
   printf(ltx(C[j,i]));
  fi;
  if j < 3 then printf(" & "): fi;
 od;
 if i < 3 then printf("\\\\\n"): fi;
od;
printf("\\ebm$}\n"):
printf("\\fromSlide*{18}{$\\bbm\n"):
for i to 3 do
 for j to 3 do
  printf(ltx(C[j,i]));
  if j < 3 then printf(" & "): fi;
 od;
 if i < 3 then printf("\\\\\n"): fi;
od;
printf("\\ebm$}\n"):
printf("\n}\n"):
printf("\\hfill \\\\\n"):

printf(" \\parbox[t][2cm][t]{10.0cm}{\n"):
for i to 3 do
 for j to 3 do
  printf("\\onlySlide*{%d}{\n$\\ss{\\det%s=\\BLUE{%d}}$\n}\n",
         3*i+j-1,ltx(minor(A,i,j),"OLG"),B[i,j]);
 od;
od;
printf("\\fromSlide*{17}{\n\\[\\scriptstyle \\det(A)=(\\OLG{%d},\\OLG{%d},\\OLG{%d}).(\\RED{%d},\\RED{%d},\\RED{%d})=%d\\]\n}",
 A[1,1],A[1,2],A[1,3],C[1,1],C[1,2],C[1,3],det(A)):
printf("\\fromSlide*{18}{\n\\vspace{-2ex}\\[\\scriptstyle A^{-1}=\\frac{1}{%d}%s=%s\\]}\n",
 det(A),ltx(eval(transpose(C))),ltx(inverse(A))):
printf("\n}\n"):

writeto(default):
