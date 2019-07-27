PROGRAM current;

VAR
	testVar : INTEGER;

FUNCTION CircleArea(r : REAL): REAL;
BEGIN
    r := 2;
END;

PROCEDURE TestProc(r : INTEGER);
	VAR
		ProcVar : CHAR;
BEGIN
    ProcVar -= 33.23;
END;

BEGIN
	someid := 1 + 1;
	// This is a comment as well and should be ignored
END.
