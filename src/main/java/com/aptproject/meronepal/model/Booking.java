package com.aptproject.meronepal.model;

import java.time.LocalDate;

public class Booking {

    private int bookingId;
    private int userId;
    private int packageId;
    private LocalDate bookingDate;
    private LocalDate payDate;
    private LocalDate eventDate;
    private String status;

    // No-arg constructor
    public Booking() {
        this.status = "Pending";
    }

    /**
     *
     * @param bookingId
     * @param userId
     * @param packageId
     * @param bookingDate
     * @param payDate
     * @param eventDate
     * @param status
     *
     *
     */

    // All-arg constructor
    public Booking(int bookingId, int userId, int packageId,
                   LocalDate bookingDate, LocalDate payDate,
                   LocalDate eventDate, String status) {
        this.bookingId = bookingId;
        this.userId = userId;
        this.packageId = packageId;
        this.bookingDate = bookingDate;
        this.payDate = payDate;
        this.eventDate = eventDate;
        this.status = status;
    }

    // Convenience constructor (without bookingId — for new records before DB insert)
    public Booking(int userId, int packageId, LocalDate bookingDate,
                   LocalDate payDate, LocalDate eventDate) {
        this.userId = userId;
        this.packageId = packageId;
        this.bookingDate = bookingDate;
        this.payDate = payDate;
        this.eventDate = eventDate;
        this.status = "Pending";
    }

    // Getters
    public int getBookingId()          { return bookingId; }
    public int getUserId()             { return userId; }
    public int getPackageId()          { return packageId; }
    public LocalDate getBookingDate()  { return bookingDate; }
    public LocalDate getPayDate()      { return payDate; }
    public LocalDate getEventDate()    { return eventDate; }
    public String getStatus()          { return status; }

    // Setters
    public void setBookingId(int bookingId)           { this.bookingId = bookingId; }
    public void setUserId(int userId)                 { this.userId = userId; }
    public void setPackageId(int packageId)           { this.packageId = packageId; }
    public void setBookingDate(LocalDate bookingDate) { this.bookingDate = bookingDate; }
    public void setPayDate(LocalDate payDate)         { this.payDate = payDate; }
    public void setEventDate(LocalDate eventDate)     { this.eventDate = eventDate; }
    public void setStatus(String status)              { this.status = status; }

    @Override
    public String toString() {
        return "Booking{" +
                "bookingId=" + bookingId +
                ", userId=" + userId +
                ", packageId=" + packageId +
                ", bookingDate=" + bookingDate +
                ", payDate=" + payDate +
                ", eventDate=" + eventDate +
                ", status='" + status + '\'' +
                '}';
    }
}
