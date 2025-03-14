<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cabbooking.service.VehicleService, com.cabbooking.model.Vehicle, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mega City Cab</title>
    <%@include file="all_component/allCss.jsp" %>
    <style>
        /* Styling as per your requirements */
        .vehicle-image {
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
    %>

    <!-- New Generation Vehicles Section -->
    <div class="container">
        <h3 class="text-center">New Generation Vehicles</h3>
        <div class="row">
            <% for (Vehicle v : vehicleList) {
                if ("New Generation Vehicles".equals(v.getVehicleType()) && 
                    (selectedCategory == null || "New Generation Vehicles".equals(selectedCategory))) { %>
                    <div class="col-md-4 mb-4">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img src="<%= v.getVehicleImage() %>" alt="<%= v.getVehicleName() %>"
                                     class="img-thumbnail vehicle-image">
                                <h5><%= v.getVehicleName() %></h5>
                                <p><%= v.getVehicleType() %></p>
                                <p><strong>Price: Rs <%= v.getPrice() %></strong></p>
                                <div class="d-flex justify-content-center mt-2">
                                     <a href="book-now?vehicleId=<%= v.getId() %>" class="btn btn-danger btn-sm">Book Now</a>
                                     <span style="width: 20px;"></span> <!-- Space between buttons -->
                                     <a href="View_details.jsp?id=<%= v.getId() %>" class="btn btn-success btn-sm">View Details</a>
                                </div>
                            </div>
                        </div>
                    </div>
            <%   }
            } %>
        </div>
        <div class="text-center mt-3">
            <a href="index.jsp?vehicle_category=New Generation Vehicles" class="btn btn-danger btn-lg text-white">View All New Generation Vehicles</a>
        </div>
    </div>

    <hr>

    <!-- Old Generation Vehicles Section -->
    <div class="container">
        <h3 class="text-center">Old Generation Vehicles</h3>
        <div class="row">
            <% for (Vehicle v : vehicleList) {
                if ("Old Generation Vehicles".equals(v.getVehicleType()) && 
                    (selectedCategory == null || "Old Generation Vehicles".equals(selectedCategory))) { %>
                    <div class="col-md-4 mb-4">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img src="<%= v.getVehicleImage() %>" alt="<%= v.getVehicleName() %>"
                                     class="img-thumbnail vehicle-image">
                                <h5><%= v.getVehicleName() %></h5>
                                <p><%= v.getVehicleType() %></p>
                                <p><strong>Price: Rs <%= v.getPrice() %></strong></p>
                               <div class="d-flex justify-content-center mt-2">
                                     <a href="book-now?vehicleId=<%= v.getId() %>" class="btn btn-danger btn-sm">Book Now</a>
                                          <span style="width: 20px;"></span> <!-- Space between buttons -->
                                     <a href="View_details.jsp?id=<%= v.getId() %>" class="btn btn-success btn-sm">View Details</a>
                               </div>
                            </div>
                        </div>
                    </div>
            <%   }
            } %>
        </div>
        <div class="text-center mt-3">
            <a href="index.jsp?vehicle_category=Old Generation Vehicles" class="btn btn-danger btn-lg text-white">View All Old Generation Vehicles</a>
        </div>
    </div>

    <hr>

    <%@include file="all_component/footer.jsp" %>
</body>
</html>
