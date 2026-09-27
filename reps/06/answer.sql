BEGIN;
UPDATE cards
SET status = 'blocked'
WHERE balance = 0 OR status <> 'retired'
RETURNING id;
ROLLBACK;
