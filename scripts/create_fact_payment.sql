-- CREATE fact_payment table

IF OBJECT_ID('DBO.fact1_payment') IS NOT NULL BEGIN DROP EXTERNAL TABLE DBO.fact1_payment;

END CREATE EXTERNAL TABLE [DBO].[fact1_payment] WITH (

    LOCATION = 'star_schema/fact_payment.csv' ,
    DATA_SOURCE = [udacitycontainer1_udacitystorageaccount1_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
        payment_id,
	    time_id,
        rider_id,
        amount

    FROM 
        dbo.staging_payment

) ;

GO

SELECT 10 *

FROM 
    [DBO].[fact1_payment]
