---SQL SCRIPT TO FIND PORT NUMBER---

SET NOCOUNT ON
DECLARE @port varchar(30), @key varchar(150)
IF charindex('\',@@servername,0) <>0
BEGINSET @key = 'SOFTWARE\MICROSOFT\Microsoft SQL Server\'
+@@servicename+'\MSSQLServer\Supersocketnetlib\TCP'
END
ELSE
BEGINSET @key = 'SOFTWARE\MICROSOFT\MSSQLServer\MSSQLServer \Supersocketnetlib\TCP'
ENDEXEC master..xp_regread @rootkey='HKEY_LOCAL_MACHINE',
@key=@key,@value_name='Tcpport',@value=@port OUTPUT

SELECT 'SQL Server Name: '+@@servername + ' Port # '+convert(varchar(20),@port)
