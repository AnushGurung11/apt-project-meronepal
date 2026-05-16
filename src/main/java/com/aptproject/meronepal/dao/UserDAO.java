package com.aptproject.meronepal.dao;

import com.aptproject.meronepal.dao.interfaces.UserDAOInterface;
import com.aptproject.meronepal.model.User;
import com.aptproject.meronepal.utility.DBConfig;
import com.aptproject.meronepal.utility.PasswordUtil;
import jakarta.servlet.jsp.tagext.JspTag;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

<<<<<<< HEAD
<<<<<<< HEAD
/**
 * DAO for managing user data in the database.
 * Handles CRUD operations for the {@code user} table.
=======

=======
>>>>>>> 2ea22dc (completion of User password and Editing User details)
/**
 * Data Access Object (DAO) for the {@code User} table.
 *
 * <p>Provides CRUD operations against the {@code apt_booking_system.User} table.
 * Each instance opens one {@link Connection} on construction via
 * {@link DBConfig#getConnection()}. Use one DAO per request and discard it
 * afterwards — do not share instances across threads.</p>
 *
<<<<<<< HEAD
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
=======
 * <h3>Return-code contract (shared across all mutating methods):</h3>
 * <ul>
 *   <li>{@code 0} — No rows affected (user not found / nothing changed).</li>
 *   <li>{@code 1} — Operation succeeded.</li>
 *   <li>{@code 2} — Conflict: username or email already exists for another account.</li>
 *   <li>{@code 3} — Database / SQL error.</li>
 *   <li>{@code 4} — Invalid input supplied by the caller (null object, invalid ID).</li>
 * </ul>
 */
public class UserDAO implements UserDAOInterface {

    /** Active JDBC connection. Opened once in the constructor. */
    private final Connection conn;

    // -------------------------------------------------------------------------
    // Constructor
    // -------------------------------------------------------------------------

