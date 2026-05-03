package com.aptproject.meronepal.dao.interfaces;
import com.aptproject.meronepal.model.Booking;
import com.aptproject.meronepal.model.Package;
import com.aptproject.meronepal.model.PackageService;
import com.aptproject.meronepal.model.User;

public interface BookingDAOInterface {

    int insertBooking(User user, int packageId,String eventAddress, String notes, String eventDate);

}
