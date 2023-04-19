SELECT TOP 1 * FROM dbo.dim_rider
GO
SELECT TOP 1 * FROM dbo.dim_station
GO
SELECT TOP 1 * FROM dbo.dim1_time
GO
SELECT TOP 1 * FROM dbo.fact1_payment
GO
SELECT TOP 1 * FROM dbo.fact1_trip
GO

SELECT COUNT(1) as COUNT, 'fact1_payment' as TABLE_NAME FROM fact1_payment
UNION
SELECT COUNT(1) as COUNT, 'dim_rider' as TABLE_NAME FROM dim_rider
UNION
SELECT COUNT(1) as COUNT, 'fact1_trip' as TABLE_NAME FROM fact1_trip
UNION
SELECT COUNT(1) as COUNT, 'dim_station' as TABLE_NAME FROM dim_station
UNION
SELECT COUNT(1) as COUNT, 'dim1_time' as TABLE_NAME FROM dim1_time
