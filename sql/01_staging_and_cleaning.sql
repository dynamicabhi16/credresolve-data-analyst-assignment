-- SQLite-oriented reference SQL. Raw CSV ingestion is handled by src/cleaning.py.
-- The production design should keep raw, clean and golden layers separate.

-- Example: create a clean payment table after loading raw_payments.
CREATE TABLE clean_payments AS
SELECT * FROM raw_payments WHERE payment_id IS NOT NULL;

-- Exact duplicates can be removed during ingestion with SELECT DISTINCT.
-- Business-key deduplication should prefer populated references and preserve payment_id.

-- Account is the authoritative borrower relationship.
CREATE TABLE golden_account_identity AS
SELECT a.account_id, a.borrower_id, b.name, b.phone, b.email, b.city, b.state
FROM clean_accounts a
LEFT JOIN golden_borrowers b ON a.borrower_id = b.borrower_id;

-- Never use payment_reference alone as a deduplication key: it is reused across accounts.
