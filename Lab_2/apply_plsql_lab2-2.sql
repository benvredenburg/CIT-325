/*
   Name:   apply_plsql_lab2-2.sql
   Author: Benjamin Vredenburg
   Date: 23-SEP-2022  
*/

-- Create two variables called:
-- lv_raw_input that contains the input value regardless of length 
-- lv_input that contains the first ten characters of the input value



SET SERVEROUTPUT ON SIZE UNLIMITED
SET VERIFY OFF

DECLARE
        lv_raw VARCHAR2(255) :='&1';
	lv_input VARCHAR2(10) :=SUBSTR(lv_raw, 1, 10);
BEGIN
        IF LENGTH(lv_raw) <= 10  THEN
                dbms_output.put_line('Hello '||lv_raw||'!');
        ELSIF LENGTH(lv_raw)  > 10 THEN
                dbms_output.put_line('Hello '||lv_input||'!');
        ELSE
                dbms_output.put_line('Hello World!');
        END IF;
END;
/

QUIT;

