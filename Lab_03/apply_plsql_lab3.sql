/*
   Name:   apply_plsql_lab3.sql
   Author: Benjamin Vredenburg
   Date:   27-SEP-2022  
*/

-- Call seeding libraries.
--@$LIB/cleanup_oracle.sql
--@$LIB/Oracle12cPLSQLCode/Introduction/create_video_store.sql

-- Open log file.
-- SPOOL apply_plsql_lab3.txt

-- Enter your solution here.
SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
	/* Declare a collection of strings */
	TYPE list IS TABLE OF VARCHAR2(100);

	lv_input LIST;
	
	TYPE three_type IS RECORD
	(
		xnum NUMBER,  
		xdate DATE,  
		xstring VARCHAR2(30) 
	);
	
	lv_three_type THREE_TYPE;
	
        lv_input1 VARCHAR2(100);
        lv_input2 VARCHAR2(100);
        lv_input3 VARCHAR2(100);

BEGIN

	lv_input1 := '&1';
	lv_input2 := '&2';
	lv_input3 := '&3';
	
--	Put the three values into LIST
	lv_input := list(lv_input1, lv_input2, lv_input3);

	FOR i IN 1..lv_input.COUNT LOOP
    		IF REGEXP_LIKE(lv_input(i),'^[[:digit:]]*$') THEN
			lv_three_type.xnum := lv_input(i);
		ELSIF verify_date(lv_input(i)) IS NOT NULL THEN
			lv_three_type.xdate := (lv_input(i));
		ELSIF lv_input(i) IS NULL THEN
			continue;
		ELSE lv_three_type.xstring := (lv_input(i));
		END IF;
  	END LOOP;	
	dbms_output.put_line ('[' || lv_three_type.xnum || '][' || lv_three_type.xstring || '][' || lv_three_type.xdate || ']');

END;
/

-- Close log file.
-- SPOOL OFF

QUIT
