# Platform agnostic database migration

## Requirements
**Docker**

## First time setup
Run `docker-compose up oracle` to start the oracle container.
*Warning*: the container itself is more than 3Gb in size, and requires 6Gb of free space. Also, currently the init script is broken on Windows. You have to spin it up first on Mac, or Linux to initialise the DB. Then you can use those files to run the DB on Windows.

## Migration
Once your DB is up and running, run `docker-compose up flyway` to immediately run the migration process. The container will look for SQL files in the `sql/migration` folder.

## Kill oracle
Run `docker kill oracle`in your terminal.


### Helpers
**execute data export**
expdp system/oracle DUMPFILE=export.migrate.dmp content=METADATA_ONLY DIRECTORY=dmpdir SCHEMAS=TEST_SCHEMA exclude=TABLE:"IN('schema_history')"

**DDL export**
sqlplus system/oracle @ schema_ddl.sql
