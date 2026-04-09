package com.aptproject.meronepal.model;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Payment {

    private int paymentId;
    private int bookingId;          // UNIQUE — enforces 1:1 with Booking
    private BigDecimal amount;
    private String paymentMethod;   // nullable
    private String paymentStatus;
    private LocalDate paymentDate;  // nullable

    // No-arg constructor
    public Payment() {
        this.paymentStatus = "Unpaid";
    }

    // All-arg constructor
    public Payment(int paymentId, int bookingId, BigDecimal amount,
                   String paymentMethod, String paymentStatus, LocalDate paymentDate) {
        this.paymentId = paymentId;
        this.bookingId = bookingId;
        this.amount = amount;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.paymentDate = paymentDate;
    }

    // Convenience constructor (without paymentId — for new records before DB insert)
    public Payment(int bookingId, BigDecimal amount,
                   String paymentMethod, LocalDate paymentDate) {
        this.bookingId = bookingId;
        this.amount = amount;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = "Unpaid";
        this.paymentDate = paymentDate;
    }

    // Getters
    public int getPaymentId()           { return paymentId; }
    public int getBookingId()           { return bookingId; }
    public BigDecimal getAmount()       { return amount; }
    public String getPaymentMethod()    { return paymentMethod; }
    public String getPaymentStatus()    { return paymentStatus; }
    public LocalDate getPaymentDate()   { return paymentDate; }

    // Setters
    public void setPaymentId(int paymentId)             { this.paymentId = paymentId; }
    public void setBookingId(int bookingId)             { this.bookingId = bookingId; }
    public void setAmount(BigDecimal amount)             { this.amount = amount; }
    public void setPaymentMethod(String paymentMethod)   { this.paymentMethod = paymentMethod; }
    public void setPaymentStatus(String paymentStatus)   { this.paymentStatus = paymentStatus; }
    public void setPaymentDate(LocalDate paymentDate)    { this.paymentDate = paymentDate; }

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
}
