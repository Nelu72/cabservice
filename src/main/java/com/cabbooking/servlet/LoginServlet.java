package com.cabbooking.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.cabbooking.util.DBUtil;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Check if the login is for the admin account
        if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
            // Admin login
            HttpSession session = request.getSession();
            session.setAttribute("user", "Admin"); // Store admin as logged in user
            session.setAttribute("userEmail", email); // Store admin email
            session.setAttribute("isAdmin", true); // Flag to indicate admin role
            response.sendRedirect("admin/home.jsp"); // Redirect to admin dashboard
            return; // Exit the servlet to avoid checking user credentials
        }

        // Check for regular user login
        try (Connection conn = DBUtil.getConnection()) {
            String query = "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Regular user login
                HttpSession session = request.getSession();
                session.setAttribute("user", rs.getString("full_name")); // Store user's full name
                session.setAttribute("userEmail", email); // Store user's email
                session.setAttribute("userId", rs.getInt("id"));

                // Redirect to user dashboard
                response.sendRedirect("index.jsp");
            } else {
                // Invalid credentials
                response.sendRedirect("login.jsp?error=Invalid email or password");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
