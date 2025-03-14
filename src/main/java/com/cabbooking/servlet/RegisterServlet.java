package com.cabbooking.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cabbooking.model.User;
import com.cabbooking.service.UserService;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Retrieving form data
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        // Creating user object
        User user = new User(fullName, email, phone, password);
        
        // Register the user
        boolean isRegistered = userService.registerUser(user);

        if (isRegistered) {
            // Store user details in session
            HttpSession session = request.getSession();
            session.setAttribute("user", email); // Store email for tracking
            session.setAttribute("fullName", fullName); // Store full name for navbar display

            // Success message
            request.setAttribute("message", "Registration successful! Please log in.");
            request.setAttribute("messageType", "success");
        } else {
            // Failure message
            request.setAttribute("message", "Registration failed. Please try again.");
            request.setAttribute("messageType", "danger");
        }

        // Redirect back to the registration page
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}
