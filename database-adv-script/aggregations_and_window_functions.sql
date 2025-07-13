SELECT
  u.user_id,
  u.first_name,
  u.last_name,
  COUNT(b.booking_id) AS total_bookings
FROM User u
JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name;
SELECT
  p.property_id,
  p.name,
  AVG(r.rating) AS average_rating
FROM Property p
JOIN Review r ON p.property_id = r.property_id
WHERE r.rating > 0
GROUP BY p.property_id, p.name
HAVING AVG(r.rating) > 4.0;
