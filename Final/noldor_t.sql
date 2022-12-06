/* 
   Name:   noldor_t.sql
   Author: Benjamin Vredenburg
   Date:   02-DEC-2022
*/

-- Create noldor_t object subtype of elf_t.
CREATE OR REPLACE
  TYPE noldor_t UNDER elf_t
  ( elfkind  VARCHAR2(30)
  , CONSTRUCTOR FUNCTION noldor_t
    ( elfkind    VARCHAR2 DEFAULT 'Noldor' ) RETURN SELF AS RESULT
  , MEMBER FUNCTION get_elfkind RETURN VARCHAR2
  , MEMBER PROCEDURE set_elfkind (elfkind VARCHAR2)
  , OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 )
  INSTANTIABLE NOT FINAL;
/

-- Create type body.
CREATE OR REPLACE TYPE BODY noldor_t IS
  -- Implement a default constructor.
  CONSTRUCTOR FUNCTION noldor_t
        ( elfkind    VARCHAR2 DEFAULT 'Noldor' ) RETURN SELF AS RESULT IS
  BEGIN
    self.oid := tolkien_s.CURRVAL-1;
    self.name    := name;
    self.genus   := genus;
    self.oname   := 'Elf';
    self.elfkind := elfkind;
    RETURN;
  END noldor_t;
 
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
SPOOL noldor_t.txt

-- Describe noldor_t.
DESC noldor_t

-- Close log file.
SPOOL OFF

QUIT;
