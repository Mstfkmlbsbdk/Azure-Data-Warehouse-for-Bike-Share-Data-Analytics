--Create dim_time table

CREATE TABLE dim_time (
    TimeId int,
    Date datetime,
    DayofWeek int,
    DayofMonth int,
    WeekofYear int,
    Quarter int,
    Month int,
    Year int
)
DECLARE @StartDate DATETIME
DECLARE @EndDate DATETIME
SET @StartDate = (SELECT MIN(TRY_CONVERT(datetime, left(StartAt, 19))) FROM staging_trip)
SET @EndDate = DATEADD(year, 5, (SELECT MAX(TRY_CONVERT(datetime, left(StartAt, 19))) FROM staging_trip))

WHILE @StartDate <= @EndDate
      BEGIN
             INSERT INTO [dim_time]
             SELECT
                   @StartDate,
                   DATEPART(WEEKDAY, @StartDate),
                   DATEPART(DAY, @StartDate),
                   DATEPART(WEEK, @StartDate),
                   DATEPART(QUARTER, @StartDate),
                   DATEPART(MONTH, @StartDate),
                   DATEPART(YEAR, @StartDate)

             SET @StartDate = DATEADD(dd, 1, @StartDate)
      END