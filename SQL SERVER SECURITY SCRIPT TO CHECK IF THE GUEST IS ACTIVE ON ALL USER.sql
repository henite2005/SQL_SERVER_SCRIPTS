Create table #temp
(
	database_name sysname,
	name sysname,
	hasdbaccess int
)

insert into #Temp
exec sp_MSforeachdb N'select ''[?]'' as database_name, name, hasdbaccess from [?].sys.sysusers WHERE name = ''guest'''

SELECT * from #temp where hasdbaccess=1

SELECT * from #temp where hasdbaccess=0

drop table #temp
