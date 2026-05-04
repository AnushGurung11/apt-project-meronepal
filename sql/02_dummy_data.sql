USE apt_booking_system;

-- ============================================================
-- DUMMY DATA FOR APT BOOKING SYSTEM
-- ============================================================

-- ============================================================
-- 1. INSERT USERS (Project Members)
-- ============================================================
INSERT INTO User (user_name, email, phone_number, password, user_role) VALUES
('Anush Gurung', 'anush.gurung@gmail.com', '9841234567', 'pass123', 'Admin'),
('Krish Shrestha', 'krish.shrestha@gmail.com', '9842234567', 'pass123', 'Admin'),
('Darshan Regmi', 'darshan.regmi@gmail.com', '9843234567', 'pass123', 'Admin'),
('Bijey Khanal', 'bijey.khanal@gmail.com', '9844234567', 'pass123', 'Customer'),
('Arjun Bastola', 'arjun.bastola@gmail.com', '9845234567', 'pass123', 'Customer'),
('Sudip Gautam', 'sudip.gautam@gmail.com', '9846234567', 'pass123', 'Customer');

-- ============================================================
-- 2. INSERT SERVICES (Multimedia Services)
-- ============================================================
INSERT INTO Services (service_name, service_type, description, is_active) VALUES
('Professional Photography', 'Media', 'High-quality still photography for events', TRUE),
('Cinematography', 'Media', 'Professional video recording and cinematography', TRUE),
('Video Editing', 'Media', 'Post-production video editing and color grading', TRUE),
('Drone Footage', 'Media', 'Aerial drone photography and videography', TRUE),
('Lighting Design', 'Technical', 'Professional lighting setup and management', TRUE),
('Sound System & Recording', 'Technical', 'Audio recording, mixing, and speaker setup', TRUE),
('Decoration', 'Design', 'Event decoration and stage setup', TRUE),
('Catering', 'Food', 'Food and beverage service for events', TRUE),
('Graphic Design', 'Design', 'Custom graphics, animations, and visual effects', TRUE),
('Live Streaming', 'Technical', 'Live event streaming on social media platforms', TRUE);

-- ============================================================
-- 3. INSERT PACKAGES
-- ============================================================
INSERT INTO Package (package_name, description, price, is_active) VALUES
('Birthday Basic', 'Basic photography and simple video coverage for birthdays', 15000.00, TRUE),
('Birthday Premium', 'Professional photography, cinematography, and editing for birthdays', 35000.00, TRUE),
('Wedding Classic', 'Full day photography and highlight video for weddings', 50000.00, TRUE),
('Wedding Premium', 'Professional 2-camera cinematography, drone footage, and 4K editing', 100000.00, TRUE),
('Wedding Platinum', 'Complete multimedia coverage with live streaming and cinematic editing', 150000.00, TRUE),
('Corporate Event', 'Photography, video coverage, and live streaming for corporate events', 40000.00, TRUE),
('Engagement Party', 'Photography and videography for engagement celebrations', 25000.00, TRUE),
('Anniversary Special', 'Couple portrait session and highlight video creation', 20000.00, TRUE),
('Concert/Music Event', 'Multi-camera coverage, professional audio, and live streaming', 80000.00, TRUE),
('Festival/Community Event', 'Comprehensive media coverage with drone and multiple cameras', 60000.00, TRUE);

-- ============================================================
-- 4. INSERT PACKAGE_SERVICE (Link Packages to Services)
-- ============================================================
-- Birthday Basic: Photography, Video Editing, Decoration
INSERT INTO Package_Service (package_id, service_id) VALUES
(1, 1),  -- Birthday Basic → Professional Photography
(1, 3),  -- Birthday Basic → Video Editing
(1, 7);  -- Birthday Basic → Decoration

-- Birthday Premium: Photography, Cinematography, Video Editing, Lighting Design, Graphic Design
INSERT INTO Package_Service (package_id, service_id) VALUES
(2, 1),  -- Birthday Premium → Professional Photography
(2, 2),  -- Birthday Premium → Cinematography
(2, 3),  -- Birthday Premium → Video Editing
(2, 5),  -- Birthday Premium → Lighting Design
(2, 9);  -- Birthday Premium → Graphic Design

-- Wedding Classic: Photography, Cinematography, Video Editing, Lighting Design
INSERT INTO Package_Service (package_id, service_id) VALUES
(3, 1),  -- Wedding Classic → Professional Photography
(3, 2),  -- Wedding Classic → Cinematography
(3, 3),  -- Wedding Classic → Video Editing
(3, 5);  -- Wedding Classic → Lighting Design

-- Wedding Premium: Photography, Cinematography, Drone, Video Editing, Lighting, Sound
INSERT INTO Package_Service (package_id, service_id) VALUES
(4, 1),  -- Wedding Premium → Professional Photography
(4, 2),  -- Wedding Premium → Cinematography
(4, 4),  -- Wedding Premium → Drone Footage
(4, 3),  -- Wedding Premium → Video Editing
(4, 5),  -- Wedding Premium → Lighting Design
(4, 6);  -- Wedding Premium → Sound System

