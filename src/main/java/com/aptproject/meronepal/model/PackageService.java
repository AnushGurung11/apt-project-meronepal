package com.aptproject.meronepal.model;

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 108eb2e (backend-completion)
/**
 * Model class representing a package-service relationship.
 * Holds junction table fields plus display-only names from JOIN queries.
 */
<<<<<<< HEAD
=======
>>>>>>> a37e247 (admin service and packages view)
=======
>>>>>>> 108eb2e (backend-completion)
public class PackageService {

    // Core fields mapped to Package_Service table columns
    private int packageServiceId;
    private int packageId;
    private int serviceId;

    // Display-only fields populated by JOIN queries (not stored in DB)
    private String packageName;
    private String serviceName;
<<<<<<< HEAD
=======

    // Constructors

    /**
     * Default constructor.
     */
    public PackageService() {}
>>>>>>> a37e247 (admin service and packages view)

<<<<<<< HEAD
    // Constructors

    /**
     * Default constructor.
     */
    public PackageService() {
    }

    // Getters for core fields

    public int getPackageServiceId() {
        return packageServiceId;
    } // ← was missing

    public int getPackageId() {
        return packageId;
    }

    public int getServiceId() {
        return serviceId;
    } // ← was missing

    // Getters for display-only fields

    public String getPackageName() {
        return packageName;
    }

    public String getServiceName() {
        return serviceName;
    }

    // Setters for core fields

    public void setPackageServiceId(int packageServiceId) {
        this.packageServiceId = packageServiceId;
    }

    public void setPackageId(int packageId) {
        this.packageId = packageId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    // Setters for display-only fields

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

<<<<<<< HEAD
    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    // toString for debugging and logging
=======
    // Getters
    public int getPackageServiceId() { return packageServiceId; }
=======




    // Getters for core fields

>>>>>>> 108eb2e (backend-completion)
    public int getPackageId()        { return packageId; }

    // Getters for display-only fields

    public String getPackageName()   { return packageName; }
    public String getServiceName()   { return serviceName; }

    // Setters for core fields

    public void setPackageServiceId(int packageServiceId) { this.packageServiceId = packageServiceId; }
    public void setPackageId(int packageId)               { this.packageId = packageId; }
    public void setServiceId(int serviceId)               { this.serviceId = serviceId; }

    // Setters for display-only fields

    public void setPackageName(String packageName)        { this.packageName = packageName; }
    public void setServiceName(String serviceName)        { this.serviceName = serviceName; }
>>>>>>> a37e247 (admin service and packages view)

    // toString for debugging and logging

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

    // ADD THESE — both were missing despite setters being present

    public int getPackageServiceId() { return packageServiceId; }
    public int getServiceId()        { return serviceId; }
}