package com.aptproject.meronepal.dao;

import com.aptproject.meronepal.dao.interfaces.PackageDAOInterface;
import com.aptproject.meronepal.model.Package;
import com.aptproject.meronepal.model.Service;
import com.aptproject.meronepal.utility.DBConfig;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * DAO for managing package data in the database.
 * Handles CRUD operations for the {@code package} table and package-service relationships.
 */
public class PackageDAO implements PackageDAOInterface {

    private Connection conn;

    /**
     * Constructor — initializes database connection via {@code DBConfig}.
     * Catches and logs {@code SQLException} or {@code ClassNotFoundException}.
     */
    public PackageDAO() {
        try {
            conn = DBConfig.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
    }

    /**
     * Inserts a new package record and returns the generated ID.
     *
     * @param packageName {@code String}: name of the package
     * @param description {@code String}: package description
     * @param price {@code BigDecimal}: package price
     * @return {@code int}: auto-generated {@code package_id} on success, {@code -1} on failure
     */
    public int insertPackage(String packageName, String description, BigDecimal price) {
        try {
            final String SQL =
                    "INSERT INTO Package (package_name, description, price) VALUES (?, ?, ?);";
            PreparedStatement pStm = conn.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
            pStm.setString(1, packageName);
            pStm.setString(2, description);
            pStm.setBigDecimal(3, price);

            int rows = pStm.executeUpdate();
            if (rows > 0) {
                ResultSet keys = pStm.getGeneratedKeys();
                if (keys.next()) {
                    int generatedId = keys.getInt(1);
                    pStm.close();
                    return generatedId;
                }
            }
            pStm.close();
        } catch (SQLException ex) {
            System.out.println("Error inserting package: " + ex.getLocalizedMessage());
        }
        return -1;
    }

    /**
     * Fetches all active packages with their associated active services.
     *
     * @return {@code List<Package>}: list of packages with services populated, empty list on error
     */
    public List<Package> getAllPackagesWithServices() {
        Map<Integer, Package> packageMap = new LinkedHashMap<>();
        try {
            final String SQL =
                    "SELECT p.package_id, p.package_name, p.description, p.price, p.is_active, " +
                            "       s.service_id, s.service_name, s.service_type, s.description AS service_description " +
                            "FROM Package p " +
                            "LEFT JOIN Package_Service ps ON p.package_id = ps.package_id " +
                            "LEFT JOIN Services s ON ps.service_id = s.service_id " +
                            "WHERE p.is_active = 1 AND (s.is_active = 1 OR s.service_id IS NULL) " +
                            "ORDER BY p.package_id, s.service_id;";

            PreparedStatement pStm = conn.prepareStatement(SQL);
            ResultSet rs = pStm.executeQuery();
            while (rs.next()) {
                int packageId = rs.getInt("package_id");
                Package pkg = packageMap.get(packageId);
                if (pkg == null) {
                    pkg = new Package();
                    pkg.setPackageId(packageId);
                    pkg.setPackageName(rs.getString("package_name"));
                    pkg.setDescription(rs.getString("description"));
                    pkg.setPrice(rs.getBigDecimal("price"));
                    pkg.setServices(new ArrayList<>());
                    packageMap.put(packageId, pkg);
                }
                int serviceId = rs.getInt("service_id");
                if (serviceId > 0) {
                    Service service = new Service();
                    service.setServiceId(serviceId);
                    service.setServiceName(rs.getString("service_name"));
                    service.setServiceType(rs.getString("service_type"));
                    service.setDescription(rs.getString("service_description"));
                    pkg.getServices().add(service);
                }
            }
            pStm.close();
        } catch (SQLException ex) {
            System.out.println("Error fetching packages with services: " + ex.getLocalizedMessage());
            return new ArrayList<>();
        }
        return new ArrayList<>(packageMap.values());
    }

    /**
     * Fetches a single active package by ID with its associated services.
     *
     * @param packageId {@code int}: ID of the package to fetch
     * @return {@code Package}: package with services populated, {@code null} if not found or on error
     */
    public Package getPackageByIdWithServices(int packageId) {
        Package pkg = null;
        try {
            final String SQL =
                    "SELECT p.package_id, p.package_name, p.description, p.price, " +
                            "       s.service_id, s.service_name, s.service_type, s.description AS service_description " +
                            "FROM Package p " +
                            "LEFT JOIN Package_Service ps ON p.package_id = ps.package_id " +
                            "LEFT JOIN Services s ON ps.service_id = s.service_id " +
                            "WHERE p.package_id = ? AND p.is_active = 1;";

            PreparedStatement pStm = conn.prepareStatement(SQL);
            pStm.setInt(1, packageId);
            ResultSet rs = pStm.executeQuery();
            while (rs.next()) {
                if (pkg == null) {
                    pkg = new Package();
                    pkg.setPackageId(rs.getInt("package_id"));
                    pkg.setPackageName(rs.getString("package_name"));
                    pkg.setDescription(rs.getString("description"));
                    pkg.setPrice(rs.getBigDecimal("price"));
                    pkg.setServices(new ArrayList<>());
                }
                int serviceId = rs.getInt("service_id");
                if (serviceId > 0) {
                    Service service = new Service();
                    service.setServiceId(serviceId);
                    service.setServiceName(rs.getString("service_name"));
                    service.setServiceType(rs.getString("service_type"));
                    service.setDescription(rs.getString("service_description"));
                    pkg.getServices().add(service);
                }
            }
            pStm.close();
        } catch (SQLException ex) {
            System.out.println("Error fetching package: " + ex.getLocalizedMessage());
        }
        return pkg;
    }

}