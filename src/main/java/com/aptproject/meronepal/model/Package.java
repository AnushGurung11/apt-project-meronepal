package com.aptproject.meronepal.model;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Package {

    private int packageId;
    private String packageName;
    private String description;
    private BigDecimal price;
    private List<Service> services;

    public Package() {
        this.services = new ArrayList<>();
    }

    // All-arg constructor
    public Package(int packageId, String packageName, String description, BigDecimal price) {
        this.packageId = packageId;
        this.packageName = packageName;
        this.description = description;
        this.price = price;
        this.services = new ArrayList<>();
    }

    // Convenience constructor (without packageId — for new records before DB insert)
    public Package(String packageName, String description, BigDecimal price) {
        this.packageName = packageName;
        this.description = description;
        this.price = price;
        this.services = new ArrayList<>();
    }

    // Getters
    public int getPackageId()       { return packageId; }
    public String getPackageName()  { return packageName; }
    public String getDescription()  { return description; }
    public BigDecimal getPrice()    { return price; }
    public List<Service> getServices() { return services; }

    public void setPackageId(int packageId)         { this.packageId = packageId; }
    public void setPackageName(String packageName)   { this.packageName = packageName; }
    public void setDescription(String description)   { this.description = description; }
    public void setPrice(BigDecimal price)           { this.price = price; }
    public void setServices(List<Service> services)  { this.services = services; }

    // Helper method to add a single service
    public void addService(Service service) {
        if (this.services == null) {
            this.services = new ArrayList<>();
        }
        this.services.add(service);
    }
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
