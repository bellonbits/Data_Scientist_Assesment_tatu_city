/* =========================================================
   Data Scientist Technical Assessment
   SQL Analysis Script
   Database: PostgreSQL
   Schema: call_schema
   Table: call_data
   Time Period: Files 1–7 (full history)
   ========================================================= */


/* ---------------------------------------------------------
   2) How many unique users are there?
   --------------------------------------------------------- */
SELECT
    COUNT(DISTINCT userid) AS unique_users
FROM call_schema.call_data;


/* ---------------------------------------------------------
   3) Who are the top 10 users who took calls?
      How many calls did each take?
   --------------------------------------------------------- */
SELECT
    userid,
    COUNT(*) AS calls_taken
FROM call_schema.call_data
GROUP BY userid
ORDER BY calls_taken DESC
LIMIT 10;


/* ---------------------------------------------------------
   4) What is the average total handle time of a call?
   --------------------------------------------------------- */
SELECT
    AVG(total_handle_time) AS avg_total_handle_time
FROM call_schema.call_data;


/* ---------------------------------------------------------
   5) Top 10 users with the highest ratio of
      disconnect type 'peer' to total calls taken
   --------------------------------------------------------- */
SELECT
    userid,
    SUM(CASE WHEN disconnecttype = 'peer' THEN 1 ELSE 0 END)::FLOAT
        / COUNT(*) AS peer_disconnect_ratio,
    COUNT(*) AS total_calls
FROM call_schema.call_data
GROUP BY userid
HAVING COUNT(*) >= 10
ORDER BY peer_disconnect_ratio DESC
LIMIT 10;


/* ---------------------------------------------------------
   Disconnect type distribution (client vs peer comparison)
   --------------------------------------------------------- */
SELECT
    disconnecttype,
    COUNT(*) AS total_calls
FROM call_schema.call_data
GROUP BY disconnecttype;


/* ---------------------------------------------------------
   6) How many inbound queue calls were received per month?
   --------------------------------------------------------- */
SELECT
    DATE_TRUNC('month', startdatetime) AS month,
    COUNT(*) AS inbound_calls
FROM call_schema.call_data
WHERE calltype = 'Inbound_Queue'
GROUP BY month
ORDER BY month;


/* ---------------------------------------------------------
   7) Percentage difference of inbound queue calls
      taken in 2023 vs 2024
   --------------------------------------------------------- */
WITH yearly_calls AS (
    SELECT
        EXTRACT(YEAR FROM startdatetime) AS call_year,
        COUNT(*) AS inbound_calls
    FROM call_schema.call_data
    WHERE calltype = 'Inbound_Queue'
      AND EXTRACT(YEAR FROM startdatetime) IN (2023, 2024)
    GROUP BY call_year
)
SELECT
    (
        MAX(CASE WHEN call_year = 2024 THEN inbound_calls END)
        - MAX(CASE WHEN call_year = 2023 THEN inbound_calls END)
    ) * 100.0
    / MAX(CASE WHEN call_year = 2023 THEN inbound_calls END)
    AS pct_difference_2023_vs_2024
FROM yearly_calls;


/* ---------------------------------------------------------
   8) Month and year with the most inbound queue calls
   --------------------------------------------------------- */
SELECT
    DATE_TRUNC('month', startdatetime) AS month,
    COUNT(*) AS inbound_calls
FROM call_schema.call_data
WHERE calltype = 'Inbound_Queue'
GROUP BY month
ORDER BY inbound_calls DESC
LIMIT 1;
