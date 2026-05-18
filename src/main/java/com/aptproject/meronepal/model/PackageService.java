package com.aptproject.meronepal.model;

public class PackageService {

    private int packageServiceId;
    private int packageId;
    private int serviceId;

    // Display-only fields populated by JOIN queries (not stored in DB)
    private String packageName;
    private String serviceName;

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
    public String getPackageName()   { return packageName; }
    public String getServiceName()   { return serviceName; }

    // Setters
    public void setPackageServiceId(int packageServiceId) { this.packageServiceId = packageServiceId; }
    public void setPackageId(int packageId)               { this.packageId = packageId; }
    public void setServiceId(int serviceId)               { this.serviceId = serviceId; }
    public void setPackageName(String packageName)        { this.packageName = packageName; }
    public void setServiceName(String serviceName)        { this.serviceName = serviceName; }

    @Override
    public String toString() {
        return "PackageService{" +
                "packageServiceId=" + packageServiceId +
                ", packageId=" + packageId +
                ", serviceId=" + serviceId +
                ", packageName='" + packageName + '\'' +
                ", serviceName='" + serviceName + '\'' +
                '}';
    }
}
