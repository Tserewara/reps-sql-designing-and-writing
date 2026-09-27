# 01 · Shape a staging table

Create a temporary staging table for a CharlieCard CSV import, with a card code, station name, fare and tap time. Make the fare numeric with a check that it isn't negative, and make the other required columns `NOT NULL`. Then add a `source` column that defaults to `csv`, and insert two rows of your own with `INSERT ... VALUES`.

The table stays temporary. Return the two rows you loaded, with their `source`.

Expected: 2 rows, both with `source = 'csv'`, numeric fares and `timestamptz` tap times. The table is gone once the connection ends.
