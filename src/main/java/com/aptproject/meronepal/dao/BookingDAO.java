package com.aptproject.meronepal.dao;

import com.aptproject.meronepal.dao.interfaces.BookingDAOInterface;
import com.aptproject.meronepal.model.PackageService;
import com.aptproject.meronepal.model.User;
import com.aptproject.meronepal.utility.DBConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class BookingDAO implements BookingDAOInterface {
    //TODO Create Booking
    //TODO Get Booking
    //TODO Update Booking
    //TODO Delete Booking
    private Connection conn;
    public BookingDAO(){
        try{
            conn = DBConfig.getConnection();
        }catch (SQLException | ClassNotFoundException ex){
            System.out.println(ex.getLocalizedMessage());
        }
    }
    @Override
    public int insertBooking(User user, PackageService aPackageService, String eventAddress, String notes, String eventDate){

        int user_id = user.getUserId();
        //TODO Here is the confusion
        int packageServiceID = aPackageService.getPackageServiceId();

        try {
            final String INSERT_Booking = "insert into booking (user_id, package_id, event_date, event_address, notes) values (?,?,?,?,?);";
            PreparedStatement pStm = conn.prepareStatement(INSERT_Booking);
            pStm.setInt(1, user_id);
            pStm.setInt(2, packageServiceID);
            pStm.setString(3, eventDate);
            pStm.setString(4, eventAddress);
            pStm.setString(5, notes);

            int re = pStm.executeUpdate();
            return re;  //0 or 1
        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
            return 3;  // if 3 fault in query
        }

    }

}
