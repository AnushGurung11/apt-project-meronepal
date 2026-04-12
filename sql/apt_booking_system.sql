-- ============================================
-- APARTMENT / EVENT BOOKING SYSTEM DATABASE
-- ============================================

CREATE DATABASE IF NOT EXISTS apt_booking_system;
USE apt_booking_system;

-- Drop tables in reverse dependency order (if re-running)
DROP TABLE IF EXISTS Testimony;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Booking;
DROP TABLE IF EXISTS Package_Service;
DROP TABLE IF EXISTS Services;
DROP TABLE IF EXISTS Package;
DROP TABLE IF EXISTS User;

-- ============================================
-- 1. USER
-- ============================================
CREATE TABLE User (
    user_id            INT          PRIMARY KEY AUTO_INCREMENT,
    first_name    VARCHAR(120) NOT NULL,
    last_name     VARCHAR(120) NOT NULL,
    middle_name   VARCHAR(120),
    email         VARCHAR(255) NOT NULL UNIQUE,
    phone_number  VARCHAR(20)  NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_role     VARCHAR(50)  NOT NULL DEFAULT 'Customer'
);

-- ============================================
-- 2. PACKAGE
-- ============================================
CREATE TABLE Package (
    package_id    INT            PRIMARY KEY AUTO_INCREMENT,
    package_name  VARCHAR(100)   NOT NULL,
    description   TEXT,
    price         DECIMAL(10, 2) NOT NULL
);

-- ============================================
-- 3. SERVICES
-- ============================================
CREATE TABLE Services (
    service_id    INT          PRIMARY KEY AUTO_INCREMENT,
    service_name  VARCHAR(100) NOT NULL,
    service_type  VARCHAR(50),
    description   TEXT
);

-- ============================================
-- 4. PACKAGE_SERVICE
--    Junction table resolving M:M between
--    Package and Services
-- ============================================
CREATE TABLE Package_Service (
    package_service_id  INT PRIMARY KEY AUTO_INCREMENT,
    package_id          INT NOT NULL,
    service_id          INT NOT NULL,
    CONSTRAINT fk_ps_package FOREIGN KEY (package_id) REFERENCES Package(package_id)  ON DELETE CASCADE,
    CONSTRAINT fk_ps_service FOREIGN KEY (service_id) REFERENCES Services(service_id) ON DELETE CASCADE
);

-- ============================================
-- 5. BOOKING
--    User (1) --Makes-- (M) Booking
--    Booking (M) --Selects-- (1) Package
-- ============================================
CREATE TABLE Booking (
    booking_id   INT         PRIMARY KEY AUTO_INCREMENT,
    user_id      INT         NOT NULL,
    package_id   INT         NOT NULL,
    booking_date DATE        NOT NULL,
    pay_date     DATE,
    event_date   DATE        NOT NULL,
    status       VARCHAR(50) NOT NULL DEFAULT 'Pending',
    CONSTRAINT fk_booking_user    FOREIGN KEY (user_id)    REFERENCES User(user_id)       ON DELETE CASCADE,
    CONSTRAINT fk_booking_package FOREIGN KEY (package_id) REFERENCES Package(package_id) ON DELETE RESTRICT
);

-- ============================================
-- 6. PAYMENT
--    Booking (1) --Has-- (1) Payment
--    UNIQUE on booking_id enforces 1:1
-- ============================================
CREATE TABLE Payment (
    payment_id      INT            PRIMARY KEY AUTO_INCREMENT,
    booking_id      INT            NOT NULL UNIQUE,
    amount          DECIMAL(10, 2) NOT NULL,
    payment_method  VARCHAR(50),
    payment_status  VARCHAR(50)    NOT NULL DEFAULT 'Unpaid',
    payment_date    DATE,
    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE
);

-- ============================================
-- 7. TESTIMONY
--    Booking (1) --Gives-- (0,1) Testimony
--    UNIQUE on booking_id enforces 0 or 1
-- ============================================
CREATE TABLE Testimony (
    testimony_id   INT     PRIMARY KEY AUTO_INCREMENT,
    booking_id     INT     NOT NULL UNIQUE,
    message        TEXT,
    rating         TINYINT CHECK (rating BETWEEN 1 AND 5),
    testimony_date DATE    NOT NULL,
    CONSTRAINT fk_testimony_booking FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE
);