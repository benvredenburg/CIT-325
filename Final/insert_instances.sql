-- ======================================================================
--  Name:    insert_instances.sql
--  Author:  Michael McLaughlin
--  Date:    02-Apr-2020
-- ------------------------------------------------------------------
--  Purpose: Prepare final project environment.
-- ======================================================================

-- Open the log file.
SPOOL insert_instances.txt

-- Reset table.
DELETE FROM tolkien;

-- Here's a sample insert.
DECLARE
BEGIN
 
    /* Insert instance of the object type into tolkien table. */
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, man_t( name => 'Boromir' ));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, man_t( name => 'Faramir' ));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, hobbit_t( name => 'Bilbo' ));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, hobbit_t( name => 'Frodo' ));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, hobbit_t( name => 'Merry' ));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, hobbit_t( name => 'Pippin'));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, hobbit_t( name => 'Samwise' ));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, dwarf_t( name => 'Gimli'));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, elf_t( name => 'Feanor' ));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, elf_t( name => 'Tauriel'));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, elf_t( name => 'Earwen'));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, elf_t( name => 'Celeborn'));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, elf_t( name => 'Thranduil'));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, elf_t( name => 'Legolas'));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, orc_t( name => 'Azog the Defiler'));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, orc_t( name => 'Bolg'));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, maia_t( name => 'Gandalf the Grey'));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, maia_t( name => 'Radagast the Brown'));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, maia_t( name => 'Saruman the White'));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, goblin_t( name => 'The Great Goblin'));
    INSERT INTO tolkien VALUES (tolkien_s.NEXTVAL, man_t( name => 'Aragorn' ));
 
 
    /* Commit the record. */
    COMMIT;



END;
/

SHOW ERRORS
-- Put your other insert statements here.


-- Close the log file.
SPOOL OFF

QUIT;
