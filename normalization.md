# Airbnb Database Normalization to 3NF

## 🎯 Objective
To ensure our Airbnb database schema adheres to **Third Normal Form (3NF)** by eliminating data redundancy, ensuring data integrity, and improving maintainability.

---

## 🧠 Normalization Recap

### First Normal Form (1NF)
- Each column contains atomic (indivisible) values.
- Each record is unique.

### Second Normal Form (2NF)
- Satisfies 1NF.
- All non-key attributes are **fully functionally dependent** on the **entire primary key**.

### Third Normal Form (3NF)
- Satisfies 2NF.
- No **transitive dependencies** — i.e., non-key attributes do not depend on other non-key attributes.

---

## 🔎 Original Schema Issues (Hypothetical)

### Table: `bookings`
| id | user_id | property_id | start_date | end_date | user_name | user_email |
|----|---------|-------------|------------|----------|-----------|------------|

- 🔴 **Violation**: `user_name` and `user_email` are dependent on `user_id`, not on the full `bookings` record.
- 🛠 **Fix**: Remove `user_name`, `user_email` from `bookings` and keep them only in `users`.

---

## ✅ Revised Tables (Normalized to 3NF)

### 1. `users`
| id (PK) | name     | email             |
|---------|----------|-------------------|
| 1       | Alice    | alice@email.com   |

### 2. `properties`
| id (PK) | name           | host_id (FK) |
|---------|----------------|--------------|
| 101     | Cozy Cottage   | 1            |

### 3. `bookings`
| id (PK) | user_id (FK) | property_id (FK) | start_date | end_date |
|---------|--------------|------------------|------------|----------|
| 201     | 1            | 101              | 2024-05-01 | 2024-05-05 |

### 4. `reviews`
| id (PK) | user_id (FK) | property_id (FK) | rating | comment |
|---------|--------------|------------------|--------|---------|
| 301     | 1            | 101              | 5      | Great!  |

---

## 🧹 Summary of Normalization Steps

| Step | Action |
|------|--------|
| 1NF  | Ensured all fields are atomic. No lists or composite values. |
| 2NF  | Moved partial dependencies (e.g., user data out of `bookings`). |
| 3NF  | Removed transitive dependencies (e.g., no `user_name` in `bookings`, only in `users`). |

---

## ✅ Benefits Achieved
- ✅ Reduced data redundancy
- ✅ Improved consistency and integrity
- ✅ Easier updates and maintenance
- ✅ Logical schema design for scalability

---

