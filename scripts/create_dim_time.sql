--CREATE dim_time TABLE

IF OBJECT_ID('DBO.dim_time') IS NOT NULL BEGIN DROP EXTERNAL TABLE DBO.dim_time;

END CREATE EXTERNAL TABLE [DBO].[dim_time] WITH (

    LOCATION = 'star_schema/dim_time.csv' ,
    DATA_SOURCE = [udacitycontainer1_udacitystorageaccount1_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
    RiderId AS TimeId,
	StartAt AS Date,
	DATEPART(WEEKDAY,CONVERT(DATE, StartAt)) AS DayofWeek,
	DATEPART(DAY,CONVERT(DATE, StartAt)) AS DayofMonth,
	DATEPART(WEEK,CONVERT(DATE, StartAt)) AS WeekofYear,
	DATEPART(QUARTER,CONVERT(DATE, StartAt)) AS Quarter,
    DATEPART(MONTH,CONVERT(DATE, StartAt)) AS Month,
	DATEPART(YEAR,CONVERT(DATE, StartAt)) AS Year

    FROM 
        dbo.staging_trip

) ;

GO

SELECT *

FROM 
    [DBO].[dim_time]