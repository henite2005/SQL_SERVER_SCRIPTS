
SELECT  @@SERVERNAME as [Server Name],SERVERPROPERTY(N'Edition') AS Edition,cpu_count AS [Logical CPU Count],  
             cpu_count/hyperthread_ratio AS [Sockets],  hyperthread_ratio AS [Cores Per Socket], 
    CASE
       -- Developer Edition,Express Edition,Express Edition with Advanced Services = 0 licenses
       WHEN ((UPPER(Cast(SERVERPROPERTY(N'Edition') as sysname)) like N'%EXPRESS%') OR (UPPER(Cast(SERVERPROPERTY(N'Edition') as sysname)) like '%DEVELOPER%'))
            THEN 0 
       -- less then 4 cores = 2 licenses for Standard and Enterprise Edition
       WHEN ((cpu_count/2)<4) 
            THEN 2 
       -- Limited to 4 sockets & 24 cores for Standard Edition 
       WHEN ((cpu_count/hyperthread_ratio)> 4) AND UPPER(Cast(SERVERPROPERTY(N'Edition') as sysname)) like N'%STANDARD%'  AND 4*(hyperthread_ratio/2) <= 24
            THEN (4*(hyperthread_ratio))/2  
       WHEN ((cpu_count/hyperthread_ratio)<= 4) AND UPPER( Cast(SERVERPROPERTY(N'Edition') as sysname)) like N'%STANDARD%'  AND 4*(hyperthread_ratio/2) > 24
            THEN 24/2 
       -- Limited to 4 sockets & 16 cores for Web Edition 
       WHEN ((cpu_count/hyperthread_ratio)> 4) AND UPPER(Cast(SERVERPROPERTY(N'Edition') as sysname)) like '%WEB%'  AND 4*(hyperthread_ratio/2) <= 16
            THEN (4*(hyperthread_ratio))/2  
       WHEN ((cpu_count/hyperthread_ratio)<= 4) AND UPPER(Cast(SERVERPROPERTY(N'Edition') as sysname)) like '%WEB%'  AND 4*(hyperthread_ratio/2) > 16
            THEN 16/2 
       --Logical cores for Enterprise (unlimited)
       ELSE cpu_count/2   
     END as [Number of licenses]
FROM [sys].[dm_os_sys_info]
