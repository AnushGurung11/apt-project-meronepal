package com.aptproject.meronepal.dao;

import com.aptproject.meronepal.dao.interfaces.BookingDAOInterface;
import com.aptproject.meronepal.model.PackageService;
import com.aptproject.meronepal.model.User;
import com.aptproject.meronepal.utility.DBConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
            java.util.Date parsedDate = sdf.parse(eventDate);
            java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());

            final String INSERT_Booking = "INSERT INTO booking (user_id, package_id, event_date, event_address, notes) VALUES (?,?,?,?,?)";
            PreparedStatement pStm = conn.prepareStatement(INSERT_Booking);
            pStm.setInt(1, user_id);
            pStm.setInt(2, packageServiceID);
            pStm.setDate(3, sqlDate);      // ← setDate(), not setString()
            pStm.setString(4, eventAddress);
            pStm.setString(5, notes);

            int re = pStm.executeUpdate();
            return re;  //0 or 1
        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
            return 3;  // if 3 fault in query
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

    }

}
