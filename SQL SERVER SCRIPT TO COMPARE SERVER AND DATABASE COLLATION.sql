SELECT CONVERT (varchar, SERVERPROPERTY('collation')) AS 'server_collation',collationproperty(CONVERT (varchar, SERVERPROPERTY('collation')), 'codepage') AS 'server_codepage' 
