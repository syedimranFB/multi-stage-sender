IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 FIRST_ROW = 2,
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'users_edrdatalake_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [users_edrdatalake_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://users@edrdatalake.dfs.core.windows.net' 
	)
GO


-----------------------------------------------------
-----------------------------------------------------
-----------------------------------------------------

IF EXISTS ( SELECT * FROM sys.external_tables 
WHERE object_id = OBJECT_ID('bronze.COMPANY') )
drop EXTERNAL TABLE bronze.COMPANY;


CREATE EXTERNAL TABLE bronze.COMPANY (
	[CompanyID] nvarchar(4000),
	[CompanyName] nvarchar(4000),
	[CountryCode] nvarchar(4000)
	)
	WITH (
	LOCATION = 'Test Folder/Sample Data Company.csv',
	DATA_SOURCE = [users_edrdatalake_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO

-----------------------------------------------------
-----------------------------------------------------
-----------------------------------------------------

IF EXISTS ( SELECT * FROM sys.external_tables 
WHERE object_id = OBJECT_ID('bronze.TEAM') )
drop EXTERNAL TABLE bronze.TEAM;



CREATE EXTERNAL TABLE bronze.TEAM (
	[CompanyID] bigint,
	[TeamID] bigint,
	[TeamName] nvarchar(4000)
	)
	WITH (
	LOCATION = 'Test Folder/Sample Data Team.csv',
	DATA_SOURCE = [users_edrdatalake_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO
