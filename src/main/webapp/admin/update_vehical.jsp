<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.cabbooking.model.Vehicle" %>
<%@ page import="com.cabbooking.service.VehicleService" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Vehicle</title>
    <%@ include file="allCss.jsp" %>
</head>
<body>

    <%@ include file="navbar.jsp" %>

    <%
        int id = Integer.parseInt(request.getParameter("id"));
        VehicleService vehicleService = new VehicleService();
        Vehicle vehicle = vehicleService.getVehicleById(id);
        if (vehicle == null) {
            response.sendRedirect("view_vehicles.jsp?error=Vehicle not found");
            return;
        }
    %>

    <div class="container mt-4">
        <h2 class="text-center">Update Vehicle</h2>
        <form action="../UpdateVehicleServlet" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<%= vehicle.getId() %>">
            
            <div class="mb-3">
                <label class="form-label">Vehicle Name</label>
                <input type="text" class="form-control" name="name" value="<%= vehicle.getVehicleName() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Vehicle Type</label>
                <input type="text" class="form-control" name="type" value="<%= vehicle.getVehicleType() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Price (₹)</label>
                <input type="number" step="0.01" class="form-control" name="price" value="<%= vehicle.getPrice() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Engine Capacity</label>
                <input type="text" class="form-control" name="engineCapacity" value="<%= vehicle.getEngineCapacity() %>">
            </div>

            <div class="mb-3">
                <label class="form-label">Vehicle Number</label>
                <input type="text" class="form-control" name="vehicleNumber" value="<%= vehicle.getVehicleNumber() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Current Image</label><br>
                <% if (vehicle.getVehicleImage() != null && !vehicle.getVehicleImage().isEmpty()) { %>
                    <img src="<%= request.getContextPath() %>/<%= vehicle.getVehicleImage() %>" width="100" height="60">
                <% } else { %>
                    <p>No Image</p>
                <% } %>
            </div>

            <div class="mb-3">
                <label class="form-label">Upload New Image</label>
                <input type="file" class="form-control" name="vehicleImage">
            </div>

            <button type="submit" class="btn btn-primary">Update Vehicle</button>
        </form>
    </div>

</body>
</html>
