Below are connection string using Microsoft OLE DB Driver for SQL Server depending on the SQL Driver and SQL Version:

1. Asynchronous processing:
Server=myServerAddress;Database=myDataBase;Integrated Security=True;Asynchronous Processing=True;

2. Database Mirroring:
Data Source=myServerAddress;Failover Partner=myMirrorServerAddress;Initial Catalog=myDataBase;Integrated Security=True;

3. Availability Group And Failover Cluster:
Provider=MSOLEDBSQL;Server=tcp:AvailabilityGroupListenerDnsName,1433;MultiSubnetFailover=Yes;Database=MyDB;Integrated Security=SSPI;Connect Timeout=30;

4. Read-Only Application Intent:
Provider=MSOLEDBSQL;Server=tcp:AvailabilityGroupListenerDnsName,1433;MultiSubnetFailover=Yes;ApplicationIntent=ReadOnly;Database=MyDB;Integrated Security=SSPI;Connect Timeout=30;

5. Read-Only Routing:
Provider=MSOLEDBSQL;Server=aKnownReadOnlyInstance;MultiSubnetFailover=Yes;ApplicationIntent=ReadOnly;Database=MyDB;Integrated Security=SSPI;Connect Timeout=30;



