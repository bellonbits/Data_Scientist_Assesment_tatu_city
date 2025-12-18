# Data Scientist Technical Task – Tatu City

## Objective

The objective of this analysis is to understand historical call volume and call-handling behavior in order to:
- Quantify operational demand over time
- Identify drivers of call inefficiency and customer dissatisfaction
- Forecast future call volumes to support capacity planning and resource allocation

This analysis supports data-driven decision-making for operational planning and service optimization at Tatu City.

---

## Data

### Source
The dataset consists of seven call-level data files (Files 1–7), each containing detailed records of customer calls over multiple years. All files share an identical schema and were consolidated into a single analytical table.

### Key Features
- `startdatetime`: Timestamp of call initiation  
- `userid`: Identifier of the agent handling the call  
- `calltype`: Type of call (e.g., Inbound_Queue)  
- `disconnecttype`: How the call ended (client, peer, transfer, etc.)  
- `total_handle_time`: Total duration of the call  
- `total_hold_time`: Time the caller spent on hold  
- `total_talk_time`: Time spent speaking with an agent  
- `average_of_average_survey`: Customer satisfaction metric  

### Target Variable
- Monthly call volume (for forecasting)
- Operational and experience metrics (for correlation analysis)

---

## Approach

### 1. Data Cleaning and Preprocessing
- Combined Files 1–7 into a single dataset
- Standardized column names and data types
- Imputed missing numeric values with zeros where appropriate
- Handled missing categorical values using explicit labels

### 2. Exploratory Data Analysis
- Analyzed call volume trends by month and year
- Identified seasonality and long-term trends
- Examined distributions of hold time, talk time, and handle time
- Compared survey scores across disconnect types

### 3. Feature Engineering
- Aggregated call data at a monthly level
- Extracted year and month components for time-series analysis
- Created ratio-based metrics (e.g., peer disconnect ratio)

### 4. Modeling and Evaluation
- Built a time-series forecasting model to predict future call volumes
- Evaluated model behavior using historical trends and confidence intervals
- Performed correlation and statistical testing to validate behavioral insights

---

## Results

### Best Performing Model
**Seasonal ARIMA (SARIMA)**  
Specification: ARIMA(1,1,1) × (1,1,1,12)

### Key Metrics and Findings
- Strong seasonality in monthly call volume
- Overall decline in baseline call volume from 2023 to 2024
- Hold time and handle time show a strong positive correlation (r ≈ 0.75)
- Peer disconnects are associated with significantly lower customer satisfaction
- Client disconnects occur at higher hold times, indicating customer abandonment

### Interpretation
The results suggest that wait times and system reliability are the dominant drivers of both operational inefficiency and customer dissatisfaction.

---

## Business Insights

- **Capacity Planning:**  
  Forecasted call volumes for 2025–2026 enable proactive staffing and scheduling decisions.

- **Customer Experience:**  
  Reducing hold times can significantly improve handle time efficiency and reduce client disconnects.

- **Operational Reliability:**  
  Peer disconnects represent system or agent-side failures and should be prioritized for technical remediation.

- **Performance Management:**  
  Agent-level disconnect ratios can be used to identify training or tooling opportunities.

---

## Limitations & Next Steps

### Limitations
- Forecasting relies solely on historical call data and does not incorporate external drivers (e.g., policy changes, marketing campaigns).
- Survey responses are sparsely populated, which may bias satisfaction analysis.
- Outliers (e.g., sudden spikes in volume) may reflect one-off events not explicitly modeled.

### Next Steps
- Incorporate external or exogenous variables into the forecast
- Test alternative models (e.g., Prophet, ETS) for comparison
- Segment forecasts by call type or customer group
- Perform causal analysis to quantify the impact of operational changes

---

## How to Run

1. Load the consolidated dataset into PostgreSQL.
2. Execute the provided SQL scripts to reproduce aggregations and metrics.
3. Run the Python notebooks to generate forecasts, correlations, and visualizations.
4. Review plots and summary tables for interpretation and decision-making.

All code and queries are designed to be reproducible and modular.
