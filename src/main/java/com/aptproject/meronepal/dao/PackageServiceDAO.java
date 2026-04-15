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

}
