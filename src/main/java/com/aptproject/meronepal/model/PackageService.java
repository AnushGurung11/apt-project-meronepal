package com.aptproject.meronepal.model;

public class PackageService {

    private int packageServiceId;
    private int packageId;
    private int serviceId;

    // No-arg constructor
    public PackageService() {}

    // All-arg constructor
    public PackageService(int packageServiceId, int packageId, int serviceId) {
        this.packageServiceId = packageServiceId;
        this.packageId = packageId;
        this.serviceId = serviceId;
    }

    // Convenience constructor (without packageServiceId — for new records before DB insert)
    public PackageService(int packageId, int serviceId) {
        this.packageId = packageId;
        this.serviceId = serviceId;
    }

    // Getters
    public int getPackageServiceId() { return packageServiceId; }
    public int getPackageId()        { return packageId; }
    public int getServiceId()        { return serviceId; }

    // Setters
    public void setPackageServiceId(int packageServiceId) { this.packageServiceId = packageServiceId; }
    public void setPackageId(int packageId)               { this.packageId = packageId; }
    public void setServiceId(int serviceId)               { this.serviceId = serviceId; }

    @Override
    public String toString() {
        return "PackageService{" +
                "packageServiceId=" + packageServiceId +
                ", packageId=" + packageId +
                ", serviceId=" + serviceId +
                '}';
    }
}