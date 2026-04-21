-- ============================================================
-- FILE 3: OPERATIONS / QUERY REFERENCE
-- Apartment / Event Booking System
-- ============================================================
-- Covers all common SELECT, INSERT, UPDATE, DELETE operations
-- organized by table and use-case scenario.
-- ============================================================

USE apt_booking_system;


-- ============================================================
-- ██  USER OPERATIONS
-- ============================================================

-- [SELECT] Get all customers
SELECT user_id, first_name, last_name, email, phone_number, created_at
FROM User
WHERE user_role = 'Customer'
ORDER BY created_at DESC;

-- [SELECT] Get a single user by email (login lookup)
SELECT user_id, first_name, last_name, email, password_hash, user_role
FROM User
WHERE email = 'riya.sharma@gmail.com';

-- [SELECT] Get a single user by ID
SELECT * FROM User WHERE user_id = 2;

-- [INSERT] Register a new customer
INSERT INTO User (first_name, last_name, middle_name, email, phone_number, password_hash, user_role)
VALUES ('Sita', 'Pandey', NULL, 'sita.pandey@gmail.com', '9800000099', '$2b$12$newHashHere', 'Customer');

-- [UPDATE] Update user phone number
UPDATE User
SET phone_number = '9811111111'
WHERE user_id = 2;

-- [UPDATE] Update user email
UPDATE User
SET email = 'riya.new@gmail.com'
WHERE user_id = 2;

-- [UPDATE] Change user role to Admin
UPDATE User
SET user_role = 'Admin'
WHERE user_id = 2;

-- [DELETE] Delete a user account (cascades to their Bookings/Payments/Testimonies)
DELETE FROM User WHERE user_id = 7;


-- ============================================================
-- ██  SERVICES OPERATIONS
-- ============================================================

-- [SELECT] List all active services
SELECT service_id, service_name, service_type, description
FROM Services
WHERE is_active = 1
ORDER BY service_type, service_name;

-- [SELECT] Get services by type
SELECT * FROM Services WHERE service_type = 'Media' AND is_active = 1;

-- [INSERT] Add a new service
INSERT INTO Services (service_name, service_type, description)
VALUES ('Live Streaming', 'Media', 'Real-time streaming of event to online guests');

-- [UPDATE] Update service description
UPDATE Services
SET description = 'Professional photography with same-day preview album'
WHERE service_id = 1;

-- [UPDATE] Deactivate a service (soft delete)
UPDATE Services SET is_active = 0 WHERE service_id = 8;

-- [DELETE] Hard delete a service (cascades through Package_Service)
DELETE FROM Services WHERE service_id = 8;


-- ============================================================
-- ██  PACKAGE OPERATIONS
-- ============================================================

-- [SELECT] List all active packages
SELECT package_id, package_name, description, price
FROM Package
WHERE is_active = 1
ORDER BY price ASC;

-- [SELECT] Get one package by ID
SELECT * FROM Package WHERE package_id = 4;

-- [SELECT] Package with its list of included services (for package detail page)
SELECT
    p.package_id,
    p.package_name,
    p.description,
    p.price,
    s.service_name,
    s.service_type
FROM Package p
JOIN Package_Service ps ON p.package_id = ps.package_id
JOIN Services         s  ON ps.service_id = s.service_id
WHERE p.package_id = 2
ORDER BY s.service_type;

-- [SELECT] All packages with their services (for listing/browse page)
SELECT
    p.package_id,
    p.package_name,
    p.price,
    GROUP_CONCAT(s.service_name ORDER BY s.service_name SEPARATOR ', ') AS included_services
FROM Package p
JOIN Package_Service ps ON p.package_id = ps.package_id
JOIN Services         s  ON ps.service_id = s.service_id
WHERE p.is_active = 1
GROUP BY p.package_id, p.package_name, p.price
ORDER BY p.price;

-- [INSERT] Create a new package
INSERT INTO Package (package_name, description, price)
VALUES ('Anniversary Special', 'Romantic anniversary coverage with photography and decoration.', 25000.00);

-- [UPDATE] Update package price
UPDATE Package SET price = 18000.00 WHERE package_id = 1;

-- [UPDATE] Deactivate a package (hide from users, preserve booking history)
UPDATE Package SET is_active = 0 WHERE package_id = 1;

