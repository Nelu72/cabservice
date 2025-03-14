package com.cabbooking.service;

import com.cabbooking.model.Booking;
import com.cabbooking.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookingService {
    public List<Booking> displayAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT id, vehicle_image, vehicle_name, vehicle_number, customer_name, id_card_number, address, book_date, end_date, final_amount, driver_name, contact_number FROM booking";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setId(rs.getInt("id"));
                booking.setVehicleImage(rs.getString("vehicle_image"));
                booking.setVehicleName(rs.getString("vehicle_name"));
                booking.setVehicleNumber(rs.getString("vehicle_number"));
                booking.setCustomerName(rs.getString("customer_name"));
                booking.setIdCardNumber(rs.getString("id_card_number"));
                booking.setAddress(rs.getString("address"));
                booking.setBookDate(rs.getString("book_date"));
                booking.setEndDate(rs.getString("end_date"));
                booking.setFinalAmount(rs.getString("final_amount"));
                booking.setDriverName(rs.getString("driver_name"));
                booking.setContactNumber(rs.getString("contact_number"));

                bookings.add(booking);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return bookings;
    }
}
