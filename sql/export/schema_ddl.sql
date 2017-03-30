set wrap on;
set pagesize 50000;
set linesize 120;
set trimspool on
set feedback off
set long 50000
SET COLSEP '|'
set headsep off
set heading off

column DDL Format a100

spool schema_ddl.csv

SELECT OBJECT_TYPE, OBJECT_NAME,DBMS_METADATA.GET_DDL(OBJECT_TYPE, OBJECT_NAME, OWNER) as DDL
  FROM ALL_OBJECTS
  WHERE (OWNER = 'TEST_SCHEMA') AND
  OBJECT_TYPE NOT IN('LOB','MATERIALIZED VIEW', 'TABLE PARTITION') AND
  OBJECT_NAME NOT IN('schema_history')
  ORDER BY OBJECT_TYPE, OBJECT_NAME;

spool off
exit