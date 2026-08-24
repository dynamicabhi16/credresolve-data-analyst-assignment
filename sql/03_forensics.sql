-- Payment duplicate investigation
SELECT payment_id, COUNT(*) AS rows_per_payment
FROM raw_payments
GROUP BY payment_id
HAVING COUNT(*) > 1;

-- Borrower/account attribution conflicts
SELECT p.payment_id, p.account_id, p.borrower_id AS event_borrower_id, a.borrower_id AS account_borrower_id
FROM raw_payments p
JOIN accounts a USING(account_id)
WHERE p.borrower_id <> a.borrower_id;

-- Missing dimensions
SELECT
  SUM(CASE WHEN vendor_id IS NULL THEN 1 ELSE 0 END) AS missing_vendor,
  SUM(CASE WHEN agent_id IS NULL THEN 1 ELSE 0 END) AS missing_agent
FROM call_attempts;

-- Do not infer causality from channel conversion without randomized exposure.
