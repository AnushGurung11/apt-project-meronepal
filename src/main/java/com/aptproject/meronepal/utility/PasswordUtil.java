package com.aptproject.meronepal.utility;

import org.mindrot.jbcrypt.BCrypt;

/**
 * Utility class for password hashing and verification using BCrypt.
 * Uses a work factor of {@code 10} for balanced security and performance.
 */
public class PasswordUtil {

    // Work factor for BCrypt hashing (2^10 iterations)
    private final static int COST = 10;

    /**
     * Hashes a plain text password using BCrypt.
     *
     * @param inputPassword {@code String}: plain text password to hash
     * @return {@code String}: BCrypt-hashed password with embedded salt
     *
     * Uses {@code COST = 10} for work factor (2^10 iterations).
     */
    public static String getHashPassword(String inputPassword){
        // Generate salt with configured work factor
        String salt = BCrypt.gensalt(COST);
        // Hash password with the generated salt
        return BCrypt.hashpw(inputPassword, salt);
    }

    /**
     * Verifies a typed password against a stored BCrypt hash.
     *
     * @param passwordTyped  {@code String}: plain text password from user input
     * @param hashedPassword {@code String}: stored BCrypt hash to compare against
     * @return {@code boolean}: true if passwords match, false otherwise
     */
    public static boolean checkPassword(String passwordTyped, String hashedPassword){
        System.out.println("Matching Password");
        return BCrypt.checkpw(passwordTyped, hashedPassword);
    }
}