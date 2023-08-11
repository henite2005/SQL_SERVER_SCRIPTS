SELECT  qsqt.query_text_id,qsqt.query_sql_text,qsq.query_id,qsq.query_hash,
qsq.query_parameterization_type_desc,qsq.initial_compile_start_time,qsq.last_compile_start_time,
qsq.last_execution_time,qsq.avg_compile_duration,qsp.query_id,qsp.plan_id,qsrs.execution_type_desc
FROM sys.query_store_query_text qsqt
inner join sys.query_store_query qsq on qsq.query_text_id=qsqt.query_text_id
inner join sys.query_store_plan qsp on qsp.query_id=qsq.query_id
inner join sys.query_store_runtime_stats qsrs on qsrs.plan_id=qsp.plan_id
CROSS APPLY sys.fn_stmt_sql_handle_from_sql_stmt('SELECT * FROM QS_test WHERE rid=5',NULL) fsshfss
WHERE qsqt.statement_sql_handle=fsshfss.statement_sql_handle; 
