<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cabbooking.service.DriverService" %>
<%@ page import="com.cabbooking.model.Driver" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Driver Details</title>
    <%@include file="../all_component/allCss.jsp" %>

    <style>
        .container { margin-top: 40px; }
        .card { padding: 25px; border-radius: 10px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); }
        .driver-image { width: 100%; max-height: 350px; object-fit: cover; border-radius: 8px; }
        .details-title { font-size: 22px; font-weight: bold; }
        .details-text { font-size: 18px; }
        .back-btn { font-size: 16px; padding: 10px 20px; border-radius: 5px; }
    </style>
</head>
<body style="background-color: #f7f7f7;">
    
    <%@include file="../all_component/navbar.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card">
                    <div class="row">
                        <%
                            // Get driver ID safely
                            String idParam = request.getParameter("id");
                            int driverId = 0;

                            if (idParam != null) {
                                try {
                                    driverId = Integer.parseInt(idParam);
                                } catch (NumberFormatException e) {
                                    driverId = 0;
                                }
                            }

                            Driver driver = null;
                            if (driverId > 0) {
                                DriverService driverService = new DriverService();
                                driver = driverService.getDriverById(driverId);
                            }

                            if (driver != null) {
                                String driverImage = (driver.getDriverImage() != null && !driver.getDriverImage().isEmpty()) 
                                    ? driver.getDriverImage() 
                                    : "default_driver.jpg"; // Default image
                        %>
                        <div class="col-md-6">
                            <img src="<%= driverImage %>" alt="<%= driver.getDriverName() %>" class="driver-image">
                        </div>
                        <div class="col-md-6">
                            <h3 class="text-center"><%= driver.getDriverName() %></h3>
                            <hr>
                            <p class="details-title">Contact Number: <span class="details-text"><%= driver.getContactNumber() %></span></p>
                            <p class="details-title">Address: <span class="details-text"><%= driver.getAddress() %></span></p>
                            <p class="details-title">Details:</p>
                            <p class="details-text"><%= driver.getDetails() %></p>
                            <hr>
                            <a href="view_drivers.jsp" class="btn btn-primary back-btn">← Back to Drivers</a>
                        </div>
                        <%
                            } else {
                        %>
                        <div class="col-12">
                            <p class="text-danger text-center">⚠️ Driver details not found.</p>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
