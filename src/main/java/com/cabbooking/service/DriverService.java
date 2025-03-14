package com.cabbooking.service;

import com.cabbooking.model.Driver;
import com.cabbooking.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DriverService {

    // Method to fetch all drivers from the database
    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        try {
            Connection con = DBUtil.getConnection();
            String query = "SELECT * FROM driver";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Driver driver = new Driver();
                driver.setId(rs.getInt("id"));
                driver.setDriverName(rs.getString("driver_name"));
                driver.setContactNumber(rs.getString("contact_number"));
                driver.setAddress(rs.getString("address"));
                driver.setDetails(rs.getString("details"));
                driver.setDriverImage(rs.getString("driver_image"));
                drivers.add(driver);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return drivers;
    }

    public boolean addDriver(Driver driver) {
        boolean isInserted = false;
        try {
            Connection con = DBUtil.getConnection();
            String query = "INSERT INTO driver (driver_name, contact_number, address, details, driver_image) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, driver.getDriverName());
            pst.setString(2, driver.getContactNumber());
            pst.setString(3, driver.getAddress());
            pst.setString(4, driver.getDetails());
            pst.setString(5, driver.getDriverImage()); // Store image path

            int rows = pst.executeUpdate();
            if (rows > 0) {
                isInserted = true;
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isInserted;
    }
    
    public Driver getDriverById(int driverId) {
        Driver driver = null;
        try (Connection conn = DBUtil.getConnection()) {
            String query = "SELECT * FROM driver WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, driverId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                driver = new Driver();
                driver.setId(rs.getInt("id"));
                driver.setDriverName(rs.getString("driver_name"));
                driver.setContactNumber(rs.getString("contact_number"));
                driver.setAddress(rs.getString("address"));
                driver.setDetails(rs.getString("details"));
                driver.setDriverImage(rs.getString("driver_image"));
            } else {
                System.out.println("No driver found with ID: " + driverId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return driver;
    }
    
    
    

    
    
}
