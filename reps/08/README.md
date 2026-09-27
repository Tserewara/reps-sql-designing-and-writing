# 08 · Audit a status change

Retire card 4 without deleting its row. Return the old and new status from `card_status_events`, and the number of cards still present. Roll back once you've looked at both.

Expected: one audit row, `blocked` to `retired`, and 5 cards still present. The trigger compares `OLD` and `NEW` on an update, so a delete would have left nothing in `card_status_events`.
