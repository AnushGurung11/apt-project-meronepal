package com.aptproject.meronepal.dao.interfaces;
import com.aptproject.meronepal.model.Package;
import com.aptproject.meronepal.model.PackageService;

public interface PackageDAOInterface {
    //TODO Update Package, DELETE package
    //Get package details
    Package getPackage(String pack);

    //Get Package Service
//    PackageService getPackageService(String packageService);

//    int insertPackage();
}
