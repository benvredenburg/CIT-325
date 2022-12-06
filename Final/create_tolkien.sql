/* 
   Name:   create_tolkien.sql
   Author: Benjamin Vredenburg
   Date:   02-DEC-2022
*/

-- Drop the tolkien table.
DROP TABLE tolkien;

-- Create the tolkien table.
CREATE TABLE tolkien
( tolkien_id NUMBER
, tolkien_character base_t);

-- Drop and create a tolkien_s sequence.
DROP SEQUENCE tolkien_s;
CREATE SEQUENCE tolkien_s START WITH 1;

-- Open log file.
SPOOL create_tolkien.txt

-- Describe tolkien.
DESC tolkien

-- Close log file.
SPOOL OFF

QUIT;

