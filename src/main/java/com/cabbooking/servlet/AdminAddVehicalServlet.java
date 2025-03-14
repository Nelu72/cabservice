package com.cabbooking.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.cabbooking.model.Vehicle;
import com.cabbooking.service.VehicleService;

@WebServlet("/AdminAddVehicalServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10, // 10MB
                 maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AdminAddVehicalServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "vehicals"; // Folder inside webapp

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String vehicleName = request.getParameter("vehicle_name");
        String vehicleType = request.getParameter("vehicle_type");
        double price = Double.parseDouble(request.getParameter("price"));
        String details = request.getParameter("details");
        String vehicleNumber = request.getParameter("vehicle_number");
        String engineCapacity = request.getParameter("engine_capacity");
        String vehicleCategory = request.getParameter("vehicle_category"); // Get category

        // Handling file upload
        Part part = request.getPart("vehicle_image");
        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();
        
        part.write(uploadPath + File.separator + fileName);

        // Save vehicle details in the database
        Vehicle vehicle = new Vehicle();
        vehicle.setVehicleName(vehicleName);
        vehicle.setVehicleType(vehicleCategory);  // Set the category directly
        vehicle.setPrice(price);
        vehicle.setDetails(details);
        vehicle.setVehicleNumber(vehicleNumber);
        vehicle.setEngineCapacity(engineCapacity);
        vehicle.setVehicleImage(UPLOAD_DIR + "/" + fileName);

        VehicleService service = new VehicleService();
        if (service.addVehicle(vehicle)) {
            response.sendRedirect("admin/add_vehical.jsp?msg=success");
        } else {
            response.sendRedirect("admin/add_vehical.jsp?msg=error");
        }
    }
}
