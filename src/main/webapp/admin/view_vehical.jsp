<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cabbooking.model.Vehicle" %>
<%@ page import="com.cabbooking.service.VehicleService" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - View Vehicles</title>
    <%@ include file="allCss.jsp" %>
    <style>
        .table-container {
            margin-top: 40px;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        /* Style for slightly bigger vehicle image */
        .vehicle-image {
            width: 40px;  /* Slightly bigger thumbnail */
            height: 40px; /* Adjust height */
            object-fit: cover;  /* Ensures the image fits properly */
            border-radius: 5px; /* Slightly rounded corners */
        }

        /* Default "No Image" box styling */
        .no-image {
            width: 40px;  /* Same size as the image */
            height: 40px;
            background-color: #e1e1e1;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 5px;
            color: #777;
            font-size: 12px;
        }
    </style>
</head>
<body>

    <%@ include file="navbar.jsp" %>

    <div class="container table-container">
        <h2 class="text-center mb-4">Vehicle List</h2>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Vehicle Name</th>
                    <th>Type</th>
                    <th>Price (₹)</th>
                    <th>Engine Capacity</th>
                    <th>Vehicle Number</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    VehicleService vehicleService = new VehicleService();
                    List<Vehicle> vehicles = vehicleService.dislayAllVehicles(); // Updated method name
                    if (vehicles != null && !vehicles.isEmpty()) {
                        for (Vehicle v : vehicles) {
                %>
                <tr>
                    <td><%= v.getId() %></td>

                    <%-- Check if the vehicle image exists, if not show a default --%>
                    <td>
                        <% if (v.getVehicleImage() != null && !v.getVehicleImage().isEmpty()) { 
                            // Assuming images are stored in a folder called 'images' in the webapp directory.
                            String imagePath = request.getContextPath() + "/" + v.getVehicleImage();
                        %>
                            <img src="<%= imagePath %>" alt="Vehicle Image" class="vehicle-image">
                        <% } else { %>
                            <div class="no-image">No Image</div>
                        <% } %>
                    </td>

                    <td><%= v.getVehicleName() %></td>
                    <td><%= v.getVehicleType() %></td>
                    <td>₹ <%= v.getPrice() %></td>

                    <%-- Null checks for Engine Capacity and Vehicle Number --%>
                    <td><%= (v.getEngineCapacity() != null) ? v.getEngineCapacity() : "N/A" %></td>
                    <td><%= (v.getVehicleNumber() != null) ? v.getVehicleNumber() : "N/A" %></td>

                    <td>
                        <a href="update_vehical.jsp?id=<%= v.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="<%= request.getContextPath() %>/DeleteVehicleServlet?id=<%= v.getId() %>"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure you want to delete this vehicle?');">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="8" class="text-center">No vehicles available.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

</body>
</html>
