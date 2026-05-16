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

<<<<<<< HEAD
/**
 * DAO for managing user data in the database.
 * Handles CRUD operations for the {@code user} table.
=======

/**
 * DAO of {@code User} table
 *
 * {@link DBConfig#getConnection()} is called for creating connection with DB
 *
 * @see UserDAOInterface
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
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
<<<<<<< HEAD
            System.out.println("UserDAO: failed to open DB connection — " + ex.getLocalizedMessage());
=======
            System.out.println(ex.getLocalizedMessage());
            System.out.println("User DAO Filed to acquire DB connection");
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
        }
        this.conn = tempConn;
    }

    /**
<<<<<<< HEAD
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
=======
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

>>>>>>> 176d58a (User Profile Servlet Update user DAO)
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

<<<<<<< HEAD
        } catch (SQLException ex) {
            System.out.println("insertUser error: " + ex.getLocalizedMessage());
=======
            int result = pStm.executeUpdate();
            return result;
        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
            return 3;
        }
    }

<<<<<<< HEAD
    /**
     * Fetches a user by email address.
     *
     * @param email {@code String}: email to look up
     * @return {@code User}: user object if found, {@code null} otherwise
=======

    /**
     *
     * @param email string
     * @return {@code null} on no user, {@code user} object if the email matches
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
     */
    @Override
    public User getUser(String email) {
<<<<<<< HEAD
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
=======
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
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
            }
        } catch (SQLException ex) {
<<<<<<< HEAD
            System.out.println("getUser error: " + ex.getLocalizedMessage());
=======
            System.out.println("getUser error:  " +  ex.getLocalizedMessage());
            return null;
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
        }
        return null;
    }

    /**
<<<<<<< HEAD
     * Updates user profile fields with conflict check and password handling.
     *
     * @param updatedUser {@code User}: user object with new values, {@code userId} required
     * @return {@code int}: 1=success, 0=no row matched, 2=conflict, 3=SQL error, 4=invalid input
     */
    public int updateUser(User updatedUser) {

=======
     *
     * @param updatedUser {@code user} object
     * @return {@code 4} the input is invalid i.e. null, {@code 2} if the email already exist, {@code 1} if the row is updated
     * {@code 0} if no row is affected.
     */
    public int updateUser(User updatedUser) {

        // checking for any empty or null inputs
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
        if (updatedUser == null || updatedUser.getUserId() <= 0) {
            return 4;
        }

        try {
<<<<<<< HEAD
            // Check for username/email conflict excluding current user
            final String CHECK_CONFLICT =
                    "SELECT user_id FROM user " +
                            "WHERE (LOWER(user_name) = LOWER(?) OR LOWER(email) = LOWER(?)) " +
                            "AND user_id != ?";

=======
            // Preparing SQL statement for checking already existing user
            final String CHECK_CONFLICT = "SELECT user_id FROM user WHERE (LOWER(user_name) = LOWER(?) OR LOWER(email) = LOWER(?)) AND user_id != ?";

            // placeholder placement of the values
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
            try (PreparedStatement checkStmt = conn.prepareStatement(CHECK_CONFLICT)) {
                checkStmt.setString(1, updatedUser.getUserName());
                checkStmt.setString(2, updatedUser.getEmail());
                checkStmt.setInt(3, updatedUser.getUserId());

<<<<<<< HEAD
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
=======
                //Executing the query
                try (ResultSet rs = checkStmt.executeQuery()) {
                    // Checking if multiple rows gets affected
                    if (rs.next()) { //moving to the next row
                        return 2; // Username or email already belongs to another account
                    }
                }
            }

>>>>>>> 176d58a (User Profile Servlet Update user DAO)
            final String UPDATE_USER =
                    "UPDATE user " +
                            "SET user_name    = ?, " +
                            "    email        = ?, " +
                            "    phone_number = ?, " +
<<<<<<< HEAD
                            "    password     = ?, " +
                            "    user_role    = ? " +
=======
                            "    user_role    = ? " +  // Preserved from session — not user-editable
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
                            "WHERE user_id = ?";

            try (PreparedStatement updateStmt = conn.prepareStatement(UPDATE_USER)) {
                updateStmt.setString(1, updatedUser.getUserName());
                updateStmt.setString(2, updatedUser.getEmail());
                updateStmt.setString(3, updatedUser.getPhoneNumber());
<<<<<<< HEAD
                updateStmt.setString(4, passwordToStore);
                updateStmt.setString(5, updatedUser.getUserRole());
                updateStmt.setInt(6, updatedUser.getUserId());

                int rows = updateStmt.executeUpdate();
                return rows > 0 ? 1 : 0;
=======
                updateStmt.setString(4, updatedUser.getUserRole());
                updateStmt.setInt(5, updatedUser.getUserId());

                int rowsAffected = updateStmt.executeUpdate();
                return (rowsAffected > 0) ? 1 : 0; // 1 = updated, 0 = user ID not found
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
            }

        } catch (SQLException ex) {
            System.out.println("updateUser error: " + ex.getLocalizedMessage());
            ex.printStackTrace();
<<<<<<< HEAD
            return 3;
        }
    }

    /**
     * Helper to fetch current password hash for a user.
     *
     * @param userId {@code int}: ID of user whose hash to retrieve
     * @return {@code String}: stored BCrypt hash, or {@code null} if not found or error
     */
=======
            return 3; // SQL / database error
        }
    }


>>>>>>> 176d58a (User Profile Servlet Update user DAO)
    private String getCurrentPasswordHash(int userId) {
        final String SELECT_PASS = "SELECT password FROM user WHERE user_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(SELECT_PASS)) {
            stmt.setInt(1, userId);
<<<<<<< HEAD
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) return rs.getString("password");
=======

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("password");
                }
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
            }
        } catch (SQLException e) {
            System.out.println("getCurrentPasswordHash error: " + e.getMessage());
        }
        return null;
    }

    /**
<<<<<<< HEAD
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
=======
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
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
