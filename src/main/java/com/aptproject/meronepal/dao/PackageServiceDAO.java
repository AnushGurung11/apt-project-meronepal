package com.aptproject.meronepal.dao;

import com.aptproject.meronepal.dao.interfaces.PackageDAOInterface;
import com.aptproject.meronepal.dao.interfaces.PackageServiceDAOInterface;
import com.aptproject.meronepal.model.Package;
import com.aptproject.meronepal.model.PackageService;
import com.aptproject.meronepal.utility.DBConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PackageServiceDAO implements PackageServiceDAOInterface {
    private  Connection conn;


    public PackageServiceDAO(){
        try{
            conn = DBConfig.getConnection();
        }catch (SQLException | ClassNotFoundException ex){
            System.out.println(ex.getLocalizedMessage());
        }
    }

    //Get Package Service
    @Override
    public PackageService getPackageService (int packageServiceID){
        try {
            final String SELECT_PackageService = "select * from Package_Service where package_service_id=?;";

            PreparedStatement pStm_ = conn.prepareStatement(SELECT_PackageService);
            pStm_.setInt(1, packageServiceID);
            ResultSet rs = pStm_.executeQuery();
            if (rs.next()) {
                final com.aptproject.meronepal.model.PackageService aPackageService = new PackageService();
                aPackageService.setPackageServiceId(rs.getInt("package_service_id"));
                aPackageService.setPackageId(rs.getInt("package_id"));
                aPackageService.setServiceId(rs.getInt("service_id"));
                return aPackageService ;
            }

        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
            return null;
        }
        return null;
    }

    public List<PackageService> getPackageServicesByPackageId(int packageId) {
        List<PackageService> packageServices = new ArrayList<>();

        try {
            // JOIN with Service table to get service name for the dropdown
            final String SELECT_BY_PACKAGE =
                    "SELECT ps.package_service_id, ps.package_id, ps.service_id, s.service_name " +
                            "FROM Package_Service ps " +
                            "JOIN Service s ON ps.service_id = s.service_id " +
                            "WHERE ps.package_id = ?";

            PreparedStatement pStm = conn.prepareStatement(SELECT_BY_PACKAGE);
            pStm.setInt(1, packageId);
            ResultSet rs = pStm.executeQuery();

            while (rs.next()) {
                PackageService ps = new PackageService();
                ps.setPackageServiceId(rs.getInt("package_service_id"));
                ps.setPackageId(rs.getInt("package_id"));
                ps.setServiceId(rs.getInt("service_id"));
                packageServices.add(ps);
            }

        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
        }

        return packageServices;
    }
}
