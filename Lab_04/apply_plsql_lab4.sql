/*
   Name:   apply_plsql_lab4.sql
   Author: Benjamin Vredenburg
   Date:   27-SEP-2022  
*/

-- Call seeding libraries.
--@$LIB/cleanup_oracle.sql
--@$LIB/Oracle12cPLSQLCode/Introduction/create_video_store.sql

-- Open log file.
SPOOL apply_plsql_lab4.txt

-- Enter your solution here.
SET SERVEROUTPUT ON
SET VERIFY OFF

CREATE OR REPLACE
	TYPE lyric IS OBJECT
	( day_name VARCHAR2(8)
	, gift_name VARCHAR2(24));
/
CREATE OR REPLACE
	TYPE day IS OBJECT
	( day_name VARCHAR(8));
/

DECLARE

    TYPE gifts IS TABLE OF lyric;
    TYPE days IS TABLE OF day; 

    lv_days DAYS := days( day('First')
			, day('Second')
			, day('Third')
			, day('Fourth')
			, day('Fifth')
			, day('Sixth')
			, day('Seventh')
			, day('Eighth')
			, day('Ninth')
			, day('Tenth')
			, day('Eleventh')
			, day('Twelfth'));

    lv_gifts GIFTS := gifts( lyric('and a', 'Partridge in a pear tree')
			, lyric('Two', 'Turtle doves')
			, lyric('Three', 'French hens')
			, lyric('Four', 'Calling birds')
			, lyric('Five', 'Golden rings')
			, lyric('Six', 'Geese a laying')
			, lyric('Seven', 'Swans a swimming')
			, lyric('Eight', 'Maids a milking')
			, lyric('Nine', 'Ladies dancing')
			, lyric('Ten', 'Lords a leaping')
			, lyric('Eleven', 'Pipers piping')
			, lyric('Twelve', 'Drummers drumming'));

BEGIN
    FOR i IN 1..lv_days.COUNT LOOP
	dbms_output.put_line('On the '||lv_days(i).day_name||' day of Christmas');
	dbms_output.put_line('my true love gave to me: ');
	FOR x IN REVERSE 1..i LOOP
		IF i=1 THEN
			dbms_output.put_line('-A '||lv_gifts(x).gift_name||'');
		ELSE 
			dbms_output.put_line('-'||lv_gifts(x).day_name||' '||lv_gifts(x).gift_name||'');
		END IF;
	END LOOP;
	dbms_output.put_line(CHR(5));
    END LOOP;
END;
/

-- Close log file.
SPOOL OFF

QUIT

