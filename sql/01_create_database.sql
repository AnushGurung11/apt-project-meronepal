-- Drop existing database
DROP DATABASE IF EXISTS apt_booking_system;

-- Create fresh database
CREATE DATABASE apt_booking_system;
USE apt_booking_system;

-- ============================================================
-- 1. USER
-- ============================================================
CREATE TABLE User (
    user_id       INT          PRIMARY KEY AUTO_INCREMENT,
    user_name     VARCHAR(255) NOT NULL,
    email         VARCHAR(255) NOT NULL UNIQUE,
    phone_number  VARCHAR(20)  NOT NULL,
    password      VARCHAR(255) NOT NULL,
    created_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_role     VARCHAR(50)  NOT NULL DEFAULT 'Customer'
                  CHECK (user_role IN ('Customer', 'Admin'))
);

-- ============================================================
-- 2. PACKAGE
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
-- ============================================================
CREATE TABLE Services (
    service_id    INT          PRIMARY KEY AUTO_INCREMENT,
    service_name  VARCHAR(100) NOT NULL,
    service_type  VARCHAR(50),
    description   TEXT,
    is_active     BOOLEAN      NOT NULL DEFAULT TRUE
);

-- ============================================================
-- 4. PACKAGE_SERVICE
-- ============================================================
CREATE TABLE Package_Service (
    package_service_id INT PRIMARY KEY AUTO_INCREMENT,
    package_id         INT NOT NULL,
    service_id         INT NOT NULL,
    UNIQUE KEY uq_pkg_svc (package_id, service_id),
    CONSTRAINT fk_ps_package FOREIGN KEY (package_id)
        REFERENCES Package(package_id) ON DELETE CASCADE,
    CONSTRAINT fk_ps_service FOREIGN KEY (service_id)
        REFERENCES Services(service_id) ON DELETE CASCADE
);

-- ============================================================
-- 5. BOOKING
-- ============================================================
CREATE TABLE Booking (
    booking_id    INT         PRIMARY KEY AUTO_INCREMENT,
    user_id       INT         NOT NULL,
    package_id    INT         NOT NULL,
    booking_date  DATE        NOT NULL DEFAULT (CURRENT_DATE),
    event_date    DATE        NOT NULL,
    event_address VARCHAR(255),
    notes         TEXT,
    status        VARCHAR(50) NOT NULL DEFAULT 'Pending'
                  CHECK (status IN ('Pending', 'Confirmed', 'Completed', 'Cancelled')),
    CONSTRAINT fk_booking_user    FOREIGN KEY (user_id)
        REFERENCES User(user_id)       ON DELETE CASCADE,
    CONSTRAINT fk_booking_package FOREIGN KEY (package_id)
        REFERENCES Package(package_id) ON DELETE RESTRICT
);

-- ============================================================
-- 6. PAYMENT
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