/* 
   Name:   silvan_t.sql
   Author: Benjamin Vredenburg
   Date:   02-DEC-2022
*/

-- Create silvan_t object subtype of elf_t.
CREATE OR REPLACE
  TYPE silvan_t UNDER elf_t
  ( elfkind  VARCHAR2(30)
  , CONSTRUCTOR FUNCTION silvan_t
    ( elfkind    VARCHAR2 DEFAULT 'Silvan' ) RETURN SELF AS RESULT
  , MEMBER FUNCTION get_elfkind RETURN VARCHAR2
  , MEMBER PROCEDURE set_elfkind (elfkind VARCHAR2)
  , OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 )
  INSTANTIABLE NOT FINAL;
/

-- Create type body.
CREATE OR REPLACE TYPE BODY silvan_t IS
  -- Implement a default constructor.
  CONSTRUCTOR FUNCTION silvan_t
        ( elfkind    VARCHAR2 DEFAULT 'Silvan' ) RETURN SELF AS RESULT IS
  BEGIN
    self.oid := tolkien_s.CURRVAL-1;
    self.name    := name;
    self.genus   := genus;
    self.oname   := 'Elf';
    self.elfkind := elfkind;
    RETURN;
  END silvan_t;
 
  -- Implement a get_elfkind function.
  MEMBER FUNCTION get_elfkind
  RETURN VARCHAR2 IS
  BEGIN
    RETURN self.elfkind;
  END get_elfkind;

  -- Implement a set_elfkind procedure.
  MEMBER PROCEDURE set_elfkind (elfkind VARCHAR2) IS
  BEGIN
    self.elfkind := elfkind;
  END set_elfkind;
  
  -- Implement an overriding to_string function with generalized invocation.
  OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 IS
  BEGIN
    RETURN (self AS elf_t).to_string||'['||self.elfkind||']';
  END to_string;
END;
/

-- Open log file.
SPOOL silvan_t.txt

-- Describe silvan_t.
DESC silvan_t

-- Close log file.
SPOOL OFF

QUIT;
