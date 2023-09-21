USE [DB_NAME]
select so.name Objeto, su.name Owner
from sys.schemas so
inner join sysusers su on so.principal_id = su.uid
where su.name = 'usr_name'

USE [DB_NAME]
ALTER AUTHORIZATION ON SCHEMA::[OLD_SCHEMA_NAME] TO [NEW_SCHEMA_NAME] -- new owner username

