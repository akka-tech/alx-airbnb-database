SELECT u.*
FROM User u
JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id
HAVING COUNT(b.booking_id) > 3;
