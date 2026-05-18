package com.aptproject.meronepal.dao;

import com.aptproject.meronepal.dao.interfaces.ServiceDAOInterface;
import com.aptproject.meronepal.model.Service;
import com.aptproject.meronepal.utility.DBConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceDAO implements ServiceDAOInterface {
    private Connection conn;

    public ServiceDAO() {
        try {
            conn = DBConfig.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
    }

    @Override
    public Service getService(String service) {
        try {
            final String SELECT_SERVICE = "SELECT * FROM Services WHERE service_name = ?;";
            PreparedStatement pStm = conn.prepareStatement(SELECT_SERVICE);
            pStm.setString(1, service);
            ResultSet rs = pStm.executeQuery();
            if (rs.next()) {
                Service s = new Service();
                s.setServiceId(rs.getInt("service_id"));
                s.setServiceName(rs.getString("service_name"));
                s.setServiceType(rs.getString("service_type"));
                s.setDescription(rs.getString("description"));
                return s;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
        return null;
    }

    /** Returns every active service in the database. */
    public List<Service> getAllServices() {
        List<Service> services = new ArrayList<>();
        try {
            final String SQL = "SELECT * FROM Services WHERE is_active = 1 ORDER BY service_id;";
            PreparedStatement pStm = conn.prepareStatement(SQL);
            ResultSet rs = pStm.executeQuery();
            while (rs.next()) {
                Service s = new Service();
                s.setServiceId(rs.getInt("service_id"));
                s.setServiceName(rs.getString("service_name"));
                s.setServiceType(rs.getString("service_type"));
                s.setDescription(rs.getString("description"));
                services.add(s);
            }
            pStm.close();
        } catch (SQLException ex) {
            System.out.println("Error fetching all services: " + ex.getLocalizedMessage());
        }
        return services;
    }

    /**
     * Soft-deletes a service by setting is_active = 0.
     * Returns the number of rows affected (1 on success, 0 on failure).
     */
    public int deleteService(int serviceId) {
        try {
            final String SQL = "UPDATE Services SET is_active = 0 WHERE service_id = ?;";
            PreparedStatement pStm = conn.prepareStatement(SQL);
            pStm.setInt(1, serviceId);
            int rows = pStm.executeUpdate();
            pStm.close();
            return rows;
        } catch (SQLException ex) {
            System.out.println("Error deleting service: " + ex.getLocalizedMessage());
            return 0;
        }
    }

    @Override
    public int insertService(String serviceName, String serviceType, String description) {
        try {
            final String INSERT_SERVICE =
                    "INSERT INTO Services (service_name, service_type, description) VALUES (?, ?, ?);";
            PreparedStatement pStm = conn.prepareStatement(INSERT_SERVICE);
            pStm.setString(1, serviceName);
            pStm.setString(2, serviceType);
            pStm.setString(3, description);
            int rows = pStm.executeUpdate();
            pStm.close();
            return rows;
        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
            return 0;
        }
    }
}
