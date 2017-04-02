alter user TEST_SCHEMA quota unlimited on USERS;

CREATE OR REPLACE DIRECTORY dmpdir AS '/u01/app/oracle/oradata/';
GRANT READ, WRITE ON DIRECTORY dmpdir TO system;