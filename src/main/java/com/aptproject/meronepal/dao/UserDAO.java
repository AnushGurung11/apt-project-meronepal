package com.aptproject.meronepal.dao;

import com.aptproject.meronepal.dao.interfaces.UserDAOInterface;
import com.aptproject.meronepal.model.User;
import com.aptproject.meronepal.utility.DBConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class UserDAO implements UserDAOInterface {
    //Connect to DB
    private Connection conn;

    // Constructor for getting the connection
    public UserDAO(){
        try{
            conn = DBConfig.getConnection();
        }catch (SQLException | ClassNotFoundException ex){
            System.out.println(ex.getLocalizedMessage());
        }

    }

    //Insert user
    @Override
    public int insertUser(String userName, String email, String phone_number, String password) {
//        this validation will be done in controller part
//    if (name.isBlank() || email.isBlank() || password.isBlank()) return 0;
        try {
            //Check name and email already present
            final String CHECK_IF_USER = "SELECT user_name, email FROM user WHERE LOWER(user_name)=LOWER(?) OR LOWER(email)=LOWER(?)";
            PreparedStatement pStm_ = conn.prepareStatement(CHECK_IF_USER);
            pStm_.setString(1, userName);
            pStm_.setString(2, email);
            ResultSet rs = pStm_.executeQuery();
            if (rs.next()) {
                return 2;   // 2 for user or email already present
            }
            final String INSERT_USER = "INSERT INTO user (user_name, email, phone_number, password) VALUES (?,?,?,?)";
            PreparedStatement pStm = conn.prepareStatement(INSERT_USER);
            pStm.setString(1, userName);
            pStm.setString(2, email);
            pStm.setString(3, phone_number);
            pStm.setString(4, password);

            int result = pStm.executeUpdate();
            return result;  //0 or 1
        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
            return 3;  // if 3 fault in query
        }
    }


    // TODO get user    
    @Override
    public User getUser(String userName) {
        try {
            final String SELECT_USER = "select * from user where user_name=?;";

            PreparedStatement pStm_ = conn.prepareStatement(SELECT_USER);
            pStm_.setString(1, userName);
            ResultSet rs = pStm_.executeQuery();
            if (rs.next()) {
                final User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUserName(rs.getString("user_name"));
                user.setPasswordHash(rs.getString("password"));
                user.setPhoneNumber(rs.getString("phone_number"));
                user.setEmail(rs.getString("email"));
                user.setCreatedAt(rs.getObject("created_at", LocalDateTime.class));
                return user;
            }

        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
            return null;
        }
        return null;
    }

}
