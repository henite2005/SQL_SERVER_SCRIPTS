---Import Image/File from File System To SQL Server Table---

INSERT INTO dbo.TblPicture_Src (
 NAME
 ,Picture
 )
SELECT 'Capture1.PNG'
 ,BulkColumn
FROM Openrowset(BULK 'C:\4_Mypicture.PNG', Single_Blob) AS Picture
