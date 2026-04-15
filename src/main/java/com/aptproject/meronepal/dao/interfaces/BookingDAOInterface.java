package com.aptproject.meronepal.dao.interfaces;
import com.aptproject.meronepal.model.Booking;
import com.aptproject.meronepal.model.Package;
import com.aptproject.meronepal.model.PackageService;
import com.aptproject.meronepal.model.User;

public interface BookingDAOInterface {
    //TODO Create Booking
    //TODO Get Booking
    //TODO Update Booking
    //TODO Delete Booking

    int insertBooking(User user, PackageService aPackageService, String event_address, String notes, String event_date);

}
