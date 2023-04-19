--CREATE dim_time TABLE

IF OBJECT_ID('DBO.dim1_time') IS NOT NULL BEGIN DROP EXTERNAL TABLE DBO.dim1_time;

END CREATE EXTERNAL TABLE [DBO].[dim1_time] WITH (

    LOCATION = 'star_schema/dim_time.csv' ,
    DATA_SOURCE = [udacitycontainer1_udacitystorageaccount1_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
    PaymentId AS time_id,
	PaymentDate,
	DATEPART(DAY,CONVERT(DATE, PaymentDate)) AS DAY,
	DATEPART(MONTH,CONVERT(DATE, PaymentDate)) AS MONTH,
	DATEPART(QUARTER,CONVERT(DATE, PaymentDate)) AS QUARTER,
	DATEPART(YEAR,CONVERT(DATE, PaymentDate)) AS YEAR,
	DATEPART(DAYOFYEAR,CONVERT(DATE, PaymentDate)) AS DAY_OF_YEAR,
	DATEPART(WEEKDAY,CONVERT(DATE, PaymentDate)) AS DAY_OF_WEEK


    FROM 
        dbo.staging_payment

) ;

GO

SELECT 10 *

FROM 
    [DBO].[fact1_payment]