-- Wedding Platinum: All services
INSERT INTO Package_Service (package_id, service_id) VALUES
(5, 1),  -- Wedding Platinum → Professional Photography
(5, 2),  -- Wedding Platinum → Cinematography
(5, 4),  -- Wedding Platinum → Drone Footage
(5, 3),  -- Wedding Platinum → Video Editing
(5, 5),  -- Wedding Platinum → Lighting Design
(5, 6),  -- Wedding Platinum → Sound System
(5, 10); -- Wedding Platinum → Live Streaming

-- Corporate Event: Photography, Video, Lighting, Sound, Live Streaming
INSERT INTO Package_Service (package_id, service_id) VALUES
(6, 1),  -- Corporate Event → Professional Photography
(6, 2),  -- Corporate Event → Cinematography
(6, 5),  -- Corporate Event → Lighting Design
(6, 6),  -- Corporate Event → Sound System
(6, 10); -- Corporate Event → Live Streaming

-- Engagement Party: Photography, Cinematography, Video Editing, Decoration
INSERT INTO Package_Service (package_id, service_id) VALUES
(7, 1),  -- Engagement Party → Professional Photography
(7, 2),  -- Engagement Party → Cinematography
(7, 3),  -- Engagement Party → Video Editing
(7, 7);  -- Engagement Party → Decoration

-- Anniversary Special: Photography, Cinematography, Video Editing
INSERT INTO Package_Service (package_id, service_id) VALUES
(8, 1),  -- Anniversary Special → Professional Photography
(8, 2),  -- Anniversary Special → Cinematography
(8, 3);  -- Anniversary Special → Video Editing

-- Concert/Music Event: Cinematography, Sound System, Live Streaming, Drone
INSERT INTO Package_Service (package_id, service_id) VALUES
(9, 2),  -- Concert → Cinematography
(9, 6),  -- Concert → Sound System
(9, 10), -- Concert → Live Streaming
(9, 4);  -- Concert → Drone Footage

-- Festival/Community Event: Photography, Cinematography, Drone, Lighting, Live Streaming
INSERT INTO Package_Service (package_id, service_id) VALUES
(10, 1), -- Festival → Professional Photography
(10, 2), -- Festival → Cinematography
(10, 4), -- Festival → Drone Footage
(10, 5), -- Festival → Lighting Design
(10, 10);-- Festival → Live Streaming

-- ============================================================
-- 5. INSERT BOOKINGS (At least 10)
-- ============================================================
INSERT INTO Booking (user_id, package_id, booking_date, event_date, event_address, notes, status) VALUES
(4, 1, '2026-04-01', '2026-05-15', 'Kathmandu, Nepal', 'Birthday celebration for 30 guests', 'Confirmed'),
(5, 2, '2026-04-05', '2026-06-20', 'Pokhara, Nepal', 'Birthday party with special effects', 'Confirmed'),
(6, 3, '2026-03-10', '2026-07-10', 'Bhaktapur, Nepal', 'Wedding ceremony and reception', 'Confirmed'),
(4, 4, '2026-02-28', '2026-08-05', 'Kathmandu Convention Center', 'Grand wedding with 500+ guests', 'Pending'),
(5, 5, '2026-03-15', '2026-09-20', 'Dhulikhel, Nepal', 'Premium wedding package with all services', 'Pending'),
(6, 6, '2026-04-10', '2026-06-10', 'TU Convention Center', 'Corporate annual meeting and awards', 'Confirmed'),
(4, 7, '2026-04-20', '2026-05-25', 'Thamel, Kathmandu', 'Engagement party for 100 guests', 'Confirmed'),
(5, 8, '2026-03-20', '2026-05-30', 'Panauti, Nepal', 'Wedding anniversary celebration', 'Confirmed'),
(6, 9, '2026-04-15', '2026-07-15', 'Kathmandu Jazz Bar', 'Live music concert and recording', 'Pending'),
(4, 10, '2026-05-01', '2026-08-10', 'Tundikhel, Kathmandu', 'Community festival with multiple events', 'Pending'),
(5, 1, '2026-05-10', '2026-06-05', 'Lalitpur, Nepal', 'Kid birthday party', 'Confirmed'),
(6, 3, '2026-05-15', '2026-10-15', 'Gorkha, Nepal', 'Village wedding ceremony', 'Pending');

-- ============================================================
-- 6. INSERT PAYMENTS (For confirmed bookings)
-- ============================================================
INSERT INTO Payment (booking_id, amount, payment_method, payment_status, payment_date) VALUES
(1, 15000.00, 'Bank Transfer', 'Paid', '2026-04-05'),
(2, 35000.00, 'Card', 'Paid', '2026-04-10'),
(3, 50000.00, 'Bank Transfer', 'Partial', '2026-04-15'),
(6, 40000.00, 'Card', 'Paid', '2026-04-20'),
(7, 25000.00, 'Cash', 'Paid', '2026-05-01'),
(8, 20000.00, 'Bank Transfer', 'Paid', '2026-04-01'),
(11, 15000.00, 'Card', 'Paid', '2026-05-20');

-- ============================================================
-- NOTES:
-- - User IDs 1-3 are Admin (project members)
-- - User IDs 4-6 are Customers (project members)
-- - Services cover all multimedia needs
-- - Packages bundled with appropriate services
-- - 12 bookings with mixed status
-- - Payments for confirmed/partial bookings only
-- ============================================================