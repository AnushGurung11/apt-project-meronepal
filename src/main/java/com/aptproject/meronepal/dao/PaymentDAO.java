package com.aptproject.meronepal.dao;

import com.aptproject.meronepal.utility.DBConfig;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class PaymentDAO {

    private Connection conn;

    public PaymentDAO() {
        try {
            conn = DBConfig.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("PaymentDAO connection failed: " + ex.getLocalizedMessage());
        }
    }

    // ----------------------------------------------------------------
    // UPDATE PAYMENT STATUS for a given booking_id.
    //
    // When the status is set to "Paid" (or any status), the amount is
    // automatically pulled from the linked package price so the Payment
    // row always reflects the correct catalogue amount.
    //
    // Uses INSERT … ON DUPLICATE KEY UPDATE to handle both:
    //   • No Payment row yet → INSERT a fresh one with the package price
    //   • Existing Payment row → UPDATE status (and keep amount current)
    // ----------------------------------------------------------------
    public boolean updatePaymentStatus(int bookingId, String newStatus) {

        final List<String> ALLOWED = List.of("Unpaid", "Partial", "Paid", "Refunded");
        if (!ALLOWED.contains(newStatus)) {
            System.err.println("updatePaymentStatus: rejected invalid status '" + newStatus + "'");
            return false;
        }

        // Step 1 — fetch the package price for this booking
        BigDecimal packagePrice = getPackagePriceByBookingId(bookingId);
        if (packagePrice == null) {
            System.err.println("updatePaymentStatus: could not resolve package price for booking " + bookingId);
            packagePrice = BigDecimal.ZERO; // fall back gracefully
        }

        // Step 2 — upsert the Payment row
        // ON DUPLICATE KEY fires on the UNIQUE constraint: payment.booking_id
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

    // ----------------------------------------------------------------
    // Helper — look up the package price for a booking
    // ----------------------------------------------------------------
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
