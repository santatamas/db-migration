# db-migration

### execute data export
expdp system/oracle DUMPFILE=export.migrate.dmp content=METADATA_ONLY DIRECTORY=dmpdir SCHEMAS=TEST_SCHEMA exclude=TABLE:"IN('schema_history')"

### DDL export
sqlplus system/oracle @ schema_ddl.sql
