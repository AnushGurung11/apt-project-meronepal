package com.aptproject.meronepal.dao.interfaces;
import com.aptproject.meronepal.model.Service;


public interface ServiceDAOInterface {
    //get service
    Service getService (String service);
    // Create a new Service
    int insertService(String serviceName, String serviceType, String description);

}
