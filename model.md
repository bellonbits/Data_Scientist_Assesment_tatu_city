# Forecasting Monthly Call Volume (Python)

This section describes the historical monthly call volumes and the forecasting approach used to predict future call volume. All analyses were performed using the consolidated dataset covering the full time period from Files 1–7.

---

## 9) How many calls were taken per month during 2023 and 2024?

The table below shows the actual number of calls taken per month in 2023 and 2024, aggregated at a monthly level.

### Monthly Call Volume (Actuals)

| Month | Calls |
|------|------:|
| 2023-01 | 57,871 |
| 2023-02 | 52,043 |
| 2023-03 | 54,822 |
| 2023-04 | 49,935 |
| 2023-05 | 47,810 |
| 2023-06 | 43,944 |
| 2023-07 | 41,282 |
| 2023-08 | 39,631 |
| 2023-09 | 33,387 |
| 2023-10 | 31,991 |
| 2023-11 | 26,157 |
| 2023-12 | 25,280 |
| 2024-01 | 38,177 |
| 2024-02 | 35,669 |
| 2024-03 | 38,793 |
| 2024-04 | 38,826 |
| 2024-05 | 36,221 |
| 2024-06 | 64,038 |
| 2024-07 | 35,151 |
| 2024-08 | 34,325 |
| 2024-09 | 31,029 |
| 2024-10 | 29,969 |
| 2024-11 | 27,771 |
| 2024-12 | 28,364 |

**Observations:**
- There is a clear downward trend from early 2023 through late 2024.
- Call volume exhibits strong seasonality, with higher volumes earlier in the year and lower volumes in Q3–Q4.
- June 2024 shows a notable spike, suggesting a seasonal or event-driven increase in calls.

---

## 10) What is the forecasted call count per month in 2025 and 2026?

Using a seasonal time series model, forecasts were generated for the next 24 months (January 2025 through December 2026).

### Forecasted Monthly Call Volume

#### 2025
| Month | Forecasted Calls |
|------|-----------------:|
| 2025-01 | 81,149 |
| 2025-02 | 75,668 |
| 2025-03 | 78,608 |
| 2025-04 | 74,467 |
| 2025-05 | 72,179 |
| 2025-06 | 74,071 |
| 2025-07 | 66,446 |
| 2025-08 | 64,897 |
| 2025-09 | 58,992 |
| 2025-10 | 57,615 |
| 2025-11 | 52,261 |
| 2025-12 | 51,650 |

#### 2026
| Month | Forecasted Calls |
|------|-----------------:|
| 2026-01 | 70,402 |
| 2026-02 | 67,459 |
| 2026-03 | 70,556 |
| 2026-04 | 69,983 |
| 2026-05 | 67,424 |
| 2026-06 | 91,474 |
| 2026-07 | 65,676 |
| 2026-08 | 64,745 |
| 2026-09 | 61,070 |
| 2026-10 | 59,964 |
| 2026-11 | 57,307 |
| 2026-12 | 57,726 |

The forecasts maintain the historical seasonal pattern while projecting a modest downward trend in baseline call volume.

---

## 11) What model was used to build the forecast?

**Model Used:**  
Seasonal ARIMA (SARIMA)

**Model Specification:**  
ARIMA(1,1,1) with seasonal components (1,1,1,12)

---

## 12) Why did you choose this model?

The SARIMA model was selected because:

- The data is monthly and exhibits a clear 12-month seasonal cycle.
- The time series is non-stationary, requiring differencing.
- SARIMA explicitly models both trend and seasonality.
- The model is interpretable and well-suited for operational forecasting over a 1–2 year horizon.

This approach provides a strong balance between predictive accuracy and business interpretability.

---

## 13) Visualization of actual data and forecast

The chart below shows historical monthly call volumes alongside the forecasted values for 2025 and 2026.

![Monthly Call Volume: Actuals and Forecast](<img width="1309" height="667" alt="image" src="https://github.com/user-attachments/assets/0fef07d1-a760-48d5-823e-6ba0e7a436f6" />
)

**Interpretation:**
- Historical data shows declining call volumes with consistent seasonality.
- The forecast continues this seasonal pattern while smoothing short-term volatility.
- The widening confidence intervals indicate increasing uncertainty at longer forecast horizons.

---

## Summary

Monthly call volume was aggregated from the full historical dataset and modeled using a Seasonal ARIMA approach to capture trend and seasonality. The resulting forecasts for 2025 and 2026 provide actionable insight for capacity planning while explicitly accounting for forecast uncertainty.
