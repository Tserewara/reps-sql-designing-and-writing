CREATE TYPE card_status AS ENUM ('active', 'blocked', 'retired');

CREATE TABLE riders (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text NOT NULL,
    email text NOT NULL UNIQUE
);

CREATE TABLE stations (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text NOT NULL UNIQUE,
    zone smallint NOT NULL CHECK (zone BETWEEN 1 AND 3),
    active boolean NOT NULL DEFAULT true
);

CREATE TABLE cards (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rider_id integer NOT NULL REFERENCES riders (id) ON DELETE RESTRICT,
    balance numeric(10,2) NOT NULL DEFAULT 0 CHECK (balance >= 0),
    status card_status NOT NULL DEFAULT 'active',
    registered_at timestamptz NOT NULL DEFAULT now(),
    deleted boolean NOT NULL DEFAULT false
);

CREATE TABLE swipes (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    card_id integer NOT NULL REFERENCES cards (id) ON DELETE RESTRICT,
    station_id integer NOT NULL REFERENCES stations (id) ON DELETE RESTRICT,
    entered_at timestamptz NOT NULL,
    exited_at timestamptz,
    fare numeric(6,2) NOT NULL CHECK (fare >= 0)
);

CREATE TABLE card_status_events (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    card_id integer NOT NULL REFERENCES cards (id),
    old_status card_status NOT NULL,
    new_status card_status NOT NULL,
    changed_at timestamptz NOT NULL DEFAULT now()
);

CREATE OR REPLACE FUNCTION record_card_status_change()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
    IF OLD.status IS DISTINCT FROM NEW.status THEN
        INSERT INTO card_status_events (card_id, old_status, new_status)
        VALUES (NEW.id, OLD.status, NEW.status);
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER cards_status_audit
AFTER UPDATE OF status ON cards
FOR EACH ROW
EXECUTE FUNCTION record_card_status_change();
