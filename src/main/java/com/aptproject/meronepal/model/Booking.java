package com.aptproject.meronepal.model;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Booking {

    // --- existing core fields ---
    private int bookingId;
    private int userId;
    private int packageId;
    private LocalDate bookingDate;
    private LocalDate payDate;
    private LocalDate eventDate;
    private String eventAddress;
    private String notes;
    private String status;

    // --- joined fields (populated by getAllBooking) ---
    private String userName;
    private String email;
    private String phoneNumber;
    private String packageName;
    private String services;        // e.g. "Photography, Catering, DJ"
    private String paymentStatus;   // Unpaid / Partial / Paid / Refunded
    private BigDecimal amount;
    private String paymentMethod;

    // --- aggregation / computed field (not a DB column) ---
    private int bookingCount;

    public int getBookingCount()                      { return bookingCount; }
    public void setBookingCount(int bookingCount)     { this.bookingCount = bookingCount; }
    // ----------------------------------------------------------------
    // Constructors
    // ----------------------------------------------------------------

    public Booking() {
        this.status = "Pending";
    }

    // All-arg constructor for core DB fields only
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

    // Convenience constructor (new record before DB insert)
    public Booking(int userId, int packageId, LocalDate bookingDate,
                   LocalDate payDate, LocalDate eventDate) {
        this.userId      = userId;
        this.packageId   = packageId;
        this.bookingDate = bookingDate;
        this.payDate     = payDate;
        this.eventDate   = eventDate;
        this.status      = "Pending";
    }

    // ----------------------------------------------------------------
    // Getters — core
    // ----------------------------------------------------------------
    public int getBookingId()         { return bookingId; }
    public int getUserId()            { return userId; }
    public int getPackageId()         { return packageId; }
    public LocalDate getBookingDate() { return bookingDate; }
    public LocalDate getPayDate()     { return payDate; }
    public LocalDate getEventDate()   { return eventDate; }
    public String getEventAddress()   { return eventAddress; }
    public String getNotes()          { return notes; }
    public String getStatus()         { return status; }

    // Getters — joined
    public String getUserName()       { return userName; }
    public String getEmail()          { return email; }
    public String getPhoneNumber()    { return phoneNumber; }
    public String getPackageName()    { return packageName; }
    public String getServices()       { return services; }
    public String getPaymentStatus()  { return paymentStatus; }
    public BigDecimal getAmount()     { return amount; }
    public String getPaymentMethod()  { return paymentMethod; }

    // ----------------------------------------------------------------
    // Setters — core
    // ----------------------------------------------------------------
    public void setBookingId(int bookingId)             { this.bookingId = bookingId; }
    public void setUserId(int userId)                   { this.userId = userId; }
    public void setPackageId(int packageId)             { this.packageId = packageId; }
    public void setBookingDate(LocalDate bookingDate)   { this.bookingDate = bookingDate; }
    public void setPayDate(LocalDate payDate)           { this.payDate = payDate; }
    public void setEventDate(LocalDate eventDate)       { this.eventDate = eventDate; }
    public void setEventAddress(String eventAddress)    { this.eventAddress = eventAddress; }
    public void setNotes(String notes)                  { this.notes = notes; }
    public void setStatus(String status)                { this.status = status; }

    // Setters — joined
    public void setUserName(String userName)            { this.userName = userName; }
    public void setEmail(String email)                  { this.email = email; }
    public void setPhoneNumber(String phoneNumber)      { this.phoneNumber = phoneNumber; }
    public void setPackageName(String packageName)      { this.packageName = packageName; }
    public void setServices(String services)            { this.services = services; }
    public void setPaymentStatus(String paymentStatus)  { this.paymentStatus = paymentStatus; }
    public void setAmount(BigDecimal amount)            { this.amount = amount; }
    public void setPaymentMethod(String paymentMethod)  { this.paymentMethod = paymentMethod; }

    // ── Add this field + getter + setter to your existing Booking.java ──
// Place the field alongside the other joined fields (around line 20),
// and the getter/setter alongside the other joined getters/setters.

    // ── Field ──────────────────────────────────────────────────────────
    private BigDecimal packagePrice;   // p.price — the package's catalogue price

    // ── Getter ─────────────────────────────────────────────────────────
    public BigDecimal getPackagePrice()                   { return packagePrice; }

    // ── Setter ─────────────────────────────────────────────────────────
    public void setPackagePrice(BigDecimal packagePrice)  { this.packagePrice = packagePrice; }

    // ----------------------------------------------------------------
    // toString
    // ----------------------------------------------------------------
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
}