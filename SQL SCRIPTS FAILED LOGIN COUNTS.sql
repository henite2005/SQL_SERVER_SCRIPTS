
SELECT Text,COUNT(Text) Number_Of_Attempts

FROM #TempLog where 

 Text like '%failed%' and ProcessInfo = 'LOGON'

 Group by Text
