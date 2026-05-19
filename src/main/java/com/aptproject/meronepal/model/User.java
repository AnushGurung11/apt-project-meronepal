package com.aptproject.meronepal.model;

import java.time.LocalDateTime;

/**
 * Model class representing a registered user.
 * Holds user account details mapped to the {@code user} table.
 */
public class User {

    // Core user fields mapped to user table columns
    private int userId;
    private String userName;
    private String email;
    private String phoneNumber;
    private String passwordHash;
    private LocalDateTime createdAt;
    private String userRole;

    // Constructors

    /**
     * Default constructor — initializes {@code createdAt} to now and {@code userRole} to {@code "Customer"}.
     */
    public User() {
        this.createdAt = LocalDateTime.now();
        this.userRole = "Customer";
    }

    /**
     * Constructor with all fields.
     *
     * @param userId        {@code int}: unique user identifier
     * @param userName      {@code String}: user's display name
     * @param email         {@code String}: user's email address
     * @param phoneNumber   {@code String}: user's phone number
     * @param passwordHash  {@code String}: BCrypt-hashed password
     * @param createdAt     {@code LocalDateTime}: account creation timestamp
     * @param userRole      {@code String}: user's role (e.g., Customer, Admin)
     */
    public User(int userId, String userName,
                String email, String phoneNumber, String passwordHash,
                LocalDateTime createdAt, String userRole) {
        this.userId = userId;
        this.userName = userName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.passwordHash = passwordHash;
        this.createdAt = createdAt;
        this.userRole = userRole;
    }

    /**
     * Constructor for new users before DB insert (no ID yet).
     * Initializes {@code createdAt} to now and {@code userRole} to {@code "Customer"}.
     *
     * @param userName      {@code String}: user's display name
     * @param email         {@code String}: user's email address
     * @param phoneNumber   {@code String}: user's phone number
     * @param passwordHash  {@code String}: BCrypt-hashed password
     */
    public User(String userName,
                String email, String phoneNumber, String passwordHash) {
        this.userName = userName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.passwordHash = passwordHash;
        this.createdAt = LocalDateTime.now();
        this.userRole = "Customer";
    }

    // Getters

    public int getUserId()                { return userId; }
    public String getUserName()           { return userName; }
    public String getEmail()              { return email; }
    public String getPhoneNumber()        { return phoneNumber; }
    public String getPasswordHash()       { return passwordHash; }
    public LocalDateTime getCreatedAt()   { return createdAt; }
    public String getUserRole()           { return userRole; }

    // Setters

    public void setUserId(int userId)                   { this.userId = userId; }
    public void setUserName(String userName)            { this.userName = userName; }
    public void setEmail(String email)                  { this.email = email; }
    public void setPhoneNumber(String phoneNumber)      { this.phoneNumber = phoneNumber; }
    public void setPasswordHash(String passwordHash)    { this.passwordHash = passwordHash; }
    public void setCreatedAt(LocalDateTime createdAt)   { this.createdAt = createdAt; }
    public void setUserRole(String userRole)            { this.userRole = userRole; }

    // toString for debugging and logging

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", createdAt=" + createdAt +
                ", userRole='" + userRole + '\'' +
                '}';
    }
}