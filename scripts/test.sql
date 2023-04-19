SELECT COUNT(payment_id) as COUNT, 'payment' as TABLE_NAME FROM payment
UNION
SELECT COUNT(1) as COUNT, 'rider' as TABLE_NAME FROM rider
UNION
SELECT COUNT(1) as COUNT, 'trip' as TABLE_NAME FROM trip
UNION
SELECT COUNT(1) as COUNT, 'station' as TABLE_NAME FROM station