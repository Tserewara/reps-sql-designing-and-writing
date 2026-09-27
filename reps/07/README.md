# 07 · Clean station names

Find the station names that end in whitespace, fix them in a transaction, and return each name before and after. Find the bad row with a pattern and correct it with a string function. Roll back at the end.

Expected: 1 changed row, `Harvard ` to `Harvard`. Before the update, searching for `Harvard` with `=` finds nothing.
