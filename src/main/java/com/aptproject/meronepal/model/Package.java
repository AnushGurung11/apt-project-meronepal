package com.aptproject.meronepal.model;
import java.math.BigDecimal;

public class Package {

    private int packageId;
    private String packageName;
    private String description;
    private BigDecimal price;

    // No-arg constructor
    public Package() {}

    // All-arg constructor
    public Package(int packageId, String packageName, String description, BigDecimal price) {
        this.packageId = packageId;
        this.packageName = packageName;
        this.description = description;
        this.price = price;
    }

    // Convenience constructor (without packageId — for new records before DB insert)
    public Package(String packageName, String description, BigDecimal price) {
        this.packageName = packageName;
        this.description = description;
        this.price = price;
    }

    // Getters
    public int getPackageId()       { return packageId; }
    public String getPackageName()  { return packageName; }
    public String getDescription()  { return description; }
    public BigDecimal getPrice()    { return price; }

    // Setters
    public void setPackageId(int packageId)         { this.packageId = packageId; }
    public void setPackageName(String packageName)   { this.packageName = packageName; }
    public void setDescription(String description)   { this.description = description; }
    public void setPrice(BigDecimal price)           { this.price = price; }

    @Override
    public String toString() {
        return "Package{" +
                "packageId=" + packageId +
                ", packageName='" + packageName + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                '}';
    }
}
