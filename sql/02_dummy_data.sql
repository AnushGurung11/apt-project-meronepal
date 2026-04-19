-- ============================================================
-- FILE 2: DUMMY / SEED DATA
-- Apartment / Event Booking System
-- ============================================================
-- Run AFTER 01_create_database.sql
-- ============================================================

USE apt_booking_system;

-- ============================================================
-- USERS  (1 Admin + 6 Customers)
-- password_hash is a bcrypt placeholder (not real hashes)
-- ============================================================
INSERT INTO User (first_name, last_name, middle_name, email, phone_number, password, user_role) VALUES
('Admin',    'System',   NULL,      'admin@aptbooking.com',   '9800000001', 'admin', 'Admin'),
('Riya',     'Sharma',   'Priya',   'riya.sharma@gmail.com',  '9800000002', '1', 'Customer'),
('Arjun',    'Bastola',    NULL,      'arjun.bastola@gmail.com',  '9800000003', '2', 'Customer'),
('Sunita',   'Karki',    'Maya',    'sunita.karki@gmail.com', '9800000004', '2', 'Customer'),
('Bikash',   'Gurung',   NULL,      'bikash.gurung@gmail.com','9800000005', '$2b$12$hashPlaceholder00000005', 'Customer'),
('Anjali',   'Rai',      'Kumari',  'anjali.rai@gmail.com',   '9800000006', '$2b$12$hashPlaceholder00000006', 'Customer'),
('Dipesh',   'Shrestha', NULL,      'dipesh.sth@gmail.com',   '9800000007', '$2b$12$hashPlaceholder00000007', 'Customer');

-- ============================================================
-- SERVICES
-- ============================================================
INSERT INTO Services (service_name, service_type, description) VALUES
('Photography',     'Media',   'Professional photo coverage of your event'),
('Videography',     'Media',   'HD video recording with highlights reel'),
('Cinematography',  'Media',   'Cinematic film-style full event coverage');
--('Decoration',      'Venue',   'Full venue decoration including flowers and lights'),
--('Catering',        'Food',    'Buffet catering with diverse menu options'),
--('DJ & Music',      'Entertainment', 'Live DJ with sound system and lighting'),
--('MC / Host',       'Entertainment', 'Professional master of ceremonies'),
--('Cake & Desserts', 'Food',    'Custom cake design and dessert table');

-- ============================================================
-- PACKAGES  (Pre-defined by Admin)
-- ============================================================
INSERT INTO Package (package_name, description, price) VALUES
('Birthday Basic',
 'A simple birthday celebration package with essential media and decoration.',
 15000.00),

('Birthday Premium',
 'Full birthday experience with media, decoration, catering, DJ and cake.',
 35000.00),

('Wedding Classic',
 'Elegant wedding package covering media, decoration, and catering.',
 80000.00),

('Wedding Luxury',
 'All-inclusive luxury wedding with full media team, decoration, catering, DJ and MC.',
 150000.00),

('Corporate Event',
 'Professional corporate event package with media, MC and catering.',
 50000.00);

-- ============================================================
-- PACKAGE_SERVICE  (Which services are in each package)
-- ============================================================
--  pkg 1 = Birthday Basic   → Photography, Decoration
--  pkg 2 = Birthday Premium → Photography, Videography, Decoration, Catering, DJ, Cake
--  pkg 3 = Wedding Classic  → Photography, Videography, Decoration, Catering
--  pkg 4 = Wedding Luxury   → ALL services
--  pkg 5 = Corporate        → Photography, Videography, Catering, MC

INSERT INTO Package_Service (package_id, service_id) VALUES
-- Birthday Basic (pkg 1)
(1, 1),   -- Photography
(1, 4),   -- Decoration

-- Birthday Premium (pkg 2)
(2, 1),   -- Photography
(2, 2),   -- Videography
(2, 4),   -- Decoration
(2, 5),   -- Catering
(2, 6),   -- DJ & Music
(2, 8),   -- Cake & Desserts

-- Wedding Classic (pkg 3)
(3, 1),   -- Photography
(3, 2),   -- Videography
(3, 4),   -- Decoration
(3, 5),   -- Catering

-- Wedding Luxury (pkg 4)
(4, 1),   -- Photography
(4, 2),   -- Videography
(4, 3),   -- Cinematography
(4, 4),   -- Decoration
(4, 5),   -- Catering
(4, 6),   -- DJ & Music
(4, 7),   -- MC / Host
(4, 8),   -- Cake & Desserts

-- Corporate Event (pkg 5)
(5, 1),   -- Photography
(5, 2),   -- Videography
(5, 5),   -- Catering
(5, 7);   -- MC / Host

-- ============================================================
-- BOOKINGS
-- ============================================================
INSERT INTO Booking (user_id, package_id, booking_date, event_date, event_address, notes, status) VALUES
(2, 1, '2025-01-10', '2025-02-15', 'Lalitpur, Nepal',       'My daughter turns 5, keep it fun!',          'Completed'),
(3, 3, '2025-02-01', '2025-03-20', 'Kathmandu, Nepal',      'Traditional ceremony preferred.',             'Completed'),
(4, 2, '2025-03-05', '2025-04-10', 'Bhaktapur, Nepal',      NULL,                                          'Completed'),
(5, 4, '2025-04-12', '2025-06-01', 'Pokhara, Nepal',        'Grand wedding, spare no detail.',             'Confirmed'),
(6, 5, '2025-05-01', '2025-05-20', 'Kathmandu Convention',  'Annual company meetup, 200 guests.',          'Confirmed'),
(7, 1, '2025-06-10', '2025-07-04', 'Patan, Nepal',          'Small family birthday gathering.',            'Pending'),
(2, 2, '2025-07-01', '2025-08-12', 'Lalitpur, Nepal',       'Second child birthday, same quality please.', 'Pending');

-- ============================================================
-- PAYMENTS
-- ============================================================
INSERT INTO Payment (booking_id, amount, payment_method, payment_status, payment_date) VALUES
(1, 15000.00, 'Cash',          'Paid',    '2025-01-10'),
(2, 80000.00, 'Bank Transfer', 'Paid',    '2025-02-01'),
(3, 35000.00, 'Online',        'Paid',    '2025-03-05'),
(4, 75000.00, 'Bank Transfer', 'Partial', '2025-04-12'),   -- 50% advance on luxury pkg
(5, 50000.00, 'Card',          'Paid',    '2025-05-01'),
(6, 0.00,     NULL,            'Unpaid',  NULL),
(7, 0.00,     NULL,            'Unpaid',  NULL);

-- ============================================================
-- TESTIMONIES  (only Completed bookings can leave reviews)
-- ============================================================
INSERT INTO Testimony (booking_id, message, rating, testimony_date) VALUES
(1, 'Amazing decoration and great photography! My daughter loved every moment.',     5, '2025-02-20'),
(2, 'The team was professional and the photos are stunning. Highly recommend!',      5, '2025-03-25'),
(3, 'Good overall. Catering could have had more variety but media team was great.',  4, '2025-04-15');
