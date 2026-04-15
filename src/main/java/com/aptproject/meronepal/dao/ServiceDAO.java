package com.aptproject.meronepal.dao;

import com.aptproject.meronepal.dao.interfaces.ServiceDAOInterface;
import com.aptproject.meronepal.model.Service;
import com.aptproject.meronepal.utility.DBConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ServiceDAO implements ServiceDAOInterface{
    private Connection conn;

    public ServiceDAO(){
        try{
            conn = DBConfig.getConnection();
        }catch (SQLException | ClassNotFoundException ex){
            System.out.println(ex.getLocalizedMessage());
        }
    }

    @Override
    public Service getService(String service){
        try {
            final String SELECT_SERVICE = "select * from services where service_name=?;";

            PreparedStatement pStm_ = conn.prepareStatement(SELECT_SERVICE);
            pStm_.setString(1, service);
            ResultSet rs = pStm_.executeQuery();
            if (rs.next()) {
                final Service services = new Service();
                services.setServiceId(rs.getInt("service_id"));
                services.setServiceName(rs.getString("service_name"));
                services.setServiceType(rs.getString("service_type"));
                services.setDescription(rs.getString("description"));
                return services;
            }

        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
            return null;
        }
        return null;
    }
    //TODO Check for pre existing service and return that instead

    @Override
    public int insertService(String serviceName, String serviceType, String description){
        try {
            final String INSERT_SERVICE = "insert into services (service_name, service_type, description) values (?,?,?);";

            PreparedStatement pStm_ = conn.prepareStatement(INSERT_SERVICE);
            pStm_.setString(1, serviceName);
            pStm_.setString(2, serviceType);
            pStm_.setString(3, description);

            return pStm_.executeUpdate();

        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
            return 0;
        }
    }
}
