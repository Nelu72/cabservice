package com.cabbooking.servlet;

import com.cabbooking.util.DBUtil;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/VehicalBookServlet")
public class VehicalBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO booking (vehicle_image, vehicle_name, vehicle_number, customer_name, id_card_number, address, book_date, end_date, final_amount, driver_name, contact_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            // Retrieving parameters from request
            String vehicleImage = request.getParameter("vehicleImage");
            String vehicleName = request.getParameter("vehicleName");
            String vehicleNumber = request.getParameter("vehicleNumber");
            String customerName = request.getParameter("customerName");
            String idCardNumber = request.getParameter("idCardNumber");
            String address = request.getParameter("address");
            String bookDate = request.getParameter("bookDate");
            String endDate = request.getParameter("endDate");
            String finalAmount = request.getParameter("finalAmount");
            String driverName = request.getParameter("driverName");
            String contactNumber = request.getParameter("contactNumber");

            // Setting values into the SQL statement
            ps.setString(1, vehicleImage);
            ps.setString(2, vehicleName);
            ps.setString(3, vehicleNumber);
            ps.setString(4, customerName);
            ps.setString(5, idCardNumber);
            ps.setString(6, address);
            ps.setString(7, bookDate);
            ps.setString(8, endDate);
            ps.setString(9, finalAmount);
            ps.setString(10, driverName);
            ps.setString(11, contactNumber);

            ps.executeUpdate();

            // Generate Bill with driver details included
            generateBill(customerName, vehicleName, vehicleNumber, bookDate, endDate, finalAmount, driverName, contactNumber, response);

            response.sendRedirect("index.jsp?success=Booking Successful. Bill has been generated.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("book_now.jsp?error=Booking Failed");
        }
    }
    
    private void generateBill(String customerName, String vehicleName, String vehicleNumber, String bookDate, String endDate, String finalAmount, String driverName, String contactNumber, HttpServletResponse response) {
        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Adding bill details
            document.add(new Paragraph("Cab Booking Bill"));
            document.add(new Paragraph("--------------------------------------------------"));
            document.add(new Paragraph("Customer Name: " + customerName));
            document.add(new Paragraph("Vehicle Name: " + vehicleName));
            document.add(new Paragraph("Vehicle Number: " + vehicleNumber));
            document.add(new Paragraph("Booking Date: " + bookDate));
            document.add(new Paragraph("End Date: " + endDate));
            document.add(new Paragraph("Final Amount: ₹" + finalAmount));
            document.add(new Paragraph("--------------------------------------------------"));
            document.add(new Paragraph("Driver Details"));
            document.add(new Paragraph("Driver Name: " + (driverName != null ? driverName : "Not Assigned")));
            document.add(new Paragraph("Contact Number: " + (contactNumber != null ? contactNumber : "Not Available")));

            document.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
