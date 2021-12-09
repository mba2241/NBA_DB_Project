USE master
GO

IF EXISTS (
    SELECT [name]
    FROM sys.databases
    WHERE [name]= N'NBA_DB'
)

DROP DATABASE NBA_DB 
GO