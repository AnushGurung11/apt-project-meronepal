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

/**
 * DAO for managing service data in the database.
 * Handles CRUD operations for the {@code Services} table.
 */
public class ServiceDAO implements ServiceDAOInterface {

    private Connection conn;

    /**
     * Constructor — initializes database connection via {@code DBConfig}.
     * Catches and logs {@code SQLException} or {@code ClassNotFoundException}.
     */
    public ServiceDAO() {
        try {
            conn = DBConfig.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
    }

    /**
     * Fetches a service by its name.
     *
     * @param service {@code String}: name of the service to look up
     * @return {@code Service}: service object if found, {@code null} otherwise
     */
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

    /**
     * Fetches all active services from the database.
     *
     * @return {@code List<Service>}: list of active services, empty list on error
     */
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
     * Soft-deletes a service by marking it inactive.
     *
     * @param serviceId {@code int}: ID of the service to deactivate
     * @return {@code int}: 1=success (row updated), 0=not found or error
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

    /**
     * Inserts a new service record into the database.
     *
     * @param serviceName {@code String}: name of the new service
     * @param serviceType {@code String}: type/category of the service
     * @param description {@code String}: description of the service
     * @return {@code int}: 1=success (row inserted), 0=error
     */
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