-- [DELETE] Hard delete a package (only if no bookings reference it — FK RESTRICT protects this)
DELETE FROM Package WHERE package_id = 6;


-- ============================================================
-- ██  PACKAGE_SERVICE OPERATIONS (Admin: bundle management)
-- ============================================================

-- [SELECT] See all service bundles for every package
SELECT
    p.package_name,
    s.service_name,
    s.service_type
FROM Package_Service ps
JOIN Package  p ON ps.package_id = p.package_id
JOIN Services s ON ps.service_id = s.service_id
ORDER BY p.package_name, s.service_type;

-- [SELECT] Which packages include a specific service?
SELECT p.package_name, p.price
FROM Package_Service ps
JOIN Package p ON ps.package_id = p.package_id
WHERE ps.service_id = 1;   -- e.g. Photography

-- [INSERT] Add a service to an existing package
INSERT INTO Package_Service (package_id, service_id) VALUES (1, 6);  -- Add DJ to Birthday Basic

-- [DELETE] Remove a service from a package
DELETE FROM Package_Service
WHERE package_id = 1 AND service_id = 6;


-- ============================================================
-- ██  BOOKING OPERATIONS
-- ============================================================

-- [SELECT] All bookings with customer and package info
SELECT
    b.booking_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    u.email,
    p.package_name,
    p.price         AS package_price,
    b.booking_date,
    b.event_date,
    b.event_address,
    b.notes,
    b.status
FROM Booking b
JOIN User    u ON b.user_id    = u.user_id
JOIN Package p ON b.package_id = p.package_id
ORDER BY b.event_date DESC;

-- [SELECT] All bookings for a specific user
SELECT
    b.booking_id,
    p.package_name,
    p.price,
    b.event_date,
    b.status
FROM Booking b
JOIN Package p ON b.package_id = p.package_id
WHERE b.user_id = 2
ORDER BY b.event_date DESC;

-- [SELECT] Bookings by status
SELECT * FROM Booking WHERE status = 'Pending';
SELECT * FROM Booking WHERE status = 'Confirmed';
SELECT * FROM Booking WHERE status = 'Completed';

-- [SELECT] Full booking details: customer + package + services + payment
SELECT
    b.booking_id,
    CONCAT(u.first_name, ' ', u.last_name)          AS customer,
    u.phone_number,
    p.package_name,
    GROUP_CONCAT(s.service_name SEPARATOR ', ')      AS services_included,
    p.price                                          AS package_price,
    b.event_date,
    b.event_address,
    b.status,
    pay.payment_status,
    pay.amount                                       AS amount_paid
FROM Booking b
JOIN User          u   ON b.user_id    = u.user_id
JOIN Package       p   ON b.package_id = p.package_id
JOIN Package_Service ps ON p.package_id = ps.package_id
JOIN Services      s   ON ps.service_id = s.service_id
LEFT JOIN Payment  pay ON b.booking_id  = pay.booking_id
WHERE b.booking_id = 3
GROUP BY
    b.booking_id, customer, u.phone_number, p.package_name,
    p.price, b.event_date, b.event_address, b.status,
    pay.payment_status, pay.amount;

-- [INSERT] Create a new booking (user selects a package)
INSERT INTO Booking (user_id, package_id, booking_date, event_date, event_address, notes, status)
VALUES (6, 3, CURDATE(), '2025-12-25', 'Kathmandu, Nepal', 'Christmas wedding theme please.', 'Pending');

-- [UPDATE] Confirm a booking (Admin action)
UPDATE Booking SET status = 'Confirmed' WHERE booking_id = 6;

-- [UPDATE] Mark booking as Completed (after event)
UPDATE Booking SET status = 'Completed' WHERE booking_id = 6;

-- [UPDATE] Cancel a booking
UPDATE Booking SET status = 'Cancelled' WHERE booking_id = 7;

-- [UPDATE] Update event address or notes
UPDATE Booking
SET event_address = 'Bhaktapur Durbar Square', notes = 'Updated venue, rest same.'
WHERE booking_id = 4;

-- [DELETE] Delete a booking (cascades to Payment and Testimony)
DELETE FROM Booking WHERE booking_id = 7;


