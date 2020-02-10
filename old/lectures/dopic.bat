latex trypic
dvips trypic.dvi -o trypic.ps
call ps2pdf trypic.ps trypic.pdf
del trypic.log
del trypic.dvi
del trypic.out
del trypic.ps
trypic.pdf
