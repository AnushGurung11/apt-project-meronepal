package com.aptproject.meronepal.dao;

import com.aptproject.meronepal.dao.interfaces.UserDAOInterface;
import com.aptproject.meronepal.model.User;
import com.aptproject.meronepal.utility.DBConfig;
import com.aptproject.meronepal.utility.PasswordUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

/**
 * DAO for managing user data in the database.
 * Handles CRUD operations for the {@code user} table.
 */
public class UserDAO implements UserDAOInterface {

    private final Connection conn;

    /**
     * Constructor — initializes database connection via {@code DBConfig}.
     * Catches and logs {@code SQLException} or {@code ClassNotFoundException}.
     */
    public UserDAO() {
        Connection tempConn = null;
        try {
            tempConn = DBConfig.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("UserDAO: failed to open DB connection — " + ex.getLocalizedMessage());
        }
        this.conn = tempConn;
    }

    /**
     * Inserts a new user record with duplicate check.
     *
     * @param userName {@code String}: desired username
     * @param email {@code String}: user's email address
     * @param phone_number {@code String}: user's phone number
     * @param password {@code String}: already-hashed BCrypt password
     * @return {@code int}: 1=success, 2=duplicate username/email, 3=SQL error
     */
    @Override
    public int insertUser(String userName, String email, String phone_number, String password) {
        try {
            // Check for duplicate username or email (case-insensitive)
            final String CHECK_IF_USER =
                    "SELECT user_name FROM user " +
                            "WHERE LOWER(user_name) = LOWER(?) OR LOWER(email) = LOWER(?)";

            try (PreparedStatement checkStmt = conn.prepareStatement(CHECK_IF_USER)) {
                checkStmt.setString(1, userName);
                checkStmt.setString(2, email);
                try (ResultSet rs = checkStmt.executeQuery()) {
                    if (rs.next()) return 2;
                }
            }

            // Insert new user
            final String INSERT_USER =
                    "INSERT INTO user (user_name, email, phone_number, password) VALUES (?, ?, ?, ?)";

            try (PreparedStatement insertStmt = conn.prepareStatement(INSERT_USER)) {
                insertStmt.setString(1, userName);
                insertStmt.setString(2, email);
                insertStmt.setString(3, phone_number);
                insertStmt.setString(4, password);
                return insertStmt.executeUpdate();
            }

        } catch (SQLException ex) {
            System.out.println("insertUser error: " + ex.getLocalizedMessage());
            return 3;
        }
    }