-- ============================================================
-- ██  PAYMENT OPERATIONS
-- ============================================================

-- [SELECT] All payments with booking and customer info
SELECT
    pay.payment_id,
    b.booking_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer,
    p.package_name,
    p.price         AS package_price,
    pay.amount      AS paid_amount,
    pay.payment_method,
    pay.payment_status,
    pay.payment_date
FROM Payment pay
JOIN Booking  b ON pay.booking_id = b.booking_id
JOIN User     u ON b.user_id      = u.user_id
JOIN Package  p ON b.package_id   = p.package_id
ORDER BY pay.payment_date DESC;

-- [SELECT] All unpaid bookings
SELECT
    b.booking_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer,
    p.package_name,
    p.price,
    pay.payment_status
FROM Payment pay
JOIN Booking b ON pay.booking_id = b.booking_id
JOIN User    u ON b.user_id      = u.user_id
JOIN Package p ON b.package_id   = p.package_id
WHERE pay.payment_status IN ('Unpaid', 'Partial');

-- [SELECT] Revenue summary
SELECT
    SUM(pay.amount)                                          AS total_revenue,
    COUNT(CASE WHEN pay.payment_status = 'Paid'    THEN 1 END) AS fully_paid,
    COUNT(CASE WHEN pay.payment_status = 'Partial' THEN 1 END) AS partial_paid,
    COUNT(CASE WHEN pay.payment_status = 'Unpaid'  THEN 1 END) AS unpaid
FROM Payment pay;

-- [INSERT] Create a payment record when booking is made
INSERT INTO Payment (booking_id, amount, payment_method, payment_status, payment_date)
VALUES (7, 15000.00, 'Online', 'Paid', CURDATE());

-- [UPDATE] Mark payment as Paid (full payment received)
UPDATE Payment
SET payment_status = 'Paid',
    amount         = 150000.00,
    payment_method = 'Bank Transfer',
    payment_date   = CURDATE()
WHERE booking_id = 4;

-- [UPDATE] Mark a payment as Refunded (on cancellation)
UPDATE Payment
SET payment_status = 'Refunded'
WHERE booking_id = 7;

-- [DELETE] Remove a payment record (rare; usually update status instead)
DELETE FROM Payment WHERE booking_id = 7;


-- ============================================================
-- ██  DASHBOARD / REPORTING QUERIES (Admin)
-- ============================================================

-- [REPORT] Monthly booking count
SELECT
    DATE_FORMAT(b.booking_date, '%Y-%m') AS month,
    COUNT(*)                              AS total_bookings,
    SUM(pay.amount)                       AS revenue_collected
FROM Booking  b
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
GROUP BY month
ORDER BY month DESC;

-- [REPORT] Most popular packages
SELECT
    p.package_name,
    COUNT(b.booking_id) AS total_bookings
FROM Booking  b
JOIN Package  p ON b.package_id = p.package_id
GROUP BY p.package_id, p.package_name
ORDER BY total_bookings DESC;

-- [REPORT] Upcoming confirmed events
SELECT
    b.booking_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer,
    u.phone_number,
    p.package_name,
    b.event_date,
    b.event_address
FROM Booking b
JOIN User    u ON b.user_id    = u.user_id
JOIN Package p ON b.package_id = p.package_id
WHERE b.status    = 'Confirmed'
  AND b.event_date >= CURDATE()
ORDER BY b.event_date ASC;

-- [REPORT] Customers who have booked more than once
SELECT
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer,
    u.email,
    COUNT(b.booking_id)                     AS total_bookings
FROM Booking b
JOIN User u ON b.user_id = u.user_id
GROUP BY u.user_id, u.first_name, u.last_name, u.email
HAVING total_bookings > 1
ORDER BY total_bookings DESC;

-- [REPORT] Completed bookings without a testimony (follow-up reminders)
SELECT
    b.booking_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer,
    u.email,
    p.package_name,
    b.event_date
FROM Booking b
JOIN User    u  ON b.user_id    = u.user_id
JOIN Package p  ON b.package_id = p.package_id
LEFT JOIN Testimony t ON b.booking_id = t.booking_id
WHERE b.status = 'Completed'
  AND t.testimony_id IS NULL;
