package com.aptproject.meronepal.model;

/**
 * Model class representing a service offered in packages.
 * Holds service details mapped to the {@code Services} table.
 */
public class Service {

    // Core service fields mapped to Services table columns
    private int serviceId;
    private String serviceName;
    private String serviceType;
    private String description;

    // Constructors
<<<<<<< HEAD

    /**
     * Default constructor.
     */
    public Service() {
    }

    /**
     * Constructor with all fields.
     *
     * @param serviceId   {@code int}: unique service identifier
     * @param serviceName {@code String}: name of the service
     * @param serviceType {@code String}: type or category of service
     * @param description {@code String}: service description
=======

    /**
     * Default constructor.
     */
    public Service() {}

    /**
     * Constructor with all fields.
     *
     * @param serviceId    {@code int}: unique service identifier
     * @param serviceName  {@code String}: name of the service
     * @param serviceType  {@code String}: type or category of service
     * @param description  {@code String}: service description
>>>>>>> 108eb2e (backend-completion)
     */
    public Service(int serviceId, String serviceName, String serviceType, String description) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.serviceType = serviceType;
        this.description = description;
    }

    /**
     * Constructor for new services before DB insert (no ID yet).
     *
<<<<<<< HEAD
     * @param serviceName {@code String}: name of the service
     * @param serviceType {@code String}: type or category of service
     * @param description {@code String}: service description
=======
     * @param serviceName  {@code String}: name of the service
     * @param serviceType  {@code String}: type or category of service
     * @param description  {@code String}: service description
>>>>>>> 108eb2e (backend-completion)
     */
    public Service(String serviceName, String serviceType, String description) {
        this.serviceName = serviceName;
        this.serviceType = serviceType;
        this.description = description;
    }

    // Getters

<<<<<<< HEAD
    public int getServiceId() {
        return serviceId;
    } // ← was missing

    public String getServiceName() {
        return serviceName;
    }

    public String getServiceType() {
        return serviceType;
    }

    public String getDescription() {
        return description;
    }

    // Setters

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public void setDescription(String description) {
        this.description = description;
    }
=======
    public String getServiceName() { return serviceName; }
    public String getServiceType() { return serviceType; }
    public String getDescription() { return description; }

    // Setters

    public void setServiceId(int serviceId)           { this.serviceId = serviceId; }
    public void setServiceName(String serviceName)    { this.serviceName = serviceName; }
    public void setServiceType(String serviceType)    { this.serviceType = serviceType; }
    public void setDescription(String description)    { this.description = description; }
>>>>>>> 108eb2e (backend-completion)

    // toString for debugging and logging

    @Override
    public String toString() {
        return "Service{" +
                "serviceId=" + serviceId +
                ", serviceName='" + serviceName + '\'' +
                ", serviceType='" + serviceType + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}