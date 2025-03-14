package com.cabbooking.service;

import com.cabbooking.model.Vehicle;
import com.cabbooking.util.DBUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VehicleService {

    public boolean addVehicle(Vehicle vehicle) {
        boolean isAdded = false;
        try (Connection con = DBUtil.getConnection()) {
            String sql = "INSERT INTO vehicles (vehicle_name, vehicle_type, price, details, vehicle_number, engine_capacity, vehicle_image) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, vehicle.getVehicleName());
            ps.setString(2, vehicle.getVehicleType());
            ps.setDouble(3, vehicle.getPrice());
            ps.setString(4, vehicle.getDetails());
            ps.setString(5, vehicle.getVehicleNumber());
            ps.setString(6, vehicle.getEngineCapacity());
            ps.setString(7, vehicle.getVehicleImage());

            isAdded = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isAdded;
    }

    public List<Vehicle> getAllVehicles() {
        List<Vehicle> list = new ArrayList<>();
        try (Connection con = DBUtil.getConnection()) {
            String sql = "SELECT * FROM vehicles";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Vehicle v = new Vehicle();
                v.setId(rs.getInt("id"));
                v.setVehicleName(rs.getString("vehicle_name"));
                v.setVehicleType(rs.getString("vehicle_type"));
                v.setPrice(rs.getDouble("price"));
                v.setVehicleImage(rs.getString("vehicle_image"));
                list.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Vehicle getVehicleById(int vehicleId) {
        Vehicle vehicle = null;
        try (Connection con = DBUtil.getConnection()) {
            String sql = "SELECT * FROM vehicles WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, vehicleId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                vehicle = new Vehicle();
                vehicle.setId(rs.getInt("id"));
                vehicle.setVehicleName(rs.getString("vehicle_name"));
                vehicle.setVehicleType(rs.getString("vehicle_type"));
                vehicle.setPrice(rs.getDouble("price"));
                vehicle.setVehicleImage(rs.getString("vehicle_image"));
                vehicle.setDetails(rs.getString("details"));
                vehicle.setVehicleNumber(rs.getString("vehicle_number"));
                vehicle.setEngineCapacity(rs.getString("engine_capacity"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vehicle;
    }
    
    public List<Vehicle> dislayAllVehicles() {
        List<Vehicle> list = new ArrayList<>();
        try (Connection con = DBUtil.getConnection()) {
            String sql = "SELECT * FROM vehicles";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Vehicle v = new Vehicle();
                v.setId(rs.getInt("id"));
                v.setVehicleName(rs.getString("vehicle_name"));
                v.setVehicleType(rs.getString("vehicle_type"));
                v.setPrice(rs.getDouble("price"));
                v.setVehicleImage(rs.getString("vehicle_image"));

                // Fetch and set missing fields
                v.setVehicleNumber(rs.getString("vehicle_number"));
                v.setEngineCapacity(rs.getString("engine_capacity"));

                list.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    
    public boolean deleteVehicleById(int vehicleId) {
        boolean rowDeleted = false;
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "DELETE FROM vehicles WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, vehicleId);
            int rows = stmt.executeUpdate();
            rowDeleted = rows > 0;

            System.out.println("Delete Query Executed: " + (rowDeleted ? "Success" : "Failed"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }
    
    
    public boolean updateVehicle(Vehicle vehicle) {
        boolean isUpdated = false;
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(
                     "UPDATE vehicles SET vehicle_name=?, vehicle_type=?, price=?, engine_capacity=?, vehicle_number=?, vehicle_image=? WHERE id=?")) {
            ps.setString(1, vehicle.getVehicleName());
            ps.setString(2, vehicle.getVehicleType());
            ps.setDouble(3, vehicle.getPrice());
            ps.setString(4, vehicle.getEngineCapacity());
            ps.setString(5, vehicle.getVehicleNumber());
            ps.setString(6, vehicle.getVehicleImage());
            ps.setInt(7, vehicle.getId());

            isUpdated = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isUpdated;
    }

    
    
}
