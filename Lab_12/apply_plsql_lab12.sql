/* 
   Name:   apply_plsql_lab12.sql
   Author: Benjamin Vredenburg
   Date:   30-NOV-2022
*/

-- Call seeding libraries.
@$LIB/cleanup_oracle.sql
@$LIB/Oracle12cPLSQLCode/Introduction/create_video_store.sql

SET PAGESIZE 999

-- Create item_obj object type.
CREATE OR REPLACE TYPE item_obj IS OBJECT
( title VARCHAR2(60)
, subtitle VARCHAR2(60)
, rating VARCHAR2(8)
, release_date DATE );
/

-- Open log file.
SPOOL apply_plsql_lab12.txt

-- Describe item_obj
DESC item_obj

-- Close log file.
SPOOL OFF

-- Create item_tab object type.
CREATE OR REPLACE TYPE item_tab IS TABLE OF item_obj;
/

-- Append log file.
SPOOL apply_plsql_lab12.txt append;

-- Describe item_tab.
DESC item_tab

-- Close log file.
SPOOL OFF

-- Create item_list function
CREATE OR REPLACE FUNCTION item_list
( pv_start_date DATE
, pv_end_date DATE DEFAULT TRUNC(SYSDATE + 1) ) RETURN item_tab IS

    TYPE item_rec IS RECORD
    ( title VARCHAR2(60)
    , subtitle VARCHAR2(60)
    , rating VARCHAR2(8)
    , release_date DATE );
    
    item_cur SYS_REFCURSOR;
    item_row ITEM_REC;
    item_set ITEM_TAB := item_tab();
    
BEGIN
        
    OPEN item_cur FOR 
        SELECT item_title, item_subtitle, item_rating, item_release_date
        FROM item
        WHERE item_rating_agency = 'MPAA'
        AND item_release_date BETWEEN pv_start_date AND pv_end_date;
        
    LOOP
        FETCH item_cur INTO item_row;
        EXIT WHEN item_cur%NOTFOUND;
        
        item_set.EXTEND;
        item_set(item_set.COUNT) := item_obj
            ( title => item_row.title
            , subtitle => item_row.subtitle
            , rating => item_row.rating
            , release_date => item_row.release_date);
    END LOOP;
    
    RETURN item_set;
END item_list;
/

-- Append log file. 
SPOOL apply_plsql_lab12.txt append;

-- Describe item_list.
DESC item_list

-- Test item_list
COL title   FORMAT A60 HEADING "TITLE"
COL rating  FORMAT A12 HEADING "RATING"
SELECT   il.title
,        il.rating
FROM     TABLE(item_list(pv_start_date => '01-JAN-2000')) il
ORDER BY 1;


-- Close log file.
SPOOL OFF


QUIT;

