# 02 · Inspect the card schema

Using PostgreSQL's catalog, return the columns of `cards` with their declared types, whether they accept `NULL`, and their defaults, in column order. Get the answer from the database, not by copying `seed/01-schema.sql`.

Expected: 6 rows. `id` is an integer identity column, `balance` is `numeric(10,2)`, not null, default 0, `status` is `card_status`, not null, default `active`, `registered_at` is `timestamp with time zone`, and `deleted` is a boolean that defaults to false. If `balance` shows as plain `numeric` and `status` as `USER-DEFINED`, you are reading `information_schema.columns` and still need the declared type.
