    package com.aptproject.meronepal.dao;
    import com.aptproject.meronepal.dao.interfaces.PackageDAOInterface;
    import com.aptproject.meronepal.model.Package;
    import com.aptproject.meronepal.model.Service;
    import com.aptproject.meronepal.utility.DBConfig;
    import java.sql.Connection;
    import java.sql.PreparedStatement;
    import java.sql.ResultSet;
    import java.sql.SQLException;
    import java.util.ArrayList;
    import java.util.LinkedHashMap;
    import java.util.List;
    import java.util.Map;

    public class PackageDAO implements PackageDAOInterface {
        //Connect to DB
        private Connection conn;

        // Constructor for getting the connection
        public PackageDAO(){
            try{
                conn = DBConfig.getConnection();
            }catch (SQLException | ClassNotFoundException ex){
                System.out.println(ex.getLocalizedMessage());
            }

        }


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

                    // Create or get existing Package
                    Package pkg = packageMap.get(packageId);
                    if (pkg == null) {
                        pkg = new Package();
                        pkg.setPackageId(packageId);
                        pkg.setPackageName(rs.getString("package_name"));
                        pkg.setDescription(rs.getString("description"));
                        pkg.setPrice(rs.getBigDecimal("price"));
                        pkg.setServices(new ArrayList<>()); // Initialize services list
                        packageMap.put(packageId, pkg);
                    }

                    // Add service if it exists (not null from LEFT JOIN)
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
                ex.printStackTrace();
                return new ArrayList<>();
            }

            return new ArrayList<>(packageMap.values());
        }
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

        public List<Package> getAllPackages() {
            List<Package> packages = new ArrayList<>();
            try {
                final String SELECT_ALL_PACKAGES = "SELECT * FROM Package WHERE is_active = 1;";

                PreparedStatement pStm = conn.prepareStatement(SELECT_ALL_PACKAGES);
                ResultSet rs = pStm.executeQuery();

                while (rs.next()) {
                    Package pkg = new Package();
                    pkg.setPackageId(rs.getInt("package_id"));
                    pkg.setPackageName(rs.getString("package_name"));
                    pkg.setDescription(rs.getString("description"));
                    pkg.setPrice(rs.getBigDecimal("price"));
                    packages.add(pkg);
                }

                pStm.close();

            } catch (SQLException ex) {
                System.out.println(ex.getLocalizedMessage());
            }
            return packages;
        }

        public Package getPackageById(int packageId) {
            try {
                final String SELECT_PACKAGE = "SELECT * FROM Package WHERE package_id = ?;";

                PreparedStatement pStm = conn.prepareStatement(SELECT_PACKAGE);
                pStm.setInt(1, packageId);
                ResultSet rs = pStm.executeQuery();

                if (rs.next()) {
                    Package pkg = new Package();
                    pkg.setPackageId(rs.getInt("package_id"));
                    pkg.setPackageName(rs.getString("package_name"));
                    pkg.setDescription(rs.getString("description"));
                    pkg.setPrice(rs.getBigDecimal("price"));
                    return pkg;
                }

                pStm.close();

            } catch (SQLException ex) {
                System.out.println(ex.getLocalizedMessage());
            }
            return null;
        }

    }
