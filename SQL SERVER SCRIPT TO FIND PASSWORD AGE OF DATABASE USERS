SELECT name as USERNAME
, create_date as CREATE_DATE
, modify_date as LAST_MODIFIED_DATE
, DATEDIFF(day, modify_date
, GETDATE()) AS PASSWORD_AGE
, is_policy_checked as POLICY_CHECKED
, is_expiration_checked EXPIRATION_CHECKED
, is_disabled as DISABLED
FROM sys.sql_logins

SELECT name as USERNAME
, create_date as CREATE_DATE
, modify_date as LAST_MODIFIED_DATE
, DATEDIFF(day, modify_date
, GETDATE()) AS PASSWORD_AGE
, is_policy_checked as POLICY_CHECKED
, is_expiration_checked EXPIRATION_CHECKED
, is_disabled as DISABLED
FROM sys.sql_logins
WHERE is_disabled = '0'
ORDER BY name ASC;


