---Memory used by each database---

SELECT DB_NAME(database_id) AS DATABASE_NAME,
COUNT (1) * 8 / 1024 AS MEMORY_USED_MB
FROM sys.dm_os_buffer_descriptors
GROUP BY database_id
ORDER BY COUNT (*) * 8 / 1024 DESC;