    /**
     * Constructs a new {@code UserDAO} and opens a database connection.
>>>>>>> 2ea22dc (completion of User password and Editing User details)
     *
     * <p>If the connection cannot be established, {@code conn} is {@code null}
     * and all subsequent calls will fall through to their {@code catch} blocks,
     * returning error code {@code 3}.</p>
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

    // -------------------------------------------------------------------------
    // INSERT
    // -------------------------------------------------------------------------

    /**
     * Inserts a new user record into the {@code User} table.
     *
     * <p>Performs a case-insensitive duplicate check on both username and email
     * before inserting. The {@code password} parameter must already be a BCrypt
     * hash — hashing is the caller's responsibility.</p>
     *
     * @param userName     the desired username
     * @param email        the user's email address
     * @param phone_number the user's phone number
     * @param password     the <em>already-hashed</em> BCrypt password string
     * @return {@code 1} on success, {@code 2} if username/email already taken,
     *         {@code 3} on SQL error
     */
    @Override
    public int insertUser(String userName, String email, String phone_number, String password) {
<<<<<<< HEAD

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
=======
        try {
            // Duplicate check (case-insensitive)
            final String CHECK_IF_USER =
                    "SELECT user_name FROM user " +
                            "WHERE LOWER(user_name) = LOWER(?) OR LOWER(email) = LOWER(?)";

            try (PreparedStatement checkStmt = conn.prepareStatement(CHECK_IF_USER)) {
                checkStmt.setString(1, userName);
                checkStmt.setString(2, email);
                try (ResultSet rs = checkStmt.executeQuery()) {
                    if (rs.next()) return 2; // username or email already registered
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
                return insertStmt.executeUpdate(); // 1 on success
            }

        } catch (SQLException ex) {
            System.out.println("insertUser error: " + ex.getLocalizedMessage());
>>>>>>> 2ea22dc (completion of User password and Editing User details)
            return 3;
        }
    }

<<<<<<< HEAD
<<<<<<< HEAD
    /**
     * Fetches a user by email address.
     *
     * @param email {@code String}: email to look up
     * @return {@code User}: user object if found, {@code null} otherwise
=======
=======
    // -------------------------------------------------------------------------
    // SELECT
    // -------------------------------------------------------------------------
>>>>>>> 2ea22dc (completion of User password and Editing User details)

    /**
     * Retrieves a single {@link User} by email address.
     *
<<<<<<< HEAD
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
=======
     * <p><strong>Bug fixed:</strong> the original implementation never called
     * {@code user.setUserRole()}, which meant the role was always {@code null}
     * in the session, causing NPEs downstream (e.g. in the profile JSP) and
     * forcing the servlet to fall back to a hard-coded default. This version
     * maps all columns including {@code user_role} and {@code created_at}.</p>
     *
     * @param email the email address to look up (exact match as stored)
     * @return the matching {@link User}, or {@code null} if not found or on error
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
                    // FIX: this line was missing in the original — role was always null in session
                    user.setUserRole(rs.getString("user_role"));
                    user.setCreatedAt(rs.getObject("created_at", LocalDateTime.class));
                    return user;
                }
            }
        } catch (SQLException ex) {
            System.out.println("getUser error: " + ex.getLocalizedMessage());
>>>>>>> 2ea22dc (completion of User password and Editing User details)
        }
        return null;
    }

    // -------------------------------------------------------------------------
    // UPDATE
    // -------------------------------------------------------------------------

    /**
<<<<<<< HEAD
<<<<<<< HEAD
     * Updates user profile fields with conflict check and password handling.
     *
     * @param updatedUser {@code User}: user object with new values, {@code userId} required
     * @return {@code int}: 1=success, 0=no row matched, 2=conflict, 3=SQL error, 4=invalid input
     */
    public int updateUser(User updatedUser) {

=======
=======
     * Updates the non-sensitive profile fields of an existing user.
>>>>>>> 2ea22dc (completion of User password and Editing User details)
     *
     * <h3>Fields updated:</h3>
     * <ul>
     *   <li>Username</li>
     *   <li>Email</li>
     *   <li>Phone number</li>
     *   <li>Password — handled intelligently:
     *     <ul>
     *       <li>Already a BCrypt hash (starts with {@code $2a$}) → stored as-is.</li>
     *       <li>Plain text → hashed via {@link PasswordUtil#getHashPassword(String)}.</li>
     *       <li>{@code null} or empty → current hash is fetched from DB and preserved
     *           via {@link #getCurrentPasswordHash(int)}.</li>
     *     </ul>
     *   </li>
     *   <li>User role — copied from the caller; not editable by the user.</li>
     * </ul>
     *
     * <p><strong>Bug fixed:</strong> the original code called
     * {@code updatedUser.getPasswordHash(updatedUser.getUserId())} which does not
     * exist — {@code getPasswordHash()} takes no arguments. Replaced with a call
     * to the private {@link #getCurrentPasswordHash(int)} helper.</p>
     *
     * @param updatedUser a {@link User} carrying the new values;
     *                    {@code userId} must be a positive integer
     * @return {@code 1} on success, {@code 0} if no row matched,
     *         {@code 2} on username/email conflict, {@code 3} on SQL error,
     *         {@code 4} if input is invalid or the user ID is not found in the DB
     */
    public int updateUser(User updatedUser) {

<<<<<<< HEAD
        // checking for any empty or null inputs
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
=======
        // Guard: validate input
>>>>>>> 2ea22dc (completion of User password and Editing User details)
        if (updatedUser == null || updatedUser.getUserId() <= 0) {
            return 4;
        }

        try {
<<<<<<< HEAD
<<<<<<< HEAD
            // Check for username/email conflict excluding current user
=======
            // STEP 1: Conflict check — exclude the current user from the uniqueness test
>>>>>>> 2ea22dc (completion of User password and Editing User details)
            final String CHECK_CONFLICT =
                    "SELECT user_id FROM user " +
                            "WHERE (LOWER(user_name) = LOWER(?) OR LOWER(email) = LOWER(?)) " +
                            "AND user_id != ?";
<<<<<<< HEAD

=======
            // Preparing SQL statement for checking already existing user
            final String CHECK_CONFLICT = "SELECT user_id FROM user WHERE (LOWER(user_name) = LOWER(?) OR LOWER(email) = LOWER(?)) AND user_id != ?";

            // placeholder placement of the values
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
=======

>>>>>>> 2ea22dc (completion of User password and Editing User details)
            try (PreparedStatement checkStmt = conn.prepareStatement(CHECK_CONFLICT)) {
                checkStmt.setString(1, updatedUser.getUserName());
                checkStmt.setString(2, updatedUser.getEmail());
                checkStmt.setInt(3, updatedUser.getUserId());

<<<<<<< HEAD
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
=======
>>>>>>> 2ea22dc (completion of User password and Editing User details)
                try (ResultSet rs = checkStmt.executeQuery()) {
                    if (rs.next()) return 2; // another user already owns this username/email
                }
            }

<<<<<<< HEAD
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
=======
            // STEP 2: Resolve the password to store
            // FIX: original called updatedUser.getPasswordHash(userId) — method takes no args.
            //      Now correctly calls the private getCurrentPasswordHash(int) helper instead.
            String passwordToStore = updatedUser.getPasswordHash();

            if (passwordToStore != null && !passwordToStore.isEmpty()) {
                if (!passwordToStore.startsWith("$2a$")) {
                    // Plain-text supplied → hash it before storing
                    passwordToStore = PasswordUtil.getHashPassword(passwordToStore);
                }
                // else: already a BCrypt hash → store as-is
            } else {
                // No new password provided → preserve whatever is currently in the DB
                passwordToStore = getCurrentPasswordHash(updatedUser.getUserId());
                if (passwordToStore == null) {
                    return 4; // user ID not found in DB
                }
            }

            // STEP 3: Execute the update
>>>>>>> 2ea22dc (completion of User password and Editing User details)
            final String UPDATE_USER =
                    "UPDATE user " +
                            "SET user_name    = ?, " +
                            "    email        = ?, " +
                            "    phone_number = ?, " +
<<<<<<< HEAD
<<<<<<< HEAD
                            "    password     = ?, " +
                            "    user_role    = ? " +
=======
                            "    user_role    = ? " +  // Preserved from session — not user-editable
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
=======
                            "    password     = ?, " +
                            "    user_role    = ? " +
>>>>>>> 2ea22dc (completion of User password and Editing User details)
                            "WHERE user_id = ?";

            try (PreparedStatement updateStmt = conn.prepareStatement(UPDATE_USER)) {
                updateStmt.setString(1, updatedUser.getUserName());
                updateStmt.setString(2, updatedUser.getEmail());
                updateStmt.setString(3, updatedUser.getPhoneNumber());
<<<<<<< HEAD
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
=======
                updateStmt.setString(4, passwordToStore);
                updateStmt.setString(5, updatedUser.getUserRole());
                updateStmt.setInt(6, updatedUser.getUserId());

                int rows = updateStmt.executeUpdate();
                return rows > 0 ? 1 : 0;
>>>>>>> 2ea22dc (completion of User password and Editing User details)
            }

        } catch (SQLException ex) {
            System.out.println("updateUser error: " + ex.getLocalizedMessage());
            ex.printStackTrace();
<<<<<<< HEAD
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
=======
            return 3;
>>>>>>> 2ea22dc (completion of User password and Editing User details)
        }
    }

    // -------------------------------------------------------------------------
    // Private helpers
    // -------------------------------------------------------------------------

<<<<<<< HEAD
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
=======
    /**
     * Fetches the current BCrypt password hash for a given user ID directly
     * from the database.
     *
     * <p>Used by {@link #updateUser(User)} when no new password is provided,
     * so the existing hash is preserved rather than overwritten with {@code null}.</p>
     *
     * @param userId the primary key of the user whose hash to retrieve
     * @return the stored BCrypt hash, or {@code null} if the user is not found
     *         or a SQL error occurs
     */
>>>>>>> 2ea22dc (completion of User password and Editing User details)
    private String getCurrentPasswordHash(int userId) {
        final String SELECT_PASS = "SELECT password FROM user WHERE user_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(SELECT_PASS)) {
            stmt.setInt(1, userId);
<<<<<<< HEAD
<<<<<<< HEAD
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) return rs.getString("password");
=======

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("password");
                }
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
=======
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) return rs.getString("password");
>>>>>>> 2ea22dc (completion of User password and Editing User details)
            }
        } catch (SQLException e) {
            System.out.println("getCurrentPasswordHash error: " + e.getMessage());
        }
        return null;
    }


    /**
<<<<<<< HEAD
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
=======
     *
     * @param userID int the user id for which password is to be changed
     * @param updatedPassword String, new password
     * @return {@code 1 } for single row affected with successful execution, {@code 0} meaning user id is incorrect and no row affected, {@code 3 } sql error
     * @throws SQLException
>>>>>>> 2ea22dc (completion of User password and Editing User details)
     */
    public int updateUserPassword(int userID, String updatedPassword) throws SQLException {

        final String PASS_UPDATE_QUERY = "UPDATE user SET password = ? WHERE user_id = ?;";

        try(PreparedStatement statement = conn.prepareStatement(PASS_UPDATE_QUERY)){
            statement.setString(1,updatedPassword);
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
            // SQL Error
            return 3;
    }

    }
}
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
