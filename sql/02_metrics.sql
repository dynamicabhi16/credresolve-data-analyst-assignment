-- Reproducible metric definitions. Replace table names with the deployed schema names.

-- Monthly recovery
SELECT strftime('%Y-%m', event_at) AS month,
       SUM(amount) AS successful_recovery,
       COUNT(DISTINCT payment_id) AS successful_payments,
       COUNT(DISTINCT account_id) AS unique_payers
FROM golden_payments
WHERE payment_status = 'SUCCESS'
GROUP BY 1
ORDER BY 1;

-- Recovery per targeted account
WITH targets AS (
  SELECT strftime('%Y-%m', target_date) AS month, COUNT(DISTINCT account_id) AS targeted_accounts
  FROM daily_targeting
  GROUP BY 1
), recovery AS (
  SELECT strftime('%Y-%m', event_at) AS month, SUM(amount) AS recovery
  FROM golden_payments
  WHERE payment_status='SUCCESS'
  GROUP BY 1
)
SELECT r.month, r.recovery, t.targeted_accounts,
       r.recovery / NULLIF(t.targeted_accounts,0) AS recovery_per_targeted_account
FROM recovery r JOIN targets t USING(month)
ORDER BY r.month;

-- PTP kept rate
SELECT strftime('%Y-%m', event_at) AS month,
       SUM(CASE WHEN status='KEPT' THEN 1 ELSE 0 END) * 1.0 /
       NULLIF(SUM(CASE WHEN status IN ('KEPT','BROKEN') THEN 1 ELSE 0 END),0) AS ptp_kept_rate
FROM promises_to_pay
GROUP BY 1 ORDER BY 1;
