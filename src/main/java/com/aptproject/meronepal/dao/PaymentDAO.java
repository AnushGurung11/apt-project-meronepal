package com.aptproject.meronepal.dao;

import com.aptproject.meronepal.utility.DBConfig;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * DAO for managing payment data in the database.
 * Handles payment status updates for the {@code Payment} table linked to bookings.
 */
public class PaymentDAO {

    private Connection conn;

    /**
     * Constructor — initializes database connection via {@code DBConfig}.
     * Catches and logs {@code SQLException} or {@code ClassNotFoundException}.
     */
    public PaymentDAO() {
        try {
            conn = DBConfig.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("PaymentDAO connection failed: " + ex.getLocalizedMessage());
        }
    }

    /**
     * Updates or inserts payment status for a booking, syncing amount from package price.
     *
     * @param bookingId {@code int}: ID of the booking whose payment to update
     * @param newStatus {@code String}: new status (must be one of: Unpaid, Partial, Paid, Refunded)
     * @return {@code boolean}: true=success (row inserted/updated), false=invalid status or error
     *
     * Uses {@code INSERT ... ON DUPLICATE KEY UPDATE} to handle both new and existing payment rows.
     * Amount is auto-set from the linked package price to keep data consistent.
     */
    public boolean updatePaymentStatus(int bookingId, String newStatus) {

        final List<String> ALLOWED = List.of("Unpaid", "Partial", "Paid", "Refunded");
        if (!ALLOWED.contains(newStatus)) {
            System.err.println("updatePaymentStatus: rejected invalid status '" + newStatus + "'");
            return false;
        }

        // Get package price for this booking to set payment amount
        BigDecimal packagePrice = getPackagePriceByBookingId(bookingId);
        if (packagePrice == null) {
            System.err.println("updatePaymentStatus: could not resolve package price for booking " + bookingId);
            packagePrice = BigDecimal.ZERO;
        }

        // Upsert payment row: insert new or update existing based on booking_id uniqueness
        final String SQL = """
                INSERT INTO Payment (booking_id, payment_status, amount)
                VALUES (?, ?, ?)
                ON DUPLICATE KEY UPDATE
                    payment_status = VALUES(payment_status),
                    amount         = VALUES(amount)
                """;

        try (PreparedStatement pStm = conn.prepareStatement(SQL)) {
            pStm.setInt(1, bookingId);
            pStm.setString(2, newStatus);
            pStm.setBigDecimal(3, packagePrice);

            int rows = pStm.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            System.err.println("updatePaymentStatus failed: " + e.getMessage());
            return false;
        }
    }

    /**
     * Helper method to fetch the package price for a given booking.
     *
     * @param bookingId {@code int}: ID of the booking to look up
     * @return {@code BigDecimal}: package price if found, {@code null} on error or not found
     */
    private BigDecimal getPackagePriceByBookingId(int bookingId) {
        final String SQL = """
                SELECT p.price
                FROM Booking b
                JOIN Package p ON b.package_id = p.package_id
                WHERE b.booking_id = ?
                """;

        try (PreparedStatement pStm = conn.prepareStatement(SQL)) {
            pStm.setInt(1, bookingId);
            try (ResultSet rs = pStm.executeQuery()) {
                if (rs.next()) {
                    return rs.getBigDecimal("price");
                }
            }
        } catch (SQLException e) {
            System.err.println("getPackagePriceByBookingId failed: " + e.getMessage());
        }
        return null;
    }
}