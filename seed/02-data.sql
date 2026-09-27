INSERT INTO riders (name, email) VALUES
    ('Alice Chen', 'alice@example.com'),
    ('Bruno Silva', 'bruno@example.com'),
    ('Carla Mendes', 'carla@example.com'),
    ('Diego Ruiz', 'diego@example.com'),
    ('Evelyn Park', 'evelyn@example.com');

INSERT INTO stations (name, zone) VALUES
    ('Harvard ', 1),
    ('Kendall/MIT', 1),
    ('Airport', 2),
    ('Forest Hills', 3),
    ('Wonderland', 3);

INSERT INTO cards (rider_id, balance, status) VALUES
    (1, 12.50, 'active'),
    (2, 0.00, 'active'),
    (3, 5.25, 'active'),
    (4, 2.00, 'blocked'),
    (5, 8.75, 'active');

INSERT INTO swipes (card_id, station_id, entered_at, exited_at, fare) VALUES
    (1, 1, '2025-03-01 08:00:00-05', '2025-03-01 08:35:00-05', 2.40),
    (1, 2, '2025-03-02 09:00:00-05', NULL, 2.40),
    (2, 2, '2025-03-02 09:30:00-05', '2025-03-02 09:50:00-05', 2.40),
    (3, 3, '2025-03-02 10:00:00-05', '2025-03-02 10:20:00-05', 2.40);
