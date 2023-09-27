-----HOW TO CHECK TRACE PATH SETTINGS---
SELECT * FROM sys.configurations WHERE configuration_id = 1568

---SQL SCRIPT TO FIND THE PATH FOR TRACE FILE---
select path from sys.traces where is_default = 1

--ALSO--
SELECT path AS [Default Trace File]
	,max_size AS [Max File Size of Trace File]
	,max_files AS [Max No of Trace Files]
	,start_time AS [Start Time]
	,last_event_time AS [Last Event Time]
FROM sys.traces
WHERE is_default = 1

---SQL SCRIPT TO CHECK THE TRACE PATH FILE DETAILS---
select 
   e.name as eventclass
 , t.textdata
 , t.starttime
 , t.error 
 , t.hostname
 , t.ntusername
 , t.ntdomainname
 , t.clientprocessid
 , t.applicationname
 , t.loginname
 , t.spid
 from fn_trace_gettable('D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Log\log_856.trc', default) t
  inner join sys.trace_events e 
     on t.eventclass = e.trace_event_id 
--  where eventclass = xx
order by starttime DESC;


