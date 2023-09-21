SELECT 
  name as USERNAME
, create_date as CREATION_DATE
, modify_date as LAST_MODIFIED_DATE
, DATEDIFF(day, modify_date
, GETDATE()) AS PASSWORD_AGE 
, is_policy_checked as POLICY_CHECKED
, is_expiration_checked EXPIRATION_CHECKED
, is_disabled as DISABLED
, type_desc as LOGIN_TYPE
, SERVERPROPERTY('ServerName') AS ServerName
FROM sys.sql_logins 
