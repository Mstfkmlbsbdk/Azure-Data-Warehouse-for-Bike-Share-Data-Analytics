--CREATE dim_rider TABLE

IF OBJECT_ID('DBO.dim_rider') IS NOT NULL BEGIN DROP EXTERNAL TABLE DBO.dim_rider;

END CREATE EXTERNAL TABLE [DBO].[dim_rider] WITH (

    LOCATION = 'star_schema/dim_rider.csv' ,
    DATA_SOURCE = [udacitycontainer1_udacitystorageaccount1_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
        RiderId,
	    FirstName,
        LastName,
        Address,
        Birthday,
        AccountStartDate,
        AccountEndDate,
        IsMember

    FROM 
        dbo.staging_rider

) ;

GO

SELECT *

FROM 
    [DBO].[dim_rider]