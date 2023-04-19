-- CREATE fact_trip table

IF OBJECT_ID('DBO.fact_trip') IS NOT NULL BEGIN DROP EXTERNAL TABLE DBO.fact_trip;

END CREATE EXTERNAL TABLE [DBO].[fact_trip] WITH (

    LOCATION = 'star_schema/fact_trip.csv' ,
    DATA_SOURCE = [udacitycontainer1_udacitystorageaccount1_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
    st.TripId,
    st.RiderId,
    st.RideableType,
    st.StartAt,
    st.EndedAt,
    st.StartStationId,
    st.EndStationId,
	DATEDIFF(MINUTE, st.StartAt, st.EndedAt) AS Duration,
	DATEDIFF(YEAR, sr.Birthday, st.StartAt) AS RiderAge

    FROM 
        dbo.staging_trip AS st
        JOIN staging_rider AS sr ON sr.RiderId=st.RiderId

) ;

GO

SELECT *

FROM 
    [DBO].[fact_trip]