WITH db_cpu 
     AS (SELECT databaseid, 
                Db_name(databaseid)   AS [DatabaseName], 
                Sum(total_worker_time)AS [CPU_Time(Ms)] 
         FROM   sys.dm_exec_query_stats AS qs 
                CROSS apply(SELECT CONVERT(INT, value)AS [DatabaseID] 
                            FROM   sys.Dm_exec_plan_attributes(qs.plan_handle) 
                            WHERE  attribute = N'dbid')AS epa 
         GROUP  BY databaseid) 
SELECT Row_number() 
         OVER( 
           ORDER BY [cpu_time(ms)] DESC)                             AS [SNO], 
       databasename                                                  AS [DBName] 
       , 
       [cpu_time(ms)], 
       Cast([cpu_time(ms)] * 1.0 / Sum([cpu_time(ms)]) 
                                     OVER() * 100.0 AS DECIMAL(5, 2))AS 
       [CPUPercent] 
FROM   db_cpu 
WHERE  databaseid > 4 -- system databases  
       AND databaseid <> 32767 -- ResourceDB  
ORDER  BY sno 
OPTION(recompile); 
