# Data Quality & Forensics Report

## Golden dataset principle
**account_id is the primary analytical key for account-level recovery.** When an event's borrower_id disagrees with the account master, borrower identity is derived from accounts rather than trusting the event borrower_id. Borrower profile attributes come from the latest borrower snapshot by borrower_id.

## Raw → rejected/corrected → golden
1. Load raw CSVs unchanged into staging.
2. Remove exact duplicate event rows.
3. Resolve duplicate business IDs conservatively (calls: highest completeness + latest event; payments: coalesce payment_reference and keep one row per payment_id).
4. Normalize timestamps to UTC where a timezone field exists.
5. Resolve account→borrower from accounts.
6. Create one row per account in the golden layer.
7. Preserve data-quality flags instead of silently deleting uncertain records.

## Findings
| Issue | Finding | Treatment |
|---|---:|---|
| Borrower duplicates | 600 exact duplicate rows; 11,015 unique IDs in 30,600 rows | Latest snapshot per borrower_id |
| Missing account borrower | 455 accounts | Keep account; exclude unresolved borrower analysis |
| Payment duplicates | 486 exact duplicate rows; 500 duplicate payment IDs | Deduplicate by payment_id; coalesce reference |
| Payment duplicate inflation | ₹25,901,962 (1.97%) | Clean before recovery reporting |
| Payment borrower mismatch | 24,617 | Account master wins |
| Call duplicates | 1,271 exact duplicate rows; 79 conflicting call IDs | Deduplicate and flag |
| Call timezone impact | 11,893 date changes | Normalize before time-of-day analysis |
| Status timestamp issue | 30,191 / 60,000 (50.3%) recorded_at < event_at | Preserve event time and ingestion time separately |
| Agent identity | All 1,000 agent IDs have changing master attributes across snapshots | Use agent_id for events; do not infer tenure |
| Missing dimensions | Language and client not present | Cannot analyze |
| Coverage | Jan 1–Aug 8, 2026 for core event tables | Use Jan–Jul as complete months |

## Why these choices matter
A clean-looking event table is not automatically a source of truth. In this dataset, event borrower IDs conflict with account-level identity and payment references are reused across accounts. Dedupe must therefore use the correct business key rather than a convenient-looking column.
