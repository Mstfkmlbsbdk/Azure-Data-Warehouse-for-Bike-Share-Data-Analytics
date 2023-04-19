--CREATE dim_station TABLE

IF OBJECT_ID('DBO.dim_station') IS NOT NULL BEGIN DROP EXTERNAL TABLE DBO.dim_station;

END CREATE EXTERNAL TABLE [DBO].[dim_station] WITH (

    LOCATION = 'star_schema/dim_station.csv' ,
    DATA_SOURCE = [udacitycontainer1_udacitystorageaccount1_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
        StationId,
	    Name,
        Latitude,
        Longtitude

    FROM 
        dbo.staging_station

) ;

GO

SELECT *

FROM 
    [DBO].[dim_station]