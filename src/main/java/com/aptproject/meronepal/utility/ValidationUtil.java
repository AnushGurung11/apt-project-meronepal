package com.aptproject.meronepal.utility;

import java.util.regex.Pattern;
import jakarta.servlet.http.Part;

/**
 * Utility class for validating user input fields.
 * Provides regex-based checks for registration, login, and file uploads.
 */
public class ValidationUtil {

    /**
     * Checks if a string is null or contains only whitespace.
     *
     * @param value {@code String}: the string to check
     * @return {@code boolean}: true if value is null or empty after trim, false otherwise
     */
    public static boolean isNullOrEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    /**
     * Checks if a string contains only alphabetic characters (a-z, A-Z).
     *
     * @param value {@code String}: the string to validate
     * @return {@code boolean}: true if value matches {@code ^[a-zA-Z]+$}, false otherwise
     */
    public static boolean isAlphabetic(String value) {
        return value != null && value.matches("^[a-zA-Z]+$");
    }

    /**
     * Validates an email address format using regex.
     *
     * @param email {@code String}: the email address to validate
     * @return {@code boolean}: true if email matches the pattern, false otherwise
     */
    public static boolean isValidEmail(String email) {
        String emailRegex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
        return email != null && Pattern.matches(emailRegex, email);
    }

    /**
     * Validates password complexity: 6+ chars, 1 uppercase, 1 digit, 1 special char.
     *
     * @param password {@code String}: the password to validate
     * @return {@code boolean}: true if password meets all requirements, false otherwise
     */
    public static boolean isValidPassword(String password) {
        String passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{6,}$";
        return password != null && password.matches(passwordRegex);
    }



    /**
     * Checks if two password strings match exactly.
     *
     * @param password {@code String}: the original password
     * @param retypePassword {@code String}: the confirmation password
     * @return {@code boolean}: true if both strings are equal and non-null
     */
    public static boolean doPasswordsMatch(String password, String retypePassword) {
        return password != null && password.equals(retypePassword);
    }

    /**
     * Validates a Nepali mobile phone number: exactly 10 digits, starts with 9.
     *
     * @param phoneNumber {@code String}: the phone number to validate
     * @return {@code boolean}: true if number is 10 digits and starts with 9, false otherwise
     */
    public static boolean isValidPhone(String phoneNumber) {
        if (phoneNumber == null || phoneNumber.length() != 10) {
            return false;
        }
        if (phoneNumber.charAt(0) != '9') {
            return false;
        }
        for (char c : phoneNumber.toCharArray()) {
            if (!Character.isDigit(c)) {
                return false;
            }
        }
        return true;
    }
}