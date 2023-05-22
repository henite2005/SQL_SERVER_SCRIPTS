--------------------------------------CHECK ALL INDEXES IN THE DATABASE---------------------------------------------------------------

with info as
	(SELECT
		ps.[object_id],
		ps.database_id,
		ps.index_id,
		ps.index_type_desc,
		ps.index_level,
		ps.fragment_count,
		ps.avg_fragmentation_in_percent,
		ps.avg_fragment_size_in_pages,
		ps.page_count,
		ps.record_count,
		ps.ghost_record_count
		FROM sys.dm_db_index_physical_stats
	    (DB_ID()
		, NULL, NULL, NULL ,
		N'LIMITED') as ps
		inner join sys.indexes as i on i.[object_id]=ps.[object_id] and i.[index_id]=ps.[index_id]
		where ps.index_level = 0
		and ps.avg_fragmentation_in_percent >= 10
		and ps.index_type_desc <> 'HEAP'
		and ps.page_count>=8 --1 экстент
		and i.is_disabled=0
		)
	SELECT
		DB_NAME(i.database_id) as db,
		SCHEMA_NAME(t.[schema_id]) as shema,
		t.name as tb,
		i.index_id as idx,
		i.database_id,
		(select top(1) idx.[name] from [sys].[indexes] as idx where t.[object_id] = idx.[object_id] and idx.[index_id] = i.[index_id]) as index_name,
		i.index_type_desc,
		i.[object_id],
		i.fragment_count as frag_num,
		round(i.avg_fragmentation_in_percent,2) as frag,
		round(i.avg_fragment_size_in_pages,2) as frag_page,
		i.page_count as [page]
	FROM info as i
	inner join [sys].[all_objects]	as t	on i.[object_id] = t.[object_id];


--------------------------------------INDEX REORGANIZATION---------------------------------------------------------------

ALTER INDEX < index_name> ON <schema>.<table> REORGANIZE;


--------------------------------------INDEX REBUILDING---------------------------------------------------------------

ALTER INDEX < index_name> ON <schema>.<table> REBUILD;
ALTER INDEX <index_name> ON <schema>.<table> REBUILD WITH(ONLINE=ON);


--------------------------------------CLEAR AND OPTIMIZE ALL INDEXES IN THE DATABASE AT ONCE---------------------------------------------------------------

DECLARE @Database NVARCHAR(255)   
DECLARE @Table NVARCHAR(255)  
DECLARE @cmd NVARCHAR(1000)  

DECLARE DatabaseCursor CURSOR READ_ONLY FOR  
SELECT name FROM master.sys.databases   
WHERE name NOT IN ('master','msdb','tempdb','model','distribution')  -- databases to exclude
--WHERE name IN ('DB1', 'DB2') -- use this to select specific databases and comment out line above
AND state = 0 -- database is online
AND is_in_standby = 0 -- database is not read only for log shipping
ORDER BY 1  

OPEN DatabaseCursor  

FETCH NEXT FROM DatabaseCursor INTO @Database  
WHILE @@FETCH_STATUS = 0  
BEGIN  

   SET @cmd = 'DECLARE TableCursor CURSOR READ_ONLY FOR SELECT ''['' + table_catalog + ''].['' + table_schema + ''].['' +  
   table_name + '']'' as tableName FROM [' + @Database + '].INFORMATION_SCHEMA.TABLES WHERE table_type = ''BASE TABLE'''   

   -- create table cursor  
   EXEC (@cmd)  
   OPEN TableCursor   

   FETCH NEXT FROM TableCursor INTO @Table   
   WHILE @@FETCH_STATUS = 0   
   BEGIN
      BEGIN TRY   
         SET @cmd = 'ALTER INDEX ALL ON ' + @Table + ' REBUILD' 
         --PRINT @cmd -- uncomment if you want to see commands
         EXEC (@cmd) 
      END TRY
      BEGIN CATCH
         PRINT '---'
         PRINT @cmd
         PRINT ERROR_MESSAGE() 
         PRINT '---'
      END CATCH

      FETCH NEXT FROM TableCursor INTO @Table   
   END   

   CLOSE TableCursor   
   DEALLOCATE TableCursor  

   FETCH NEXT FROM DatabaseCursor INTO @Database  
END  
CLOSE DatabaseCursor   
DEALLOCATE DatabaseCursor
