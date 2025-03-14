package com.cabbooking.servlet;

import com.cabbooking.model.Vehicle;
import com.cabbooking.service.VehicleService;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UpdateVehicleServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10, // 10MB
                 maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UpdateVehicleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        double price = Double.parseDouble(request.getParameter("price"));
        String engineCapacity = request.getParameter("engineCapacity");
        String vehicleNumber = request.getParameter("vehicleNumber");

        Part part = request.getPart("vehicleImage");
        String fileName = part.getSubmittedFileName();

        VehicleService vehicleService = new VehicleService();
        Vehicle vehicle = vehicleService.getVehicleById(id);

        // Handle image update
        if (fileName != null && !fileName.isEmpty()) {
            String uploadDir = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadPath = new File(uploadDir);
            if (!uploadPath.exists()) {
                uploadPath.mkdir();
            }
            File file = new File(uploadPath, fileName);
            Files.copy(part.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            vehicle.setVehicleImage("uploads/" + fileName);
        }

        // Update vehicle details
        vehicle.setVehicleName(name);
        vehicle.setVehicleType(type);
        vehicle.setPrice(price);
        vehicle.setEngineCapacity(engineCapacity);
        vehicle.setVehicleNumber(vehicleNumber);

        boolean updated = vehicleService.updateVehicle(vehicle);

        if (updated) {
            response.sendRedirect("admin/view_vehical.jsp?msg=Vehicle updated successfully");
        } else {
            response.sendRedirect("admin/update_vehical.jsp?id=" + id + "&error=Update failed");
        }
    }
}
