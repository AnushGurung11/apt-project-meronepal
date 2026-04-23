package com.aptproject.meronepal.model;
import java.time.LocalDateTime;

public class User {

    private int userId;
    private String userName;
    private String email;
    private String phoneNumber;
    private String passwordHash;
    private LocalDateTime createdAt;
    private String userRole;

    // No-arg constructor
    public User() {
        this.createdAt = LocalDateTime.now();
        this.userRole = "Customer";
    }

    // All-arg constructor
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

    // Convenience constructor (without userId — for new records before DB insert)
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
    public int getUserId()           { return userId; }
    public String getUserName()     { return userName; }
    public String getEmail()         { return email; }
    public String getPhoneNumber()   { return phoneNumber; }
    public String getPasswordHash()  { return passwordHash; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public String getUserRole()      { return userRole; }

    // Setters
    public void setUserId(int userId)               { this.userId = userId; }
    public void setUserName(String userName)       { this.userName = userName; }
    public void setEmail(String email)               { this.email = email; }
    public void setPhoneNumber(String phoneNumber)   { this.phoneNumber = phoneNumber; }
    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; }
    public void setCreatedAt(LocalDateTime createdAt){ this.createdAt = createdAt; }
    public void setUserRole(String userRole)         { this.userRole = userRole; }

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
