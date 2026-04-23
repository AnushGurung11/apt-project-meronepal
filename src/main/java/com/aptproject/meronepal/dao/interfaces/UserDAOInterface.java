
package com.aptproject.meronepal.dao.interfaces;

import com.aptproject.meronepal.model.User;

public interface UserDAOInterface {

    //Create User
    int insertUser(String userName, String email, String phone_number, String password);

    //Get user
    User getUser(String user);
}
