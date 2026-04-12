package com.aptproject.meronepal.model;

public class Service {

    private int serviceId;
    private String serviceName;
    private String serviceType;
    private String description;

    // No-arg constructor
    public Service() {}

    // All-arg constructor
    public Service(int serviceId, String serviceName, String serviceType, String description) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.serviceType = serviceType;
        this.description = description;
    }

    // Convenience constructor (without serviceId — for new records before DB insert)
    public Service(String serviceName, String serviceType, String description) {
        this.serviceName = serviceName;
        this.serviceType = serviceType;
        this.description = description;
    }

    // Getters
    public int getServiceId()      { return serviceId; }
    public String getServiceName() { return serviceName; }
    public String getServiceType() { return serviceType; }
    public String getDescription() { return description; }

    // Setters
    public void setServiceId(int serviceId)         { this.serviceId = serviceId; }
    public void setServiceName(String serviceName)   { this.serviceName = serviceName; }
    public void setServiceType(String serviceType)   { this.serviceType = serviceType; }
    public void setDescription(String description)   { this.description = description; }

    @Override
    public String toString() {
        return "Services{" +
                "serviceId=" + serviceId +
                ", serviceName='" + serviceName + '\'' +
                ", serviceType='" + serviceType + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
