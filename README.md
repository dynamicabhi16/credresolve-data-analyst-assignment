# CredResolve — Data Analyst Assignment

## What this submission contains
- `notebooks/credresolve_analysis.ipynb` — end-to-end reasoning and charts
- `output/golden_accounts.csv` — one-row-per-account analytical layer
- `output/monthly_metrics.csv` — reproducible KPI table
- `output/data_quality_report.csv` + `docs/data_quality_report.md` — forensics
- `dashboard/executive_dashboard.html` — one-screen CEO dashboard
- `docs/executive_memo.md` — executive answer (≤2 pages when rendered)
- `docs/architecture.md` — production design
- `docs/counterfactual.md` — causal/counterfactual methodology
- `sql/` — SQL repository examples
- `tests/` — basic cleaning tests

## Key conclusion
The supplied data does not support a sustained 11% month-on-month improvement. Jan–Jul successful recovery is essentially flat; normalized recovery per targeted account improves only ~1.17% from Jan to Jul. July vs June raw recovery is +6.65%, but recovery per targeted account is +4.19% and answer rate falls ~5%.

## Important limitation
The supplied core event data covers Jan 1–Aug 8, 2026, not a full 12 months. August is partial. The analysis therefore uses Jan–Jul for complete-month comparisons.

## How to run
1. Open the notebook in Jupyter/VS Code.
2. Set the raw data path to `data/raw`.
3. Run all cells.
4. Open `dashboard/executive_dashboard.html` for the CEO view.

## Recommended discussion points
Be able to explain why account_id is the source-of-truth for borrower attribution, why payment_reference is not a safe dedupe key, how timezone normalization affects hour/day analysis, and why the ₹10 Cr ROI cannot be credibly calculated without costs and a treatment/control design.
