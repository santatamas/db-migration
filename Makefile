setup-schema:
	docker exec -d oracle sqlplus system/oracle @ /u01/app/oracle/scripts/setup.sql

destroy-schema:
	docker exec -d oracle sqlplus system/oracle @ /u01/app/oracle/scripts/destroy.sql

export-ddl:
	docker exec -d oracle sqlplus system/oracle @ /u01/app/oracle/scripts/export_schema_ddl.sql

start-oracle:
	docker-compose up -d oracle

kill-oracle:
	docker kill oracle

migration:
	docker-compose up flyway