package com.aptproject.meronepal.model;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * Model class representing a booking record.
 * Holds core booking data plus joined fields from related tables for display.
 */
public class Booking {

    // Core fields mapped to booking table columns
    private int bookingId;
    private int userId;
    private int packageId;
    private LocalDate bookingDate;
    private LocalDate payDate;
    private LocalDate eventDate;
    private String eventAddress;
    private String notes;
    private String status;

    // Joined fields from user, package, services, payment tables
    private String userName;
    private String email;
    private String phoneNumber;
    private String packageName;
    private BigDecimal packagePrice;
    private String services;
    private String paymentStatus;
    private BigDecimal amount;
    private String paymentMethod;

    // Computed field for aggregation queries
    private int bookingCount;

    // Constructors

    /**
     * Default constructor — initializes status to {@code "Pending"}.
     */
    public Booking() {
        this.status = "Pending";
    }

    /**
     * Constructor for core DB fields only.
     *
     * @param bookingId   {@code int}: unique booking identifier
     * @param userId      {@code int}: ID of the user who made the booking
     * @param packageId   {@code int}: ID of the booked package
     * @param bookingDate {@code LocalDate}: date booking was created
     * @param payDate     {@code LocalDate}: date payment was made
     * @param eventDate   {@code LocalDate}: date of the booked event
     * @param status      {@code String}: current booking status
     */
    public Booking(int bookingId, int userId, int packageId,
                   LocalDate bookingDate, LocalDate payDate,
                   LocalDate eventDate, String status) {
        this.bookingId   = bookingId;
        this.userId      = userId;
        this.packageId   = packageId;
        this.bookingDate = bookingDate;
        this.payDate     = payDate;
        this.eventDate   = eventDate;
        this.status      = status;
    }

    /**
     * Convenience constructor for new bookings before DB insert.
     * Status defaults to {@code "Pending"}.
     *
     * @param userId      {@code int}: ID of the user making the booking
     * @param packageId   {@code int}: ID of the package being booked
     * @param bookingDate {@code LocalDate}: date booking was created
     * @param payDate     {@code LocalDate}: date payment was made
     * @param eventDate   {@code LocalDate}: date of the booked event
     */
    public Booking(int userId, int packageId, LocalDate bookingDate,
                   LocalDate payDate, LocalDate eventDate) {
        this.userId      = userId;
        this.packageId   = packageId;
        this.bookingDate = bookingDate;
        this.payDate     = payDate;
        this.eventDate   = eventDate;
        this.status      = "Pending";
    }

    // Getters for core fields

    public int getBookingId()         { return bookingId; }
    public int getPackageId()         { return packageId; }
    public LocalDate getEventDate()   { return eventDate; }
    public String getNotes()          { return notes; }
    public String getStatus()         { return status; }

    // Getters for joined fields

    public String getUserName()       { return userName; }
    public String getEmail()          { return email; }
    public String getPhoneNumber()    { return phoneNumber; }
    public String getPackageName()    { return packageName; }
    public String getServices()       { return services; }
    public BigDecimal getAmount()     { return amount; }

    // Getter for computed field

    public int getBookingCount()      { return bookingCount; }

    // Setters for core fields

    public void setBookingId(int bookingId)             { this.bookingId = bookingId; }
    public void setUserId(int userId)                   { this.userId = userId; }
    public void setPackageId(int packageId)             { this.packageId = packageId; }
    public void setBookingDate(LocalDate bookingDate)   { this.bookingDate = bookingDate; }
    public void setEventDate(LocalDate eventDate)       { this.eventDate = eventDate; }
    public void setEventAddress(String eventAddress)    { this.eventAddress = eventAddress; }
    public void setNotes(String notes)                  { this.notes = notes; }
    public void setStatus(String status)                { this.status = status; }

    // Setters for joined fields

    public void setUserName(String userName)            { this.userName = userName; }
    public void setEmail(String email)                  { this.email = email; }
    public void setPhoneNumber(String phoneNumber)      { this.phoneNumber = phoneNumber; }
    public void setPackageName(String packageName)      { this.packageName = packageName; }
    public void setPackagePrice(BigDecimal packagePrice) { this.packagePrice = packagePrice; }
    public void setServices(String services)            { this.services = services; }
    public void setPaymentStatus(String paymentStatus)  { this.paymentStatus = paymentStatus; }
    public void setAmount(BigDecimal amount)            { this.amount = amount; }
    public void setPaymentMethod(String paymentMethod)  { this.paymentMethod = paymentMethod; }

    // Setter for computed field

    public void setBookingCount(int bookingCount)       { this.bookingCount = bookingCount; }

    // toString for debugging and logging

    @Override
    public String toString() {
        return "Booking{" +
                "bookingId="     + bookingId     +
                ", userId="      + userId        +
                ", packageId="   + packageId     +
                ", bookingDate=" + bookingDate   +
                ", eventDate="   + eventDate     +
                ", status='"     + status        + '\'' +
                ", userName='"   + userName      + '\'' +
                ", packageName='"+ packageName   + '\'' +
                ", services='"   + services      + '\'' +
                ", paymentStatus='" + paymentStatus + '\'' +
                '}';
    }

    // Getters for core fields — ADD THESE

    public int getUserId()                { return userId; }
    public LocalDate getBookingDate()     { return bookingDate; }
    public String getEventAddress()       { return eventAddress; }
    public LocalDate getPayDate()         { return payDate; }   // was missing getter AND setter

// Getters for joined fields — ADD THESE

    public BigDecimal getPackagePrice()   { return packagePrice; }
    public String getPaymentStatus()      { return paymentStatus; }
    public String getPaymentMethod()      { return paymentMethod; }

    // Setter — ADD THIS (payDate had no setter at all)
    public void setPayDate(LocalDate payDate) { this.payDate = payDate; }
}