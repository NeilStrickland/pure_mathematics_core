latex try
dvips try.dvi -o try.ps
call ps2pdf try.ps try.pdf
del try.log
del try.dvi
del try.out
del try.ps
try.pdf
