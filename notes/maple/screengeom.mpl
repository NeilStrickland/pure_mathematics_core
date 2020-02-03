f := proc(s) 
printf("
\\def\\screengeometry{
\\paperheight%1.2fin
\\paperwidth%1.2fin
\\oddsidemargin%1.2fin
\\evensidemargin%1.2fin
\\topmargin%1.2fin
\\textwidth%1.2fin
\\textheight%1.2fin
\\headheight%1.2fin
\\headsep%1.2fin
}
",
5.4*s,7.2*s,.08*s-1,.08*s-1,.08*s-1,6.96*s,4.92*s,.12*s,.12*s);
end;
