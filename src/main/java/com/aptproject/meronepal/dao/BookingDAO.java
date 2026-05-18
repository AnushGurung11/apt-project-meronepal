package com.aptproject.meronepal.dao;

import com.aptproject.meronepal.dao.interfaces.BookingDAOInterface;
import com.aptproject.meronepal.model.Booking;
import com.aptproject.meronepal.model.User;
import com.aptproject.meronepal.utility.DBConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO implements BookingDAOInterface {

    private Connection conn;
    public BookingDAO(){
        try{
            conn = DBConfig.getConnection();
        }catch (SQLException | ClassNotFoundException ex){
            System.out.println(ex.getLocalizedMessage());
        }
    }
    @Override
    public int insertBooking(User user, int packageId,String eventAddress, String notes, String eventDate) {
        try {
            final String INSERT_BOOKING =
                    "INSERT INTO Booking (user_id, package_id, event_date, event_address, notes) " +
                            "VALUES (?, ?, ?, ?, ?)";

            PreparedStatement pStm = conn.prepareStatement(INSERT_BOOKING);
            pStm.setInt(1, user.getUserId());
            pStm.setInt(2, packageId);
            pStm.setDate(3, java.sql.Date.valueOf(eventDate));
            pStm.setString(4, eventAddress);
            pStm.setString(5, notes);

            return pStm.executeUpdate();

        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
            return 0;
        }
    }

    // ── Replace the existing getAllBooking() in BookingDAO with this ──

    public List<Booking> getAllBooking() {
        List<Booking> bookings = new ArrayList<>();

        final String SQL = """
        SELECT
            b.booking_id,
            b.event_date,
            b.event_address,
            b.notes,
            b.status            AS booking_status,

            u.user_name,
            u.email,
            u.phone_number,

            p.package_name,
            p.price             AS package_price,

            GROUP_CONCAT(s.service_name ORDER BY s.service_name SEPARATOR ', ')
                                AS services,

            pay.payment_status,
            pay.amount          AS paid_amount,
            pay.payment_method
        FROM Booking b
        JOIN User    u   ON b.user_id    = u.user_id
        JOIN Package p   ON b.package_id = p.package_id
        LEFT JOIN Package_Service ps ON p.package_id  = ps.package_id
        LEFT JOIN Services        s  ON ps.service_id = s.service_id
        LEFT JOIN Payment        pay ON b.booking_id  = pay.booking_id
        GROUP BY
            b.booking_id, b.event_date, b.event_address, b.notes, b.status,
            u.user_name, u.email, u.phone_number,
            p.package_name, p.price,
            pay.payment_status, pay.amount, pay.payment_method
        ORDER BY b.booking_id DESC
    """;

        try (PreparedStatement pStm = conn.prepareStatement(SQL);
             ResultSet rs = pStm.executeQuery()) {

            while (rs.next()) {
                Booking booking = new Booking();

                booking.setBookingId(rs.getInt("booking_id"));
                // user_id / package_id are NOT in SELECT — do not read them here
                booking.setStatus(rs.getString("booking_status"));
                booking.setEventAddress(rs.getString("event_address"));
                booking.setNotes(rs.getString("notes"));

                java.sql.Date eventDate = rs.getDate("event_date");
                if (eventDate != null) booking.setEventDate(eventDate.toLocalDate());

                // User
                booking.setUserName(rs.getString("user_name"));
                booking.setEmail(rs.getString("email"));
                booking.setPhoneNumber(rs.getString("phone_number"));

                // Package
                booking.setPackageName(rs.getString("package_name"));
                booking.setPackagePrice(rs.getBigDecimal("package_price")); // NEW
                booking.setServices(rs.getString("services"));

                // Payment (LEFT JOIN — may be null)
                booking.setPaymentStatus(rs.getString("payment_status"));
                booking.setAmount(rs.getBigDecimal("paid_amount"));         // actual paid amount
                booking.setPaymentMethod(rs.getString("payment_method"));

                bookings.add(booking);
            }
        } catch (SQLException e) {
            System.err.println("getAllBooking failed: " + e.getMessage());
        }

        return bookings;
    }


    // ----------------------------------------------------------------
// GET BOOKINGS BY USER ID
// ----------------------------------------------------------------
    public List<Booking> getBookingsByUserId(int userId) {
        List<Booking> bookings = new ArrayList<>();

        final String SQL = """
    SELECT
        b.booking_id,
        b.user_id,
        b.package_id,
        b.booking_date,
        b.event_date,
        b.event_address,
        b.notes,
        b.status            AS booking_status,

        u.user_name,
        u.email,
        u.phone_number,

        p.package_name,
        p.price             AS package_price,

        GROUP_CONCAT(s.service_name ORDER BY s.service_name SEPARATOR ', ')
                            AS services,

        pay.payment_status,
        pay.amount,
        pay.payment_method
    FROM Booking b
    JOIN User    u   ON b.user_id    = u.user_id
    JOIN Package p   ON b.package_id = p.package_id
    LEFT JOIN Package_Service ps ON p.package_id  = ps.package_id
    LEFT JOIN Services        s  ON ps.service_id = s.service_id
    LEFT JOIN Payment        pay ON b.booking_id  = pay.booking_id
    WHERE b.user_id = ?
    GROUP BY
        b.booking_id, b.user_id, b.package_id, b.booking_date,
        b.event_date, b.event_address, b.notes, b.status,
        u.user_name, u.email, u.phone_number,
        p.package_name, p.price,
        pay.payment_status, pay.amount, pay.payment_method
    ORDER BY b.booking_id DESC;
""";

        try (PreparedStatement pStm = conn.prepareStatement(SQL)) {

            pStm.setInt(1, userId);                 // bind the user_id safely

            try (ResultSet rs = pStm.executeQuery()) {
                while (rs.next()) {
                    Booking booking = new Booking();

                    booking.setBookingId(rs.getInt("booking_id"));
                    booking.setUserId(rs.getInt("user_id"));
                    booking.setPackageId(rs.getInt("package_id"));
                    booking.setStatus(rs.getString("booking_status"));
                    booking.setEventAddress(rs.getString("event_address"));
                    booking.setNotes(rs.getString("notes"));

                    java.sql.Date bookingDate = rs.getDate("booking_date");
                    if (bookingDate != null) booking.setBookingDate(bookingDate.toLocalDate());

                    java.sql.Date eventDate = rs.getDate("event_date");
                    if (eventDate != null) booking.setEventDate(eventDate.toLocalDate());

                    booking.setUserName(rs.getString("user_name"));
                    booking.setEmail(rs.getString("email"));
                    booking.setPhoneNumber(rs.getString("phone_number"));

                    booking.setPackageName(rs.getString("package_name"));
                    booking.setServices(rs.getString("services"));

                    booking.setPaymentStatus(rs.getString("payment_status"));
                    booking.setAmount(rs.getBigDecimal("package_price"));
                    booking.setPaymentMethod(rs.getString("payment_method"));

                    bookings.add(booking);
                }
            }

        } catch (SQLException e) {
            System.err.println("getBookingsByUserId failed: " + e.getMessage());
        }

        return bookings;
    }


    // ----------------------------------------------------------------
// UPDATE BOOKING STATUS
// Valid values (enforced by DB CHECK): Pending, Confirmed, Completed, Cancelled
// ----------------------------------------------------------------
    public boolean updateBookingStatus(int bookingId, String newStatus) {

        // Whitelist valid statuses — never trust raw input from servlet/JSP
        // This mirrors the CHECK constraint in your DB schema exactly
        final List<String> ALLOWED_STATUSES = List.of(
                "Pending", "Confirmed", "Completed", "Cancelled"
        );

        if (!ALLOWED_STATUSES.contains(newStatus)) {
            System.err.println("updateBookingStatus: rejected invalid status '" + newStatus + "'");
            return false;
        }

        final String SQL = "UPDATE Booking SET status = ? WHERE booking_id = ?";

        try (PreparedStatement pStm = conn.prepareStatement(SQL)) {

            pStm.setString(1, newStatus);
            pStm.setInt(2, bookingId);

            int rowsAffected = pStm.executeUpdate();
            return rowsAffected > 0;        // true = row found and updated

        } catch (SQLException e) {
            System.err.println("updateBookingStatus failed: " + e.getMessage());
            return false;
        }
    }
    /**
     * Retrieves the total number of bookings in the system.
     *
     * @return total booking count as {@code int}, or {@code -1} on SQL error
     */
    public int getTotalBookingCount() throws SQLException {
        final String GET_BOOKING_COUNT = "SELECT COUNT(*) FROM booking;";

        try (PreparedStatement statement = conn.prepareStatement(GET_BOOKING_COUNT)) {
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                System.out.println("Total bookings: " + count);
                return count;
            }
            return 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    /**
     * Retrieves booking counts grouped by package.
     * Uses the Booking model — only packageId and packageName
     * are populated; bookingCount is stored in the amount field
     *
     * Returns a list where each entry represents one package group,
     * with packageId, packageName set, and bookingCount readable
     * via a dedicated int field using a lightweight Booking subclass.
     *
     * @return {@code ArrayList<Booking>} one entry per package,
     *         with packageId, packageName, and bookingCount populated.
     *         Returns empty list on SQL error.
     */
    public ArrayList<Booking> getBookingCountByPackage() throws SQLException {
        final String GET_GROUPED =
                "SELECT b.package_id, p.package_name, COUNT(*) AS booking_count " +
                        "FROM booking b " +
                        "JOIN `package` p ON b.package_id = p.package_id " +  // ← backticks
                        "GROUP BY b.package_id, p.package_name " +
                        "ORDER BY booking_count DESC;";

        ArrayList<Booking> list = new ArrayList<>();

        try (PreparedStatement statement = conn.prepareStatement(GET_GROUPED)) {
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Booking booking = new Booking();
                booking.setPackageId(resultSet.getInt("package_id"));
                booking.setPackageName(resultSet.getString("package_name"));
                booking.setBookingCount(resultSet.getInt("booking_count")); // ← use proper field
                list.add(booking);
            }
            return list;

        } catch (SQLException e) {
            e.printStackTrace();
            return list;
        }
    }

    public ArrayList<Booking> getRecentBookings() throws SQLException {
        final String GET_RECENT =
                "SELECT b.booking_id, b.event_date, b.status, " +
                        "       u.user_name, u.email, u.phone_number, " +
                        "       p.package_name, " +
                        "       pay.payment_status, pay.amount, pay.payment_method " +
                        "FROM booking b " +
                        "JOIN user u          ON b.user_id    = u.user_id " +
                        "JOIN `package` p     ON b.package_id = p.package_id " +  // ← backticks
                        "LEFT JOIN payment pay ON pay.booking_id = b.booking_id " +
                        "ORDER BY b.booking_id DESC " +
                        "LIMIT 10;";

        ArrayList<Booking> list = new ArrayList<>();

        try (PreparedStatement statement = conn.prepareStatement(GET_RECENT)) {
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));

                // ── Null-safe date ──────────────────────────────────
                java.sql.Date eventDate = rs.getDate("event_date");
                if (eventDate != null) booking.setEventDate(eventDate.toLocalDate());

                booking.setStatus(rs.getString("status"));
                booking.setUserName(rs.getString("user_name"));
                booking.setEmail(rs.getString("email"));
                booking.setPhoneNumber(rs.getString("phone_number"));
                booking.setPackageName(rs.getString("package_name"));

                // ── Null-safe payment (LEFT JOIN may return nulls) ──
                String paymentStatus = rs.getString("payment_status");
                booking.setPaymentStatus(paymentStatus != null ? paymentStatus : "Unpaid");

                booking.setAmount(rs.getBigDecimal("amount"));        // BigDecimal handles null fine
                booking.setPaymentMethod(rs.getString("payment_method")); // String handles null fine

                list.add(booking);
            }
            return list;

        } catch (SQLException e) {
            e.printStackTrace();
            return list;
        }
    }

}
