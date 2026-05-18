package com.aptproject.meronepal.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Model class representing a service package.
 * Holds package details and a list of associated {@code Service} objects.
 */
public class Package {

    // Core package fields
    private int packageId;
    private String packageName;
    private String description;
    private BigDecimal price;
    private List<Service> services;

    // Constructors

    /**
     * Default constructor — initializes empty services list.
     */
    public Package() {
        this.services = new ArrayList<>();
    }

    /**
     * Constructor with all core fields.
     *
     * @param packageId   {@code int}: unique package identifier
     * @param packageName {@code String}: name of the package
     * @param description {@code String}: package description
     * @param price       {@code BigDecimal}: package price
     */
    public Package(int packageId, String packageName, String description, BigDecimal price) {
        this.packageId = packageId;
        this.packageName = packageName;
        this.description = description;
        this.price = price;
        this.services = new ArrayList<>();
    }

    /**
     * Constructor for new packages before DB insert (no ID yet).
     *
     * @param packageName {@code String}: name of the package
     * @param description {@code String}: package description
     * @param price       {@code BigDecimal}: package price
     */
    public Package(String packageName, String description, BigDecimal price) {
        this.packageName = packageName;
        this.description = description;
        this.price = price;
        this.services = new ArrayList<>();
    }

    // Getters

    public int getPackageId()               { return packageId; }
    public String getPackageName()          { return packageName; }
    public String getDescription()          { return description; }
    public BigDecimal getPrice()            { return price; }
    public List<Service> getServices()      { return services; }

    // Setters

    public void setPackageId(int packageId)                 { this.packageId = packageId; }
    public void setPackageName(String packageName)          { this.packageName = packageName; }
    public void setDescription(String description)          { this.description = description; }
    public void setPrice(BigDecimal price)                  { this.price = price; }
    public void setServices(List<Service> services)         { this.services = services; }


    // toString for debugging and logging

    @Override
    public String toString() {
        return "Package{" +
                "packageId=" + packageId +
                ", packageName='" + packageName + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", services=" + services +
                '}';
    }
}