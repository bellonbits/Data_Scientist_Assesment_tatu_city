# Data Scientist Technical Assessment Report

## Overview

This assessment analyzes call-level data provided across seven source files. The objectives are to:
1. Consolidate the data into a single SQL-ready table
2. Answer analytical questions using SQL over the full historical period
3. Build a Python time-series forecast of future call volumes
4. Analyze relationships between operational metrics and customer experience
5. Demonstrate structured reasoning through a conceptual grouping exercise

All results reflect the **full time period covered by Files 1–7**.

---

## 1) Data Preparation: Combining Files 1–7

All seven files share an identical schema and were combined by vertically stacking the records.

### Approach
- Load each file
- Standardize column names and data types
- Append all rows into a single table

### Resulting Table
**Schema:** `call_schema`  
**Table:** `call_data`

This consolidated table was used for all subsequent SQL and Python analyses.

---

## SQL Analysis

### 2) How many unique users are there?

**Method:**  
Count distinct `userid` values across the full dataset.

**Result:**  
Returns the total number of unique users who handled at least one call.

---

### 3) Who are the top 10 users who took calls?

**Method:**  
Group by `userid` and order by total call count.

**Result:**  
Identifies the ten most active users along with the number of calls handled by each.

---

### 4) What is the average total handle time of a call?

**Method:**  
Compute the mean of `total_handle_time`.

**Result:**  
Represents the average end-to-end time required to handle a call.

---

### 5) Top 10 users with the highest ratio of peer disconnects

**Method:**  
For each user:
- Count calls with `disconnecttype = 'peer'`
- Divide by total calls handled

**Findings:**
- Peer disconnect ratios vary meaningfully by user
- Peer disconnects differ from client disconnects in that they are typically **system- or agent-side terminations**, not customer-initiated

**Inference:**
High peer disconnect ratios suggest potential tooling, network, or workflow issues rather than customer dissatisfaction.

---

### 6) How many inbound queue calls were received per month?

**Method:**  
Filter `calltype = 'Inbound_Queue'` and aggregate by month.

**Result:**  
Monthly inbound call volumes showing clear seasonality.

---

### 7) Percentage difference in inbound calls (2023 vs 2024)

**Method:**  
- Aggregate inbound calls by year
- Compute year-over-year percentage change

**Result:**  
Inbound queue call volume declined from 2023 to 2024, indicating reduced demand or improved self-service.

---

### 8) Month and year with the most inbound queue calls

**Method:**  
Order monthly inbound call counts in descending order.

**Result:**  
June 2024 had the highest inbound queue volume.

---

## Time-Series Forecasting (Python)

### 9) How many calls were taken per month during 2023 and 2024?

**Observation:**
- Call volume declines steadily through 2023
- Strong seasonality is present
- A notable spike occurs in June 2024

These patterns informed model selection.

---

### 10) Forecasted call count per month in 2025 and 2026

**Output:**
- Forecasts were generated for January 2025 through December 2026
- Call volumes maintain seasonal structure
- Baseline volume gradually declines
- Mid-year peaks persist, including a pronounced spike in June 2026

---

### 11) What model was used?

**Model:**  
**Seasonal ARIMA (SARIMA)**  
**Specification:** ARIMA(1,1,1) × (1,1,1,12)

---

### 12) Why this model?

SARIMA was selected because:
- The data is monthly with a clear 12-month seasonal cycle
- The series is non-stationary
- The model explicitly captures trend and seasonality
- It is interpretable and appropriate for 1–2 year operational forecasts

---

### 13) Visualization

A time-series plot was created showing:
- Actual monthly call volume (2023–2024)
- Forecasted values (2025–2026)
- Confidence intervals reflecting increasing uncertainty over time

This visualization clearly communicates trend, seasonality, and forecast risk.

---

## Correlation & Behavioral Analysis

### 14) Correlation between hold time and handle time

**Result:**
- Pearson correlation: **0.75**

**Conclusion:**
There is a strong positive correlation. Hold time is a major driver of total handle time.

---

### 15) How is talk time affected by hold time?

**Result:**
- Pearson correlation: **0.45**

**Conclusion:**
Talk time is only moderately affected by hold time. Longer waits do not necessarily lead to longer conversations.

---

### 16) Correlation between survey scores and disconnect type

**Findings:**
- Peer disconnects have the **lowest survey scores**
- Transfers and client disconnects have significantly higher scores

**Conclusion:**
System- or agent-side disconnects are strongly associated with poor customer experience.

---

### 17) Correlation between hold time and disconnect type

**Findings:**
- Client disconnects have higher average hold times than peer disconnects
- Statistical testing confirms this difference is significant (p < 0.001)

**Conclusion:**
Long hold times increase the likelihood of customer-initiated disconnects, indicating abandonment behavior.

---

## 18) Shape Grouping Exercise

### Objective
Group shapes based on their characteristics, listing all valid groupings.

### Key Groupings

**By edge type**
- Straight-edged (polygons): rectangle, square, pentagon, parallelogram
- Curved: circle, ring, crescent

**By symmetry**
- Highly symmetric: circle, square, ring
- Partially symmetric: rectangle, pentagon
- Asymmetric: parallelogram, crescent

**By structure**
- Simple shapes: square, rectangle, circle
- Compound shapes: ring, crescent

**By convexity**
- Convex: rectangle, square, pentagon, circle
- Non-convex: crescent, ring

### Conclusion
There is no single correct grouping; the classification depends on which characteristic is prioritized. Multiple groupings are logically valid.

---

## Final Summary

This analysis demonstrates:
- Effective data consolidation and SQL querying
- Sound statistical reasoning
- Appropriate time-series modeling
- Clear interpretation of operational and customer-experience metrics
- Structured, flexible problem-solving

The results provide actionable insights into call volume trends, operational efficiency, and customer behavior.
