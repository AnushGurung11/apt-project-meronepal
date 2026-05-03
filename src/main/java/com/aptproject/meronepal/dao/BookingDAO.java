package com.aptproject.meronepal.dao;

import com.aptproject.meronepal.dao.interfaces.BookingDAOInterface;
import com.aptproject.meronepal.model.User;
import com.aptproject.meronepal.utility.DBConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BookingDAO implements BookingDAOInterface {

    private Connection conn;
    public BookingDAO(){
        try{
            conn = DBConfig.getConnection();
        }catch (SQLException | ClassNotFoundException ex){
            System.out.println(ex.getLocalizedMessage());
        }
    }
    @Override
    public int insertBooking(User user, int packageId,String eventAddress, String notes, String eventDate) {
        try {
            final String INSERT_BOOKING =
                    "INSERT INTO Booking (user_id, package_id, event_date, event_address, notes) " +
                            "VALUES (?, ?, ?, ?, ?)";

            PreparedStatement pStm = conn.prepareStatement(INSERT_BOOKING);
            pStm.setInt(1, user.getUserId());
            pStm.setInt(2, packageId);
            pStm.setDate(3, java.sql.Date.valueOf(eventDate));
            pStm.setString(4, eventAddress);
            pStm.setString(5, notes);

            return pStm.executeUpdate();

        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
            return 0;
        }
    }

}
