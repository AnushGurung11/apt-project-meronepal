package com.aptproject.meronepal.dao;
import com.aptproject.meronepal.dao.interfaces.PackageDAOInterface;
import com.aptproject.meronepal.model.Package;
import com.aptproject.meronepal.utility.DBConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

    @Override
    public Package getPackage(String pack){
        try {
            final String SELECT_Package = "select * from package where package_name=?;";

            PreparedStatement pStm_ = conn.prepareStatement(SELECT_Package);
            pStm_.setString(1, pack);
            ResultSet rs = pStm_.executeQuery();
            if (rs.next()) {
                final Package aPackage = new Package();
                aPackage.setPackageId(rs.getInt("package_id"));
                aPackage.setPackageName(rs.getString("package_name"));
                aPackage.setDescription(rs.getString("description"));
                aPackage.setPrice(rs.getBigDecimal("price"));
                return aPackage;
            }

        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
            return null;
        }
        return null;
    }
}
