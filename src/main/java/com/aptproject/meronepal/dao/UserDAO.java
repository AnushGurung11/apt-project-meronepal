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
 * DAO of {@code User} table
 *
 * {@link DBConfig#getConnection()} is called for creating connection with DB
 *
 * @see UserDAOInterface
 */
public class UserDAO implements UserDAOInterface {
    // Connect to DB
    private Connection conn;

    // Constructor for getting the connection
    public UserDAO() {
        try {
            conn = DBConfig.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex.getLocalizedMessage());
            System.out.println("User DAO Filed to acquire DB connection");
        }

    }

    /**
     *
     * @param userName string
     * @param email string
     * @param phone_number string
     * @param password string
     * @return  {@code 1} on successful insertion of a suer {@code 0} on no insertion of user
     * {@code 2} on duplicate user/ user already exist, {@code 3} on SQL ERROR
     *
     *
     */
    @Override
    public int insertUser(String userName, String email, String phone_number, String password) {

        try {
            //Check name and email already present
            final String CHECK_IF_USER = "SELECT user_name, email FROM user WHERE LOWER(user_name)=LOWER(?) OR LOWER(email)=LOWER(?)";
            PreparedStatement pStm_ = conn.prepareStatement(CHECK_IF_USER);
            pStm_.setString(1, userName);
            pStm_.setString(2, email);
            ResultSet rs = pStm_.executeQuery();
            if (rs.next()) {
                return 2; // 2 for user or email already present
            }
            final String INSERT_USER = "INSERT INTO user (user_name, email, phone_number, password) VALUES (?,?,?,?)";
            PreparedStatement pStm = conn.prepareStatement(INSERT_USER);
            pStm.setString(1, userName);
            pStm.setString(2, email);
            pStm.setString(3, phone_number);
            pStm.setString(4, password);

            int result = pStm.executeUpdate();
            return result;
        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
            return 3;
        }
    }


    /**
     *
     * @param email string
     * @return {@code null} on no user, {@code user} object if the email matches
     */
    @Override
    public User getUser(String email) {
        try {
            final String SELECT_USER = "select * from user where email=?;";

            PreparedStatement pStm_ = conn.prepareStatement(SELECT_USER);
            pStm_.setString(1, email);
            ResultSet rs = pStm_.executeQuery();
            if (rs.next()) {
                final User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUserName(rs.getString("user_name"));
                user.setPasswordHash(rs.getString("password"));
                user.setPhoneNumber(rs.getString("phone_number"));
                user.setEmail(rs.getString("email"));
                user.setCreatedAt(rs.getObject("created_at", LocalDateTime.class));
                return user;
            }

        } catch (SQLException ex) {
            System.out.println("getUser error:  " +  ex.getLocalizedMessage());
            return null;
        }
        return null;
    }

    /**
     *
     * @param updatedUser {@code user} object
     * @return {@code 4} the input is invalid i.e. null, {@code 2} if the email already exist, {@code 1} if the row is updated
     * {@code 0} if no row is affected.
     */
    public int updateUser(User updatedUser) {

        // checking for any empty or null inputs
        if (updatedUser == null || updatedUser.getUserId() <= 0) {
            return 4;
        }

        try {
            // Preparing SQL statement for checking already existing user
            final String CHECK_CONFLICT = "SELECT user_id FROM user WHERE (LOWER(user_name) = LOWER(?) OR LOWER(email) = LOWER(?)) AND user_id != ?";

            // placeholder placement of the values
            try (PreparedStatement checkStmt = conn.prepareStatement(CHECK_CONFLICT)) {
                checkStmt.setString(1, updatedUser.getUserName());
                checkStmt.setString(2, updatedUser.getEmail());
                checkStmt.setInt(3, updatedUser.getUserId());

                //Executing the query
                try (ResultSet rs = checkStmt.executeQuery()) {
                    // Checking if multiple rows gets affected
                    if (rs.next()) { //moving to the next row
                        return 2; // Username or email already belongs to another account
                    }
                }
            }

            final String UPDATE_USER =
                    "UPDATE user " +
                            "SET user_name    = ?, " +
                            "    email        = ?, " +
                            "    phone_number = ?, " +
                            "    user_role    = ? " +  // Preserved from session — not user-editable
                            "WHERE user_id = ?";

            try (PreparedStatement updateStmt = conn.prepareStatement(UPDATE_USER)) {
                updateStmt.setString(1, updatedUser.getUserName());
                updateStmt.setString(2, updatedUser.getEmail());
                updateStmt.setString(3, updatedUser.getPhoneNumber());
                updateStmt.setString(4, updatedUser.getUserRole());
                updateStmt.setInt(5, updatedUser.getUserId());

                int rowsAffected = updateStmt.executeUpdate();
                return (rowsAffected > 0) ? 1 : 0; // 1 = updated, 0 = user ID not found
            }

        } catch (SQLException ex) {
            System.out.println("updateUser error: " + ex.getLocalizedMessage());
            ex.printStackTrace();
            return 3; // SQL / database error
        }
    }


    private String getCurrentPasswordHash(int userId) {
        final String SELECT_PASS = "SELECT password FROM user WHERE user_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(SELECT_PASS)) {
            stmt.setInt(1, userId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("password");
                }
            }
        } catch (SQLException e) {
            System.out.println("getCurrentPasswordHash error: " + e.getMessage());
        }
        return null;
    }

    /**
     * Updates ONLY the password (all other fields untouched)
     * @param userId The user ID
     * @param newPasswordPlaintext The NEW password in PLAINTEXT (from form)
     * @return 1=success, 0=no rows, 3=SQL error, 4=invalid ID
     */
    public int updatePasswordOnly(int userId, String newPasswordPlaintext) {
        if (userId <= 0 || newPasswordPlaintext == null || newPasswordPlaintext.isEmpty()) {
            return 4; // Invalid input
        }

        try {
            // ALWAYS hash the plaintext password before storing
            String hashedPassword = PasswordUtil.getHashPassword(newPasswordPlaintext);

            // Update ONLY password column
            final String UPDATE_PASSWORD = "UPDATE user SET password = ? WHERE user_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(UPDATE_PASSWORD)) {
                stmt.setString(1, hashedPassword);
                stmt.setInt(2, userId);

                int rows = stmt.executeUpdate();
                return (rows > 0) ? 1 : 0;
            }

        } catch (SQLException ex) {
            System.out.println("Update password error: " + ex.getMessage());
            return 3;
        }
    }
}
