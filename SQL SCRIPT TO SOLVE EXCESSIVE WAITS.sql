SELECT TOP 10 wait_type
AS [Wait Type], 
                wait_time_ms/1000.0
AS [Total Wait Time (second)], 
                (wait_time_ms-signal_wait_time_ms)/1000.0
AS [Resource Wait Time (second)], 
                signal_wait_time_ms/1000.0
AS [Signal Wait Time (second)], 
                waiting_tasks_count
AS [Wait Count]
FROM sys.dm_os_wait_stats
WHERE wait_type NOT IN
(N'CLR_SEMAPHORE', 
    N'LAZYWRITER_SLEEP', 
    N'RESOURCE_QUEUE', 
    N'SQLTRACE_BUFFER_FLUSH', 
    N'SLEEP_TASK', 
    N'SLEEP_SYSTEMTASK', 
    N'WAITFOR', 
    N'HADR_FILESTREAM_IOMGR_IOCOMPLETION', 
    N'CHECKPOINT_QUEUE', 
    N'REQUEST_FOR_DEADLOCK_SEARCH', 
    N'XE_TIMER_EVENT', 
    N'XE_DISPATCHER_JOIN', 
    N'LOGMGR_QUEUE', 
    N'FT_IFTS_SCHEDULER_IDLE_WAIT', 
    N'BROKER_TASK_STOP', 
    N'CLR_MANUAL_EVENT', 
    N'CLR_AUTO_EVENT', 
    N'DISPATCHER_QUEUE_SEMAPHORE', 
    N'TRACEWRITE', 
    N'XE_DISPATCHER_WAIT', 
    N'BROKER_TO_FLUSH', 
    N'BROKER_EVENTHANDLER', 
    N'FT_IFTSHC_MUTEX', 
    N'SQLTRACE_INCREMENTAL_FLUSH_SLEEP', 
    N'DIRTY_PAGE_POLL', 
    N'SP_SERVER_DIAGNOSTICS_SLEEP')
ORDER BY wait_time_ms-signal_wait_time_ms DESC;

-----------------------------------------------------------------------

DBCC SQLPERF ('sys.dm_os_wait_stats', CLEAR);
--GO

-----------------------------------------------------------------------

SELECT
owt.session_id,
owt.exec_context_id,
owt.wait_duration_ms,
owt.wait_type,
owt.blocking_session_id,
owt.resource_description,
est.text,
es.program_name,
eqp.query_plan,
es.cpu_time,
es.memory_usage
FROM
sys.dm_os_waiting_tasks owt
INNER JOIN sys.dm_exec_sessions es ON 
owt.session_id = es.session_id
INNER JOIN sys.dm_exec_requests er
ON es.session_id = er.session_id
OUTER APPLY sys.dm_exec_sql_text (er.sql_handle) est
OUTER APPLY sys.dm_exec_query_plan (er.plan_handle) eqp
WHERE es.is_user_process = 1
ORDER BY owt.session_id, owt.exec_context_id
