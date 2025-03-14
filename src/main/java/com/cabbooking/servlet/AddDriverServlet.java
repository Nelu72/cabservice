package com.cabbooking.servlet;

import com.cabbooking.model.Driver;
import com.cabbooking.service.DriverService;
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

@WebServlet("/AddDriverServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10, // 10MB
                 maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddDriverServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "drivers"; // Folder inside webapp

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String driverName = request.getParameter("driver_name");
        String contactNumber = request.getParameter("contact_number");
        String address = request.getParameter("address");
        String details = request.getParameter("details");

        // Handle image upload
        Part filePart = request.getPart("driver_image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath); // Save image file to server

        // Store relative path in DB (e.g., "drivers/filename.jpg")
        String dbFilePath = UPLOAD_DIR + "/" + fileName;

        // Set driver details
        Driver driver = new Driver();
        driver.setDriverName(driverName);
        driver.setContactNumber(contactNumber);
        driver.setAddress(address);
        driver.setDetails(details);
        driver.setDriverImage(dbFilePath); // Store relative image path

        // Save driver data using service
        DriverService driverService = new DriverService();
        boolean isAdded = driverService.addDriver(driver); // Now it matches the updated method

        if (isAdded) {
            response.sendRedirect("admin/Add_driver.jsp?success=true");
        } else {
            response.sendRedirect("admin/Add_driver.jsp?error=true");
        }
    }
}
