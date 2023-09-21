1. OBJECT CHANGES QUERY
select * 
from sys.objects 
where (type = 'U' or type = 'P') 
  and modify_date > dateadd(m, -3, getdate())

2. TO GET THE MOST RECENTLY UPDATED TABLES
select
    object_name(object_id) as OBJ_NAME, *
from
    sys.dm_db_index_usage_stats
where
    database_id = db_id(db_name())
order by
    dm_db_index_usage_stats.last_user_update desc

3. TO CHECK IF A SPECIFIC TABLE WAS CHANGED SINCE A SPECIFIC DATE
select
    case when count(distinct object_id) > 0 then 1 else 0 end as IS_CHANGED
from
    sys.dm_db_index_usage_stats
where
    database_id = db_id(db_name())
    and object_id = object_id('MY_TABLE_NAME')
    and last_user_update > '2023-04-04'