    /**
     * Fetches a user by email address.
     *
     * @param email {@code String}: email to look up
     * @return {@code User}: user object if found, {@code null} otherwise
     */
    @Override
    public User getUser(String email) {
        final String SELECT_USER = "SELECT * FROM user WHERE email = ?";

        try (PreparedStatement pStmt = conn.prepareStatement(SELECT_USER)) {
            pStmt.setString(1, email);

            try (ResultSet rs = pStmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setUserId(rs.getInt("user_id"));
                    user.setUserName(rs.getString("user_name"));
                    user.setPasswordHash(rs.getString("password"));
                    user.setPhoneNumber(rs.getString("phone_number"));
                    user.setEmail(rs.getString("email"));
                    user.setUserRole(rs.getString("user_role"));
                    user.setCreatedAt(rs.getObject("created_at", LocalDateTime.class));
                    return user;
                }
            }
        } catch (SQLException ex) {
            System.out.println("getUser error: " + ex.getLocalizedMessage());
        }
        return null;
    }

    /**
     * Updates user profile fields with conflict check and password handling.
     *
     * @param updatedUser {@code User}: user object with new values, {@code userId} required
     * @return {@code int}: 1=success, 0=no row matched, 2=conflict, 3=SQL error, 4=invalid input
     */
    public int updateUser(User updatedUser) {

        if (updatedUser == null || updatedUser.getUserId() <= 0) {
            return 4;
        }

        try {
            // Check for username/email conflict excluding current user
            final String CHECK_CONFLICT =
                    "SELECT user_id FROM user " +
                            "WHERE (LOWER(user_name) = LOWER(?) OR LOWER(email) = LOWER(?)) " +
                            "AND user_id != ?";

            try (PreparedStatement checkStmt = conn.prepareStatement(CHECK_CONFLICT)) {
                checkStmt.setString(1, updatedUser.getUserName());
                checkStmt.setString(2, updatedUser.getEmail());
                checkStmt.setInt(3, updatedUser.getUserId());

                try (ResultSet rs = checkStmt.executeQuery()) {
                    if (rs.next()) return 2;
                }
            }

            // Resolve password: hash if plain text, preserve if null/empty
            String passwordToStore = updatedUser.getPasswordHash();

            if (passwordToStore != null && !passwordToStore.isEmpty()) {
                if (!passwordToStore.startsWith("$2a$")) {
                    passwordToStore = PasswordUtil.getHashPassword(passwordToStore);
                }
            } else {
                passwordToStore = getCurrentPasswordHash(updatedUser.getUserId());
                if (passwordToStore == null) {
                    return 4;
                }
            }

            // Execute update
            final String UPDATE_USER =
                    "UPDATE user " +
                            "SET user_name    = ?, " +
                            "    email        = ?, " +
                            "    phone_number = ?, " +
                            "    password     = ?, " +
                            "    user_role    = ? " +
                            "WHERE user_id = ?";

            try (PreparedStatement updateStmt = conn.prepareStatement(UPDATE_USER)) {
                updateStmt.setString(1, updatedUser.getUserName());
                updateStmt.setString(2, updatedUser.getEmail());
                updateStmt.setString(3, updatedUser.getPhoneNumber());
                updateStmt.setString(4, passwordToStore);
                updateStmt.setString(5, updatedUser.getUserRole());
                updateStmt.setInt(6, updatedUser.getUserId());

                int rows = updateStmt.executeUpdate();
                return rows > 0 ? 1 : 0;
            }

        } catch (SQLException ex) {
            System.out.println("updateUser error: " + ex.getLocalizedMessage());
            ex.printStackTrace();
            return 3;
        }
    }

    /**
     * Helper to fetch current password hash for a user.
     *
     * @param userId {@code int}: ID of user whose hash to retrieve
     * @return {@code String}: stored BCrypt hash, or {@code null} if not found or error
     */
    private String getCurrentPasswordHash(int userId) {
        final String SELECT_PASS = "SELECT password FROM user WHERE user_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(SELECT_PASS)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) return rs.getString("password");
            }
        } catch (SQLException e) {
            System.out.println("getCurrentPasswordHash error: " + e.getMessage());
        }
        return null;
    }

    /**
     * Updates only the password for a user.
     *
     * @param userID {@code int}: ID of user whose password to update
     * @param updatedPassword {@code String}: new password (should be pre-hashed)
     * @return {@code int}: 1=success, 0=user not found, 3=SQL error
     * @throws SQLException if database query fails
     */
    public int updateUserPassword(int userID, String updatedPassword) throws SQLException {

        final String PASS_UPDATE_QUERY = "UPDATE user SET password = ? WHERE user_id = ?;";

        try(PreparedStatement statement = conn.prepareStatement(PASS_UPDATE_QUERY)){
            statement.setString(1, updatedPassword);
            statement.setInt(2, userID);

            int rowsAffected = statement.executeUpdate();

            if (rowsAffected == 0){
                System.out.println("User id incorrect, 0 rows updated");
                return rowsAffected;
            }else if(rowsAffected == 1){
                System.out.println("Password Updated");
                return rowsAffected;
            }else{
                System.out.println(" Multiple rows updated");
                return rowsAffected;
            }

        }catch (SQLException e) {
            e.printStackTrace();
            return 3;
        }
    }

    /**
     * Counts total number of registered users.
     *
     * @return {@code int}: total user count, or {@code -1} on SQL error
     * @throws SQLException if database query fails
     */
    public int getUserCount() throws SQLException {
        final String GET_USER_COUNT = "SELECT COUNT(*) FROM user;";

        try (PreparedStatement statement = conn.prepareStatement(GET_USER_COUNT)) {
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                System.out.println("Total users: " + count);
                return count;
            }

            return 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }
}