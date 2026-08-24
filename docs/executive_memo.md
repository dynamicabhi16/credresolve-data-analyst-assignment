# Executive Memo — CredResolve Collections Analytics

## Decision
The reported “11% month-on-month recovery improvement” is **not supported as a sustained business improvement** by the supplied data. The latest complete month, July 2026, is +6.65% in raw successful payment amount versus June, but recovery per targeted account is only +4.19%, while January-to-July normalized recovery is +1.17%. The 11% figure appears to be a period-specific fluctuation rather than a stable trend.

## What happened?
- Operating-event data covers January 1–August 8, 2026; August is incomplete. Therefore Jan–Jul is the clean trend window.
- Successful recovery amount is broadly flat from January to July.
- Payer rate is also broadly flat; agent-hour productivity is essentially flat.
- July answer rate fell ~5% versus June even though raw recovery rose, so higher recovery is not explained by better contact efficiency.
- Portfolio mix across loan type, risk, timezone and schema version is stable month to month. DPD mix is also broadly stable.
- Campaign strategy-version mix is stable rather than showing a clean mid-year regime change.

## Why?
The strongest usable evidence is **association**, not causation. Observed 7-day post-touch conversion is highest for WhatsApp (3.01% payer rate), followed by SMS (2.51%), voice (2.40%), and field (1.86%). The supplied targeting data also shows voice recommendations with higher 7-day recovery per targeted account than field recommendations. However, channel assignment is observational and may reflect selection bias.

The dataset contains major attribution and data-quality problems: payment duplicates, borrower/account ID conflicts, timezone ambiguity, late/out-of-order timestamps, and an internally inconsistent agent master. These issues can materially distort historical reporting.

## Confidence
**Medium** for the conclusion that the 11% improvement is not sustained; **low-to-medium** for channel/segment ranking; **low** for any causal claim or ₹10 Cr ROI forecast.

## ₹10 Cr recommendation
Choose **better borrower targeting**, but do not commit the full amount without a controlled experiment. Use a staged allocation: treatment = targeting policy that prioritizes high-value/high-propensity borrowers and tests WhatsApp/voice sequencing; control = current targeting policy. Primary KPI = incremental successful recovery per targeted account, with complaint rate and cost per ₹ recovered as guardrails.

A full ROI and break-even point are **not identifiable from the supplied data** because the dataset has no channel/agent/telephony cost table and no randomized treatment/control assignment. A responsible investment case should therefore be released only after a pilot establishes incremental recovery and unit economics.

## Key data-quality impact
Exact payment duplicates alone inflate successful recovery by approximately ₹25,901,962, or 1.97% of cleaned successful recovery.
