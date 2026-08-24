# Production Analytics Architecture

```text
Raw CSV / source systems
        │
        ▼
     STAGING  ── data contracts + schema checks
        │
        ▼
      CLEAN   ── dedupe + timestamp normalization + ID validation
        │
        ▼
     GOLDEN   ── account/borrower/entity-resolved analytical layer
        │
        ├──────────────► FEATURE layer
        │                 ├─ contact / RPC / PTP
        │                 ├─ channel touches
        │                 ├─ recovery
        │                 └─ agent-hour productivity
        │
        ▼
      METRICS  ── versioned metric definitions
        │
        ▼
   DASHBOARD / MEMO

Monitoring runs beside each stage:
- row-count and freshness checks
- primary-key uniqueness
- null-rate thresholds
- referential integrity
- duplicate-payment alerts
- timestamp drift / late-arrival monitoring
- metric anomaly detection
