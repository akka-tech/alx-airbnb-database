SELECT *
FROM Property
WHERE property_id IN (
    SELECT property_id
    FROM Review
    WHERE rating > 4.0
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

