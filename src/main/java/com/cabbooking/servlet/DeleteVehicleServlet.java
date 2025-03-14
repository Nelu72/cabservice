package com.cabbooking.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cabbooking.service.VehicleService;

@WebServlet("/DeleteVehicleServlet")
public class DeleteVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        
        if (idStr != null) {
            try {
                int vehicleId = Integer.parseInt(idStr);

                VehicleService service = new VehicleService();
                boolean deleted = service.deleteVehicleById(vehicleId);

                if (deleted) {
                    response.sendRedirect("admin/view_vehical.jsp?msg=deleted");
                } else {
                    response.sendRedirect("admin/view_vehical.jsp?msg=error");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("admin/view_vehical.jsp?msg=invalid");
            }
        } else {
            response.sendRedirect("admin/view_vehical.jsp?msg=invalid");
        }
    }
}
