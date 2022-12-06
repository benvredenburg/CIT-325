/* 
   Name:   base_t.sql
   Author: Benjamin Vredenburg
   Date:   02-DEC-2022
*/

--@/home/student/Data/cit325/lib/cleanup_oracle.sql
--@/home/student/Data/cit325/lib/Oracle12cPLSQLCode/Introduction/create_video_store.sql

-- Create a base_t object type.
CREATE OR REPLACE 
    TYPE base_t IS OBJECT
        ( oid    NUMBER
        , oname  VARCHAR2(30)
        , CONSTRUCTOR FUNCTION base_t
            ( oid    NUMBER
            , oname  VARCHAR2 DEFAULT 'BASE_T' ) RETURN SELF AS RESULT
        , MEMBER FUNCTION     get_oname RETURN VARCHAR2
        , MEMBER PROCEDURE    set_oname (oname VARCHAR2)
        , MEMBER FUNCTION     get_name RETURN VARCHAR2
        , MEMBER FUNCTION     to_string RETURN VARCHAR2 ) INSTANTIABLE NOT FINAL;
/

-- Create type body.
CREATE OR REPLACE
  TYPE BODY base_t IS
  /* Implement a default constructor. */
  CONSTRUCTOR FUNCTION base_t
    ( oid        NUMBER
    , oname      VARCHAR2 DEFAULT 'BASE_T' ) RETURN SELF AS RESULT IS
  BEGIN
    self.oid := oid;
    self.oname := oname;
    RETURN;
  END base_t;
 
  -- Implement get function for get_oname
  MEMBER FUNCTION get_oname
  RETURN VARCHAR2 IS
  BEGIN
    RETURN self.oname;
  END get_oname;
 
  -- Implement get procedure for set_oname
  MEMBER PROCEDURE set_oname (oname VARCHAR2) IS
  BEGIN
    self.oname := oname;
  END set_oname;
 
  -- Implement a get function for get_name
  MEMBER FUNCTION get_name
  RETURN VARCHAR2 IS
  BEGIN
    RETURN NULL;
  END get_name;

  -- Implement to_string function
  MEMBER FUNCTION to_string
  RETURN VARCHAR2 IS
  BEGIN
    RETURN '['||self.oid||']';
  END to_string;
END;
/

-- Open log file.
SPOOL base_t.txt

-- Describe type object
DESC base_t

QUIT;

-- Close log file.
SPOOL OFF
