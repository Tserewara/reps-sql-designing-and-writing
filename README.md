# SQL · Designing and writing

Your copy of the set. You write every answer here and commit it, so coming back to a rep in a few weeks means you can compare today's SQL with what you wrote the first time.

The statements are on the bench (backendgym.com/reps/sql-designing-and-writing) and in `reps/NN/README.md`. Each one prints its expected result.

## First task: a Postgres of your own

The set runs on PostgreSQL 16, loaded with a small CharlieCard schema. Setting it up is part of the set:

1. Run a PostgreSQL 16 server you can reach with `psql`. A container, a compose file you write yourself, a local install: your choice.
2. Create an empty database for the set, unless your setup already made one.
3. Load `seed/01-schema.sql`, then `seed/02-data.sql`, into it. The schema file creates an enum type, a function and a trigger as well as the tables, so load it whole and in that order.

<details>
<summary>Stuck? A first hint</summary>

The official `postgres:16` image reads `POSTGRES_USER`, `POSTGRES_PASSWORD` and `POSTGRES_DB` when it starts, and creates that database for you. Publish its port 5432 on a free port of your machine.
</details>

<details>
<summary>Still stuck? A second hint</summary>

`psql` loads a file with `-f`: `psql <connection> -f seed/01-schema.sql`. A connection string looks like `postgresql://user:password@localhost:PORT/database`.
</details>

You need a `psql` client on your machine for the commands below. If Postgres runs in a container and you would rather not install one, feed the file to the container's own `psql` on standard input: `docker exec -i <container> psql -U <user> -d <database> < seed/01-schema.sql`, and the same for every `-f` below.

### Check it

In `psql`, connected to your database:

- `\dt` lists five tables: `card_status_events`, `cards`, `riders`, `stations`, `swipes`.
- `SELECT count(*) FROM cards;` returns `5`, and `SELECT count(*) FROM swipes;` returns `4`.
- `\d cards` ends with a trigger, `cards_status_audit`.

If one of those is off, load the files again into an empty database.

## Doing a rep

1. Read the statement, `reps/NN/README.md`. Read `seed/` before the first one: the data is messy on purpose, and the reps are about what that mess does to a change.
2. Write your SQL in `reps/NN/answer.sql`, which is already there in every rep. In reps 03, 06 and 09 an assistant already wrote it: read it first, then run it.
3. Run it: `psql <connection> -f reps/NN/answer.sql`, where `<connection>` is your database, for example `postgresql://user:password@localhost:5433/charlie`.
4. Compare with the expected result in the statement. Nothing checks it for you.
5. Mark the rep done on its page on the bench (signed in with GitHub), with a line on what it showed you. Some reps ask a question or two after you finish: they are on the bench page, under the statement.

## Starting over

Most reps make their change inside a transaction and roll it back, so the next one starts from the seed. If a rep stops halfway, or you committed by mistake, drop the set's database from a session on the `postgres` database, create it again and load the two seed files.

```sh
psql postgresql://user:password@localhost:5433/postgres -c 'DROP DATABASE charlie' -c 'CREATE DATABASE charlie'
```
