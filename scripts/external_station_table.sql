IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	    FORMAT_OPTIONS (
			FIELD_TERMINATOR = ',',
			USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'udacitycontainer1_udacitystorageaccount1_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [udacitycontainer1_udacitystorageaccount1_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://udacitycontainer1@udacitystorageaccount1.dfs.core.windows.net' 
	)
GO

CREATE EXTERNAL TABLE dbo.staging_station (
	[StationId] nvarchar(4000),
	[Name] nvarchar(4000),
	[Latitude] float,
	[Longtitude] float
	)
	WITH (
	LOCATION = 'source/publicstation.csv',
	DATA_SOURCE = [udacitycontainer1_udacitystorageaccount1_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.staging_station
GO