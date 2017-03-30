# db-migration

# alter TEST_SCHEMA, so flyway can do anything in it
alter user TEST_SCHEMA quota unlimited on USERS

#specify dump directory object in Oracle, which points to a physical dir
CREATE OR REPLACE DIRECTORY dmpdir AS '/u01/app/oracle/oradata/dmpdir';
GRANT READ, WRITE ON DIRECTORY dmpdir TO system;

# execute data export
expdp system/oracle DUMPFILE=export.migrate.dmp content=METADATA_ONLY DIRECTORY=dmpdir SCHEMAS=TEST_SCHEMA exclude=TABLE:"IN('schema_history')"

# DDL export
sqlplus system/oracle @ schema_ddl.sql
