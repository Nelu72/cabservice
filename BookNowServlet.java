package com.cabbooking.servlet;

import com.cabbooking.model.Vehicle;
import com.cabbooking.service.VehicleService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/book-now")
public class BookNowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VehicleService vehicleService = new VehicleService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get vehicle ID from request parameter
            String vehicleIdParam = request.getParameter("vehicleId");
            if (vehicleIdParam == null || vehicleIdParam.isEmpty()) {
                response.sendRedirect("index.jsp?error=Vehicle ID is missing");
                return;
            }

            int vehicleId = Integer.parseInt(vehicleIdParam);
            Vehicle vehicle = vehicleService.getVehicleById(vehicleId);

            if (vehicle != null) {
                // Set vehicle object as request attribute and forward to book_now.jsp
                request.setAttribute("vehicle", vehicle);
                request.getRequestDispatcher("book_now.jsp").forward(request, response);
            } else {
                response.sendRedirect("index.jsp?error=Vehicle not found");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=Invalid vehicle ID");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=An error occurred");
        }
    }
}
