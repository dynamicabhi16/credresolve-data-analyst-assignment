# Counterfactual Methodology

The supplied data does not contain a clean treatment flag or a documented date at which the targeting strategy changed. Therefore I would **not** fabricate a causal estimate.

## Proposed design
- **Treatment:** accounts first exposed to the new targeting policy after the verified strategy switch date.
- **Control:** comparable eligible accounts that remained under the old policy during the same period.
- **Primary outcome:** successful payment amount per eligible account within 30 days.
- **Secondary outcomes:** payer rate, PTP kept rate, complaint rate, and cost per ₹ recovered.
- **Identification:** randomized holdout is preferred. If randomization is impossible, use propensity-score matching or inverse-probability weighting plus difference-in-differences around the switch date.
- **Confounders:** DPD, outstanding amount, risk segment, loan type, geography, prior contact history, prior payment history, campaign, agent/team, channel eligibility, and time.
- **Checks:** pre-trend balance, placebo dates, sensitivity to attribution windows, and treatment leakage.

## Why this is needed
Campaign strategy-version mix is relatively stable across Jan–Jul, so version labels alone are not a defensible treatment definition. A causal investment decision needs an explicit exposure rule and a control group.
