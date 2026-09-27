BEGIN;
UPDATE cards
SET deleted = true
WHERE deleted = false
RETURNING id;
SELECT COUNT(*) AS active_cards FROM cards WHERE deleted = false;
ROLLBACK;
