SELECT 
	'use ' + db_name(dbid) + char(13) + 'dbcc shrinkfile (' + quotename(sf.name,'''') + ' ,truncateonly)' 
FROM sys.sysaltfiles AS sf
INNER JOIN sys.databases d 
	ON sf.dbid = d.database_id
WHERE d.state_desc = 'online'
