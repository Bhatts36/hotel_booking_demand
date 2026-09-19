-- Hotel Booking Demand
-- Data Exploration


-- Q1. Total number of bookings

SELECT
    COUNT(*) AS total_bookings
FROM
    hotel_bookings;


-- Q2. Bookings by hotel type

SELECT
    hotel,
    COUNT(*) AS bookings
FROM
    hotel_bookings
GROUP BY
    hotel;


-- Q3. Bookings by year

SELECT
    arrival_date_year,
    COUNT(*) AS bookings
FROM
    hotel_bookings
GROUP BY
    arrival_date_year;


-- Q4. Bookings by month

SELECT
    arrival_date_month AS month,
    COUNT(*) AS bookings
FROM
    hotel_bookings
GROUP BY
    arrival_date_month
ORDER BY
    bookings DESC;


-- Q5. Canceled vs. non-canceled bookings

SELECT
    is_canceled,
    COUNT(*) AS bookings
FROM
    hotel_bookings
GROUP BY
    is_canceled;


-- Q6. Overall cancellation rate

SELECT
    COUNT(CASE WHEN is_canceled = 1 THEN 1 END) * 100.0 / COUNT(*) AS cancellation_rate
FROM
    hotel_bookings;


-- Q7. Average ADR

SELECT
    AVG(adr) AS average_adr
FROM
    hotel_bookings;


-- Q8. Average length of stay

SELECT
    AVG(stays_in_weekend_nights + stays_in_week_nights) AS average_nights
FROM
    hotel_bookings;


-- Q9. Average booking lead time

SELECT
    AVG(lead_time) AS average_lead_time
FROM
    hotel_bookings;


-- Q10. Bookings by customer type

SELECT
    customer_type,
    COUNT(*) AS bookings
FROM
    hotel_bookings
GROUP BY
    customer_type;