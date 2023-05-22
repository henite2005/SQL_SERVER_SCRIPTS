--Find Last Successful login. Useful to know before deleting "obsolete" accounts.

SELECT Distinct MAX(logdate) last_login,Text 

FROM #TempLog 

where ProcessInfo = 'LOGON'and Text like '%SUCCEEDED%' 

and Text not like '%NT AUTHORITY%'

Group by Text



DROP TABLE #TempLog

DROP TABLE #logF
