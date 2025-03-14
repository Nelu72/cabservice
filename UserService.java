package com.cabbooking.service;

import com.cabbooking.model.User;
import com.cabbooking.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserService {
    public boolean registerUser(User user) {
        boolean isRegistered = false;
        try {
            Connection conn = DBUtil.getConnection();
            String query = "INSERT INTO users (full_name, email, phone, password) VALUES (?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, user.getFullName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPhone());
            pst.setString(4, user.getPassword());

            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                isRegistered = true;
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isRegistered;
    }

	public static boolean authenticate(String email, String password) {
		// TODO Auto-generated method stub
		return false;
	}

	public static String getFullName(String email) {
		// TODO Auto-generated method stub
		return null;
	}
}
