<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cabbooking.service.VehicleService, com.cabbooking.model.Vehicle, java.util.List" %>
<%@ page import="com.cabbooking.service.DriverService, com.cabbooking.model.Driver, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mega City Cab</title>
    <%@include file="all_component/allCss.jsp" %>
    <style>
        .vehicle-image, .driver-image {
            height: 200px;
            object-fit: cover;
        }
    </style>
</head>
<body style="background-color: #f7f7f7;">
    <%@include file="all_component/navbar.jsp" %>

    <!-- Hero Section -->
    <div class="container-fluid back-img"></div>
    <hr>

    <!-- Fetching vehicle data -->
    <%
        VehicleService vehicleService = new VehicleService();
        List<Vehicle> vehicleList = vehicleService.getAllVehicles();
        String selectedCategory = request.getParameter("vehicle_category");

        // Fetch driver details
        DriverService driverService = new DriverService();
        List<Driver> driverList = driverService.getAllDrivers();
    %>

    <!-- Driver Details Section -->
    <div class="container">
        <h3 class="text-center">Our Professional Drivers</h3>
        <div class="row">
            <% for (Driver d : driverList) { %>
                <div class="col-md-4 mb-4">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img src="<%= d.getDriverImage() %>" alt="<%= d.getDriverName() %>"
                                 class="img-thumbnail driver-image">
                            <h5><%= d.getDriverName() %></h5>
                            <p><strong>Contact: <%= d.getContactNumber() %></strong></p>
                            <div class="d-flex justify-content-center mt-2">
                               <a href="driver_details.jsp?id=<%= d.getId() %>" class="btn btn-success btn-sm">View Details</a>

                            </div>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
        <div class="text-center mt-3">
            <a href="index.jsp?view_all_drivers=true" class="btn btn-danger btn-lg text-white">View All Drivers</a>
        </div>
    </div>

    <hr>

    <%@include file="all_component/footer.jsp" %>
</body>
</html>
