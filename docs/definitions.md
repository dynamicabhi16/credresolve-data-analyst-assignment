# Metric Definitions

- **Contact rate:** unique outbound accounts with at least one answered outbound call / unique outbound accounts attempted.
- **RPC proxy:** unique accounts with a disposition indicating substantive contact (CALLBACK, DISPUTE, PAID, PROMISE_TO_PAY, PTP, PTP_BROKEN, REFUSED). This is a proxy because the raw data has no explicit RPC flag.
- **PTP rate:** unique accounts with a PTP event / RPC-proxy accounts.
- **PTP kept rate:** KEPT PTPs / (KEPT + BROKEN PTPs).
- **Recovery:** sum of SUCCESS payment amounts after payment deduplication.
- **Recovery per account:** successful recovery / unique targeted accounts in the month.
- **Recovery per agent-hour:** successful recovery / logged agent-session hours.
- **Channel conversion:** unique successful payers within 7 days after a qualifying channel touch / unique accounts touched by that channel. This is an observational association, not causal lift.
- **Cost per ₹ recovered:** not calculable from supplied data because no cost dataset was provided.
