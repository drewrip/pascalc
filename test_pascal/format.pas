PROGRAM format;
VAR
   x : REAL;
   i : INTEGER;
   j : INTEGER;
BEGIN
    x := 12.449;
    i := 10;
    j := -300;
    WRITE('This is some text');   
    WRITELN('Unformatted integer ',i);
    WRITELN('Unformatted integer computation ',i*i);
    WRITELN('formatted integer',i:4);
    WRITELN('formatted integer',j:4);
    WRITELN('Unformatted real ',x);
    WRITE('Formatted real');
    WRITE(x:8:2);
    WRITELN('all in one line');
END.