package com.aptproject.meronepal.model;

import java.time.LocalDate;

public class Testimony {

    private int testimonyId;
    private int bookingId;          // UNIQUE — enforces 0 or 1 testimony per booking
    private String message;         // nullable
    private int rating;             // 1–5; use 0 to represent "not set"
    private LocalDate testimonyDate;

    // No-arg constructor
    public Testimony() {}

    // All-arg constructor
    public Testimony(int testimonyId, int bookingId, String message,
                     int rating, LocalDate testimonyDate) {
        this.testimonyId = testimonyId;
        this.bookingId = bookingId;
        this.message = message;
        setRating(rating);          // use setter to apply validation
        this.testimonyDate = testimonyDate;
    }

    // Convenience constructor (without testimonyId — for new records before DB insert)
    public Testimony(int bookingId, String message, int rating, LocalDate testimonyDate) {
        this.bookingId = bookingId;
        this.message = message;
        setRating(rating);
        this.testimonyDate = testimonyDate;
    }

    // Getters
    public int getTestimonyId()         { return testimonyId; }
    public int getBookingId()           { return bookingId; }
    public String getMessage()          { return message; }
    public int getRating()              { return rating; }
    public LocalDate getTestimonyDate() { return testimonyDate; }

    // Setters
    public void setTestimonyId(int testimonyId)           { this.testimonyId = testimonyId; }
    public void setBookingId(int bookingId)               { this.bookingId = bookingId; }
    public void setMessage(String message)                 { this.message = message; }

    /**
     * Mirrors the DB CHECK constraint: rating must be between 1 and 5.
     * Pass 0 to leave the rating unset.
     */
    public void setRating(int rating) {
        if (rating != 0 && (rating < 1 || rating > 5)) {
            throw new IllegalArgumentException("Rating must be between 1 and 5 (or 0 if unset).");
        }
        this.rating = rating;
    }

    public void setTestimonyDate(LocalDate testimonyDate) { this.testimonyDate = testimonyDate; }

    @Override
    public String toString() {
        return "Testimony{" +
                "testimonyId=" + testimonyId +
                ", bookingId=" + bookingId +
                ", message='" + message + '\'' +
                ", rating=" + rating +
                ", testimonyDate=" + testimonyDate +
                '}';
    }
}
