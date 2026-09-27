# 04 · Import through staging

Inside a transaction, create a temporary staging table and load these two station rows into it with `COPY ... FROM STDIN`, as CSV, name then zone. Keep the spaces: they are what the import has to clean.

```
  Park Street  ,1
Downtown Crossing ,1
```

Insert them into `stations` with their names trimmed. Return the new station IDs and names, then roll back so the seed is intact for the next rep.

Expected: 2 rows on a freshly seeded database, IDs 6 and 7, `Park Street` and `Downtown Crossing` with no spaces around them. After the rollback, neither station exists.
