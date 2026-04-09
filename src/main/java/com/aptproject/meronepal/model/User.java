package com.aptproject.meronepal.model;
import java.time.LocalDateTime;

public class User {

    private int userId;
    private String firstName;
    private String lastName;
    private String middleName;
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
    public User(int userId, String firstName, String lastName, String middleName,
                String email, String phoneNumber, String passwordHash,
                LocalDateTime createdAt, String userRole) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.middleName = middleName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.passwordHash = passwordHash;
        this.createdAt = createdAt;
        this.userRole = userRole;
    }

    // Convenience constructor (without userId — for new records before DB insert)
    public User(String firstName, String lastName, String middleName,
                String email, String phoneNumber, String passwordHash) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.middleName = middleName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.passwordHash = passwordHash;
        this.createdAt = LocalDateTime.now();
        this.userRole = "Customer";
    }

    // Getters
    public int getUserId()           { return userId; }
    public String getFirstName()     { return firstName; }
    public String getLastName()      { return lastName; }
    public String getMiddleName()    { return middleName; }
    public String getEmail()         { return email; }
    public String getPhoneNumber()   { return phoneNumber; }
    public String getPasswordHash()  { return passwordHash; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public String getUserRole()      { return userRole; }

    // Setters
    public void setUserId(int userId)               { this.userId = userId; }
    public void setFirstName(String firstName)       { this.firstName = firstName; }
    public void setLastName(String lastName)         { this.lastName = lastName; }
    public void setMiddleName(String middleName)     { this.middleName = middleName; }
    public void setEmail(String email)               { this.email = email; }
    public void setPhoneNumber(String phoneNumber)   { this.phoneNumber = phoneNumber; }
    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; }
    public void setCreatedAt(LocalDateTime createdAt){ this.createdAt = createdAt; }
    public void setUserRole(String userRole)         { this.userRole = userRole; }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", middleName='" + middleName + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", createdAt=" + createdAt +
                ", userRole='" + userRole + '\'' +
                '}';
    }
}
