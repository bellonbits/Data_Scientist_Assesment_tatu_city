# Statistical Analysis Results

This section summarizes the statistical findings related to call handling behavior, customer experience, and disconnect outcomes. All statistics were computed using the full consolidated dataset from Files 1–7.

---

## 14) Correlation Between Hold Time and Handle Time

**Statistic:** Pearson Correlation Coefficient  
**Result:** **0.75**

**Interpretation:**  
There is a **strong positive correlation** between hold time and total handle time. This indicates that as customers spend more time on hold, the overall duration of the call increases substantially. Hold time is therefore a primary driver of handle time.

**Implication:**  
Reducing hold time is a direct and effective lever for lowering average handle time and improving operational efficiency.

---

## 15) Effect of Hold Time on Talk Time

**Statistic:** Pearson Correlation Coefficient  
**Result:** **0.45**

**Interpretation:**  
Hold time has a **moderate positive correlation** with talk time, but the relationship is significantly weaker than with handle time. This suggests that longer waits do not consistently translate into longer conversations once the customer is connected to an agent.

**Implication:**  
Talk time is driven more by issue complexity than by waiting time. Improvements to queue performance will primarily improve customer wait experience rather than materially reducing conversation length.

---

## 16) Relationship Between Survey Scores and Disconnect Type

**Statistic:** Mean survey score by disconnect type  

**Findings (relative):**
- **Transfer / Client disconnects:** Highest average survey scores  
- **Peer disconnects:** Lowest average survey scores  
- **Error / Unknown disconnects:** Consistently low scores

**Interpretation:**  
Survey scores vary significantly by disconnect type. Calls ending in **peer disconnects** are associated with the poorest customer satisfaction, indicating that system-side or agent-side failures have a disproportionate negative impact on customer experience.

**Implication:**  
Reducing peer disconnects should be a priority, as they are strongly correlated with negative customer feedback.

---

## 17) Relationship Between Hold Time and Disconnect Type

**Statistic:**  
- Mean hold time by disconnect type  
- Two-sample Welch’s t-test (client vs peer)

**Key Results:**
- Client disconnects have **higher average hold times** than peer disconnects  
- **T-test statistic:** 18.68  
- **p-value:** < 1e-77 (statistically significant)

**Interpretation:**  
The statistically significant difference in hold times indicates that customers are more likely to disconnect themselves after extended waiting periods. Peer disconnects, by contrast, occur at lower hold times and are more indicative of technical or operational issues.

**Implication:**  
Long hold times drive customer abandonment, while peer disconnects represent a separate class of system reliability problems. Each requires a different mitigation strategy.

---

## Summary of Statistical Insights

- Hold time is a strong predictor of overall handle time and customer abandonment.
- Talk time is only weakly influenced by waiting.
- Disconnect type is closely tied to both customer satisfaction and hold duration.
- Client disconnects are behavior-driven (abandonment), while peer disconnects are operationally driven.

These findings provide clear guidance for prioritizing queue management improvements and system reliability initiatives.
