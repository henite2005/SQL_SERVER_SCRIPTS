-- Find the actual Memory used by SQL Server

select
      convert(decimal (5,2),physical_memory_in_use_kb/1048576.0) AS 'Physical Memory Used By SQL (GB)',
      convert(decimal (5,2),locked_page_allocations_kb/1048576.0) As 'Locked Page Allocation',
       convert(decimal (5,2),available_commit_limit_kb/1048576.0) AS 'Available Commit Limit (GB)',
      page_fault_count as 'Page Fault Count'
from  sys.dm_os_process_memory;

