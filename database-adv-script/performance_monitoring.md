# Database Performance Monitoring and Optimization Report

## 1. Initial Query Performance Analysis

Executed the following query with `EXPLAIN ANALYZE`:

```sql
EXPLAIN ANALYZE
SELECT b.booking_id, u.first_name, u.last_name, p.name AS property_name, pay.amount
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
AND b.start_date BETWEEN '2023-01-01' AND '2023-12-31';
