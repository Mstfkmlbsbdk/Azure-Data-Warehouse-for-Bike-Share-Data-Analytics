-- CREATE fact_trip table

IF OBJECT_ID('DBO.fact1_trip') IS NOT NULL BEGIN DROP EXTERNAL TABLE DBO.fact1_trip;

END CREATE EXTERNAL TABLE [DBO].[fact1_trip] WITH (

    LOCATION = 'star_schema/fact1_trip.csv' ,
    DATA_SOURCE = [udacitycontainer1_udacitystorageaccount1_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
    TripId,
    RiderId,
    RideableType,
    StartAt,
    EndedAt,
    StartStationId,
    EndStationId,
	ABS(DATEDIFF(MINUTE,cast(t.EndedAt AS DATETIME2),cast(t.StartAt AS DATETIME2))) AS Duration


    FROM 
        dbo.staging_trip AS t

) ;

GO

SELECT *

FROM 
    [DBO].[fact1_trip]