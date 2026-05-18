package com.aptproject.meronepal.dao;

import com.aptproject.meronepal.dao.interfaces.PackageServiceDAOInterface;
import com.aptproject.meronepal.model.PackageService;
import com.aptproject.meronepal.utility.DBConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * DAO for managing package-service relationships in the database.
 * Handles CRUD operations for the {@code Package_Service} junction table.
 */
public class PackageServiceDAO implements PackageServiceDAOInterface {
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 108eb2e (backend-completion)

    private Connection conn;

    /**
     * Constructor — initializes database connection via {@code DBConfig}.
     * Catches and logs {@code SQLException} or {@code ClassNotFoundException}.
     */
<<<<<<< HEAD
=======
    private Connection conn;

>>>>>>> a37e247 (admin service and packages view)
=======
>>>>>>> 108eb2e (backend-completion)
    public PackageServiceDAO() {
        try {
            conn = DBConfig.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
    }

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 108eb2e (backend-completion)
    /**
     * Fetches a single package-service link by its primary key.
     *
     * @param packageServiceID {@code int}: ID of the package-service link to fetch
     * @return {@code PackageService}: the link object if found, {@code null} otherwise
     */
<<<<<<< HEAD
=======
    /** Fetch a single PackageService row by its primary key. */
>>>>>>> a37e247 (admin service and packages view)
=======
>>>>>>> 108eb2e (backend-completion)
    @Override
    public PackageService getPackageService(int packageServiceID) {
        try {
            final String SQL = "SELECT * FROM Package_Service WHERE package_service_id = ?;";
            PreparedStatement pStm = conn.prepareStatement(SQL);
            pStm.setInt(1, packageServiceID);
            ResultSet rs = pStm.executeQuery();
            if (rs.next()) {
                PackageService ps = new PackageService();
                ps.setPackageServiceId(rs.getInt("package_service_id"));
                ps.setPackageId(rs.getInt("package_id"));
                ps.setServiceId(rs.getInt("service_id"));
                return ps;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
        return null;
    }

    /**
<<<<<<< HEAD
<<<<<<< HEAD
     * Fetches all active package-service links with package and service names.
     *
     * @return {@code List<PackageService>}: list of links with names populated, empty list on error
=======
     * Returns all Package_Service rows joined with Package and Services
     * so that packageName and serviceName are available for display.
>>>>>>> a37e247 (admin service and packages view)
=======
     * Fetches all active package-service links with package and service names.
     *
     * @return {@code List<PackageService>}: list of links with names populated, empty list on error
>>>>>>> 108eb2e (backend-completion)
     */
    public List<PackageService> getAllPackageServicesWithNames() {
        List<PackageService> list = new ArrayList<>();
        try {
            final String SQL =
                    "SELECT ps.package_service_id, ps.package_id, ps.service_id, " +
                            "       p.package_name, s.service_name " +
                            "FROM Package_Service ps " +
                            "JOIN Package  p ON ps.package_id  = p.package_id " +
                            "JOIN Services s ON ps.service_id  = s.service_id " +
                            "WHERE p.is_active = 1 AND s.is_active = 1 " +
                            "ORDER BY p.package_id, s.service_id;";

            PreparedStatement pStm = conn.prepareStatement(SQL);
            ResultSet rs = pStm.executeQuery();
            while (rs.next()) {
                PackageService ps = new PackageService();
                ps.setPackageServiceId(rs.getInt("package_service_id"));
                ps.setPackageId(rs.getInt("package_id"));
                ps.setServiceId(rs.getInt("service_id"));
                ps.setPackageName(rs.getString("package_name"));
                ps.setServiceName(rs.getString("service_name"));
                list.add(ps);
            }
            pStm.close();
        } catch (SQLException ex) {
            System.out.println("Error fetching all package-services: " + ex.getLocalizedMessage());
        }
        return list;
    }

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 108eb2e (backend-completion)
    /**
     * Fetches all service links for a specific package.
     *
     * @param packageId {@code int}: ID of the package whose services to fetch
     * @return {@code List<PackageService>}: list of service links for the package, empty list on error
     */
<<<<<<< HEAD
=======
    /** Returns all Package_Service rows for a specific package. */
>>>>>>> a37e247 (admin service and packages view)
=======
>>>>>>> 108eb2e (backend-completion)
    public List<PackageService> getPackageServicesByPackageId(int packageId) {
        List<PackageService> list = new ArrayList<>();
        try {
            final String SQL =
                    "SELECT ps.package_service_id, ps.package_id, ps.service_id, s.service_name " +
                            "FROM Package_Service ps " +
                            "JOIN Services s ON ps.service_id = s.service_id " +
                            "WHERE ps.package_id = ?;";

            PreparedStatement pStm = conn.prepareStatement(SQL);
            pStm.setInt(1, packageId);
            ResultSet rs = pStm.executeQuery();
            while (rs.next()) {
                PackageService ps = new PackageService();
                ps.setPackageServiceId(rs.getInt("package_service_id"));
                ps.setPackageId(rs.getInt("package_id"));
                ps.setServiceId(rs.getInt("service_id"));
                ps.setServiceName(rs.getString("service_name"));
                list.add(ps);
            }
            pStm.close();
        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
        }
        return list;
<<<<<<< HEAD
=======
    }

    /**
     * Deletes a package-service link by its primary key.
     *
     * @param packageServiceId {@code int}: ID of the link to delete
     * @return {@code int}: 1=success (row deleted), 0=not found or error
     */
    public int deletePackageService(int packageServiceId) {
        try {
            final String SQL = "DELETE FROM Package_Service WHERE package_service_id = ?;";
            PreparedStatement pStm = conn.prepareStatement(SQL);
            pStm.setInt(1, packageServiceId);
            int rows = pStm.executeUpdate();
            pStm.close();
            return rows;
        } catch (SQLException ex) {
            System.out.println("Error deleting package-service link: " + ex.getLocalizedMessage());
            return 0;
        }
    }

    /**
     * Inserts a new package-service link.
     *
     * @param packageId {@code int}: ID of the package
     * @param serviceId {@code int}: ID of the service to link
     * @return {@code int}: 1=success (row inserted), 0=error
     */
    public int insertPackageService(int packageId, int serviceId) {
        try {
            final String SQL =
                    "INSERT INTO Package_Service (package_id, service_id) VALUES (?, ?);";
            PreparedStatement pStm = conn.prepareStatement(SQL);
            pStm.setInt(1, packageId);
            pStm.setInt(2, serviceId);
            int rows = pStm.executeUpdate();
            pStm.close();
            return rows;
        } catch (SQLException ex) {
            System.out.println("Error inserting package-service link: " + ex.getLocalizedMessage());
            return 0;
        }
>>>>>>> a37e247 (admin service and packages view)
    }
<<<<<<< HEAD

    /**
     * Deletes a package-service link by its primary key.
     *
     * @param packageServiceId {@code int}: ID of the link to delete
     * @return {@code int}: 1=success (row deleted), 0=not found or error
     */
    public int deletePackageService(int packageServiceId) {
        try {
            final String SQL = "DELETE FROM Package_Service WHERE package_service_id = ?;";
            PreparedStatement pStm = conn.prepareStatement(SQL);
            pStm.setInt(1, packageServiceId);
            int rows = pStm.executeUpdate();
            pStm.close();
            return rows;
        } catch (SQLException ex) {
            System.out.println("Error deleting package-service link: " + ex.getLocalizedMessage());
            return 0;
        }
    }

    /**
     * Inserts a new package-service link.
     *
     * @param packageId {@code int}: ID of the package
     * @param serviceId {@code int}: ID of the service to link
     * @return {@code int}: 1=success (row inserted), 0=error
     */
    public int insertPackageService(int packageId, int serviceId) {
        try {
            final String SQL =
                    "INSERT INTO Package_Service (package_id, service_id) VALUES (?, ?);";
            PreparedStatement pStm = conn.prepareStatement(SQL);
            pStm.setInt(1, packageId);
            pStm.setInt(2, serviceId);
            int rows = pStm.executeUpdate();
            pStm.close();
            return rows;
        } catch (SQLException ex) {
            System.out.println("Error inserting package-service link: " + ex.getLocalizedMessage());
            return 0;
        }
    }
=======
>>>>>>> 108eb2e (backend-completion)
}