SELECT c.id, COALESCE(SUM(s.fare), 0) AS total_fare
FROM cards AS c
JOIN swipes AS s ON s.card_id = c.id
GROUP BY c.id
ORDER BY c.id;
