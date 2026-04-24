-- ============================================================
-- FILE 1: DATABASE CREATION & SCHEMA
-- Apartment / Event Booking System
-- ============================================================
-- SIMPLIFIED FLOW:
--   Admin pre-creates Services, Packages, and Package_Service
--   User browses Packages (with bundled Services) → Books one
--   Payment is recorded → Testimony left after event
-- ============================================================

CREATE DATABASE IF NOT EXISTS apt_booking_system;
USE apt_booking_system;

-- Drop tables in reverse dependency order
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Booking;
DROP TABLE IF EXISTS Package_Service;
DROP TABLE IF EXISTS Services;
DROP TABLE IF EXISTS Package;
DROP TABLE IF EXISTS User;

-- ============================================================
-- 1. USER
--    Stores both Customers and Admins (via user_role)
-- ============================================================
CREATE TABLE User (
    user_id       INT          PRIMARY KEY AUTO_INCREMENT,
    first_name    VARCHAR(120) NOT NULL,
    last_name     VARCHAR(120) NOT NULL,
    middle_name   VARCHAR(120),
    email         VARCHAR(255) NOT NULL UNIQUE,
    phone_number  VARCHAR(20)  NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_role     VARCHAR(50)  NOT NULL DEFAULT 'Customer'
                  CHECK (user_role IN ('Customer', 'Admin'))
);

-- ============================================================
-- 2. PACKAGE
--    Pre-defined event packages created by Admin.
--    Examples: "Birthday Basic", "Wedding Gold", etc.
--    Price is fixed per package.
-- ============================================================
CREATE TABLE Package (
    package_id    INT            PRIMARY KEY AUTO_INCREMENT,
    package_name  VARCHAR(100)   NOT NULL,
    description   TEXT,
    price         DECIMAL(10, 2) NOT NULL,
    is_active     TINYINT(1)     NOT NULL DEFAULT 1
);

-- ============================================================
-- 3. SERVICES
--    Individual services Admin can offer.
--    Examples: Photography, Videography, Decoration, Catering
-- ============================================================
CREATE TABLE Services (
    service_id    INT          PRIMARY KEY AUTO_INCREMENT,
    service_name  VARCHAR(100) NOT NULL,
    service_type  VARCHAR(50),                        -- e.g. 'Media', 'Venue', 'Food'
    description   TEXT,
    is_active     BOOLEAN  NOT NULL DEFAULT TRUE
);

-- ============================================================
-- 4. PACKAGE_SERVICE
--    Junction table: which Services are included in a Package
--    Admin configures this once; users simply see the bundle.
-- ============================================================
CREATE TABLE Package_Service (
    package_service_id INT PRIMARY KEY AUTO_INCREMENT,
    package_id         INT NOT NULL,
    service_id         INT NOT NULL,
    UNIQUE KEY uq_pkg_svc (package_id, service_id),   -- no duplicate links
    CONSTRAINT fk_ps_package FOREIGN KEY (package_id)
        REFERENCES Package(package_id) ON DELETE CASCADE,
    CONSTRAINT fk_ps_service FOREIGN KEY (service_id)
        REFERENCES Services(service_id) ON DELETE CASCADE
);

-- ============================================================
-- 5. BOOKING
--    A User selects one Package and submits a Booking.
--    status lifecycle: Pending → Confirmed → Completed / Cancelled
-- ============================================================
CREATE TABLE Booking (
    booking_id    INT         PRIMARY KEY AUTO_INCREMENT,
    user_id       INT         NOT NULL,
    package_id    INT         NOT NULL,
    booking_date  DATE        NOT NULL DEFAULT (CURRENT_DATE),
    event_date    DATE        NOT NULL,
    event_address VARCHAR(255),                        -- where the event is held
    notes         TEXT,                               -- any special requests
    status        VARCHAR(50) NOT NULL DEFAULT 'Pending'
                  CHECK (status IN ('Pending', 'Confirmed', 'Completed', 'Cancelled')),
    CONSTRAINT fk_booking_user    FOREIGN KEY (user_id)
        REFERENCES User(user_id)       ON DELETE CASCADE,
    CONSTRAINT fk_booking_package FOREIGN KEY (package_id)
        REFERENCES Package(package_id) ON DELETE RESTRICT
);

-- ============================================================
-- 6. PAYMENT
--    One payment record per booking (enforced by UNIQUE).
--    payment_status: Unpaid → Partial → Paid → Refunded
-- ============================================================
CREATE TABLE Payment (
    payment_id      INT            PRIMARY KEY AUTO_INCREMENT,
    booking_id      INT            NOT NULL UNIQUE,
    amount          DECIMAL(10, 2) NOT NULL,
    payment_method  VARCHAR(50)
                    CHECK (payment_method IN ('Cash', 'Card', 'Bank Transfer', 'Online')),
    payment_status  VARCHAR(50)    NOT NULL DEFAULT 'Unpaid'
                    CHECK (payment_status IN ('Unpaid', 'Partial', 'Paid', 'Refunded')),
    payment_date    DATE,
    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id)
        REFERENCES Booking(booking_id) ON DELETE CASCADE
);

<<<<<<< HEAD
=======
-- ============================================================
-- 7. TESTIMONY
--    A customer may leave one review per booking after the event.
--    UNIQUE on booking_id allows at most one testimony per booking.
-- ============================================================
CREATE TABLE Testimony (
    testimony_id   INT     PRIMARY KEY AUTO_INCREMENT,
    booking_id     INT     NOT NULL UNIQUE,
    message        TEXT,
    rating         TINYINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    testimony_date DATE    NOT NULL DEFAULT (CURRENT_DATE),
    CONSTRAINT fk_testimony_booking FOREIGN KEY (booking_id)
        REFERENCES Booking(booking_id) ON DELETE CASCADE
);

ALTER TABLE User
    DROP COLUMN first_name,
    DROP COLUMN last_name,
    DROP COLUMN middle_name,
    ADD COLUMN user_name VARCHAR(255) NOT NULL AFTER user_id;


>>>>>>> 74ab3db (Filter and minor fixing of session and cookies)
