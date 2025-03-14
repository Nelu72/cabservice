<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cabbooking.model.Driver" %>
<%@ page import="com.cabbooking.service.DriverService" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - View Drivers</title>
    <%@ include file="allCss.jsp" %>
    <style>
        .table-container {
            margin-top: 40px;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        /* Style for slightly bigger driver image */
        .driver-image {
            width: 50px;  /* Adjusted size for the driver image */
            height: 50px;
            object-fit: cover;
            border-radius: 50%; /* Round the image for driver photo */
        }

        /* Default "No Image" box styling */
        .no-image {
            width: 50px;
            height: 50px;
            background-color: #e1e1e1;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            color: #777;
            font-size: 16px;
        }
    </style>
</head>
<body>

    <%@ include file="navbar.jsp" %>

    <div class="container table-container">
        <h2 class="text-center mb-4">Driver List</h2>

        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Driver Name</th>
                    <th>Contact Number</th>
                    <th>Address</th>
                    <th>Details</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    DriverService driverService = new DriverService();
                    List<Driver> drivers = driverService.getAllDrivers(); // Fetching driver data
                    if (drivers != null && !drivers.isEmpty()) {
                        for (Driver d : drivers) {
                %>
                <tr>
                    <td><%= d.getId() %></td>

                    <%-- Check if the driver image exists, if not show a default --%>
                    <td>
                        <% if (d.getDriverImage() != null && !d.getDriverImage().isEmpty()) { 
                            String imagePath = request.getContextPath() + "/" + d.getDriverImage();
                        %>
                            <img src="<%= imagePath %>" alt="Driver Image" class="driver-image">
                        <% } else { %>
                            <div class="no-image">No Image</div>
                        <% } %>
                    </td>

                    <td><%= d.getDriverName() %></td>
                    <td><%= d.getContactNumber() %></td>
                    <td><%= d.getAddress() %></td>
                    <td><%= d.getDetails() %></td>

                    <td>
                        <!-- Edit Button -->
                        <a href="edit_driver.jsp?id=<%= d.getId() %>" class="btn btn-warning btn-sm">Edit</a>

                        <!-- Delete Button with confirmation -->
                        <a href="<%= request.getContextPath() %>/DeleteDriverServlet?id=<%= d.getId() %>"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure you want to delete this driver?');">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="7" class="text-center">No drivers available.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

</body>
</html>
