# 09 · Soft-delete one card

The support request names card 4. An assistant wrote the soft-delete in `answer.sql`. Read it first, then run it and compare with the expected result below. Narrow the condition to the named card, keeping the row for the audit trail and the transaction that rolls it back.

Expected once fixed: 1 card marked deleted and 4 cards with `deleted = false`. The shipped file marks all 5 and leaves 0.
