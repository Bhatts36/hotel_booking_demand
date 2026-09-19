-- ============================================
-- 03_data_quality.sql
-- Data Quality Analysis
-- ============================================


-- Q1. How many NULL values are present
-- in important columns?

SELECT
    SUM(
        CASE
            WHEN agent IS NULL
            THEN 1
            ELSE 0
        END
    ) AS agent_nulls,

    SUM(
        CASE
            WHEN children IS NULL
            THEN 1
            ELSE 0
        END
    ) AS children_nulls,

    SUM(
        CASE
            WHEN company IS NULL
            THEN 1
            ELSE 0
        END
    ) AS company_nulls,

    SUM(
        CASE
            WHEN country IS NULL
            THEN 1
            ELSE 0
        END
    ) AS country_nulls

FROM
    hotel_bookings;


-- Q2. How many bookings have
-- 'Undefined' market segments?

SELECT
    COUNT(*) AS undefined_market_segment_bookings
FROM
    hotel_bookings
WHERE
    market_segment = 'Undefined';


-- Q3. How many bookings have 'Undefined'
-- in either market_segment or distribution_channel?

SELECT
    COUNT(*) AS undefined_channel_bookings
FROM
    hotel_bookings
WHERE
    market_segment = 'Undefined'
    OR
    distribution_channel = 'Undefined';


-- Q4. Find repeated combinations of hotel,
-- reservation status, and reservation status date.

SELECT
    hotel,
    reservation_status,
    reservation_status_date,
    COUNT(*) AS duplicates
FROM
    hotel_bookings
GROUP BY
    hotel,
    reservation_status,
    reservation_status_date
HAVING
    COUNT(*) > 1;


-- Q5. How many bookings have more than
-- 10 adults?

SELECT
    COUNT(*) AS extreme_adult_bookings
FROM
    hotel_bookings
WHERE
    adults > 10;


-- Q6. How many bookings have either
-- more than 10 adults or more than 5 children?

SELECT
    COUNT(*) AS extreme_guest_count_bookings
FROM
    hotel_bookings
WHERE
    adults > 10
    OR
    children > 5;


-- Q7. How many bookings have negative ADR,
-- and what is the minimum ADR?

SELECT
    COUNT(*) AS negative_adr_bookings,
    MIN(adr) AS min_adr
FROM
    hotel_bookings
WHERE
    adr < 0;


-- Q8. How many bookings have ADR = 0,
-- and what percentage of all bookings do they represent?

SELECT
    COUNT(*) AS zero_adr_bookings,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM hotel_bookings) AS zero_adr_percentage
FROM
    hotel_bookings
WHERE
    adr = 0;


-- Q9. How many bookings have zero total nights?

SELECT
    COUNT(*) AS zero_night_bookings
FROM
    hotel_bookings
WHERE
    stays_in_weekend_nights + stays_in_week_nights = 0;


-- Q10. How many bookings have a lead time
-- greater than 365 days?

SELECT
    COUNT(*) AS extreme_lead_time_bookings
FROM
    hotel_bookings
WHERE
    lead_time > 365;