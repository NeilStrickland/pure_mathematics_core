latex %1
dvips %1.dvi -o %1.ps
call ps2pdf %1.ps %1.pdf
del %1.log
del %1.dvi
del %1.out
del %1.ps
%1.pdf
