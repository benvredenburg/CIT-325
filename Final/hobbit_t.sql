/* 
   Name:   hobbit_t.sql
   Author: Benjamin Vredenburg
   Date:   02-DEC-2022
*/

-- Create hobbit_t object subtype of base_t.
CREATE OR REPLACE
  TYPE hobbit_t UNDER base_t
  ( name    VARCHAR2(30)
  , genus   VARCHAR2(30)
  , CONSTRUCTOR FUNCTION hobbit_t
        ( name       VARCHAR2
        , genus      VARCHAR2 DEFAULT 'Hobbits' ) RETURN SELF AS RESULT
  , OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2
  , MEMBER PROCEDURE set_name (name VARCHAR2)
  , MEMBER FUNCTION get_genus RETURN VARCHAR2
  , MEMBER PROCEDURE set_genus (genus VARCHAR2)
  , OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 )
  INSTANTIABLE NOT FINAL;
/

-- Create type body.
CREATE OR REPLACE TYPE BODY hobbit_t IS
  -- Implement a default constructor. 
  CONSTRUCTOR FUNCTION hobbit_t
        ( name      VARCHAR2
        , genus     VARCHAR2 DEFAULT 'Hobbits' ) RETURN SELF AS RESULT IS
  BEGIN
    self.oid := tolkien_s.CURRVAL-1;
    self.oname := 'Hobbit';
    self.name := name;
    self.genus := genus;
    RETURN;
  END hobbit_t;
 
  -- Override the get_name function.
  OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2 IS
  BEGIN
    RETURN self.name;
  END get_name;
  
  -- Implement a set_name procedure.
  MEMBER PROCEDURE set_name (name VARCHAR2) IS
  BEGIN
    self.name := name;
  END set_name;

  -- Implement a get_genus function.
  MEMBER FUNCTION get_genus RETURN VARCHAR2 IS
  BEGIN
    RETURN self.genus;
  END get_genus;

  -- Implement a set_genus procedure.
  MEMBER PROCEDURE set_genus (genus VARCHAR2) IS
  BEGIN
    self.genus := genus;
  END set_genus;
  
  -- Implement an overriding to_string function with generalized invocation.
  OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 IS
  BEGIN
    RETURN (self AS base_t).to_string||'['||self.name||']['||self.genus||']';
  END to_string;
END;
/

-- Open log file.
SPOOL hobbit_t.txt

-- Describe hobbit_t.
DESC hobbit_t

QUIT;

-- Close log file.
SPOOL OFF
