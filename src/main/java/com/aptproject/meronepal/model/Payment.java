package com.aptproject.meronepal.model;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * Model class representing a payment record.
 * Holds payment details linked to a booking via {@code bookingId}.
 */
public class Payment {

    // Core payment fields mapped to Payment table columns
    private int paymentId;
    private int bookingId;
    private BigDecimal amount;
    private String paymentMethod;
    private String paymentStatus;
    private LocalDate paymentDate;

    // Constructors

    /**
     * Default constructor — initializes status to {@code "Unpaid"}.
     */
    public Payment() {
        this.paymentStatus = "Unpaid";
    }

    /**
     * Constructor with all fields.
     *
     * @param paymentId      {@code int}: unique payment identifier
     * @param bookingId      {@code int}: ID of the linked booking
     * @param amount         {@code BigDecimal}: payment amount
     * @param paymentMethod  {@code String}: method used for payment
     * @param paymentStatus  {@code String}: current payment status
     * @param paymentDate    {@code LocalDate}: date payment was made
     */
    public Payment(int paymentId, int bookingId, BigDecimal amount,
                   String paymentMethod, String paymentStatus, LocalDate paymentDate) {
        this.paymentId = paymentId;
        this.bookingId = bookingId;
        this.amount = amount;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.paymentDate = paymentDate;
    }

    /**
     * Constructor for new payments before DB insert (no ID yet).
     * Status defaults to {@code "Unpaid"}.
     *
     * @param bookingId      {@code int}: ID of the linked booking
     * @param amount         {@code BigDecimal}: payment amount
     * @param paymentMethod  {@code String}: method used for payment
     * @param paymentDate    {@code LocalDate}: date payment was made
     */
    public Payment(int bookingId, BigDecimal amount,
                   String paymentMethod, LocalDate paymentDate) {
        this.bookingId = bookingId;
        this.amount = amount;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = "Unpaid";
        this.paymentDate = paymentDate;
    }

    // Getters

    public int getBookingId()           { return bookingId; }
    public BigDecimal getAmount()       { return amount; }

    // Setters

    public void setBookingId(int bookingId)             { this.bookingId = bookingId; }
    public void setAmount(BigDecimal amount)            { this.amount = amount; }

    // toString for debugging and logging

    @Override
    public String toString() {
        return "Payment{" +
                "paymentId=" + paymentId +
                ", bookingId=" + bookingId +
                ", amount=" + amount +
                ", paymentMethod='" + paymentMethod + '\'' +
                ", paymentStatus='" + paymentStatus + '\'' +
                ", paymentDate=" + paymentDate +
                '}';
    }
    // Getters — ADD ALL OF THESE

    public int getPaymentId()                   { return paymentId; }
    public String getPaymentMethod()            { return paymentMethod; }
    public String getPaymentStatus()            { return paymentStatus; }
    public LocalDate getPaymentDate()           { return paymentDate; }

// Setters — ADD ALL OF THESE

    public void setPaymentId(int paymentId)             { this.paymentId = paymentId; }
    public void setPaymentMethod(String paymentMethod)  { this.paymentMethod = paymentMethod; }
    public void setPaymentStatus(String paymentStatus)  { this.paymentStatus = paymentStatus; }
    public void setPaymentDate(LocalDate paymentDate)   { this.paymentDate = paymentDate; }

}