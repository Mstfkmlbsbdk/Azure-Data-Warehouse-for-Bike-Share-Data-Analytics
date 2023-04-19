-- CREATE fact_payment table

IF OBJECT_ID('DBO.fact_payment') IS NOT NULL BEGIN DROP EXTERNAL TABLE DBO.fact_payment;

END CREATE EXTERNAL TABLE [DBO].[fact_payment] WITH (

    LOCATION = 'star_schema/fact_payment.csv' ,
    DATA_SOURCE = [udacitycontainer1_udacitystorageaccount1_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
        PaymentId,
	    PaymentDate,
        Amount,
        RiderId

    FROM 
        dbo.staging_payment

) ;

GO

SELECT *

FROM 
    [DBO].[fact_payment]
