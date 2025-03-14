<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cabbooking.service.VehicleService" %>
<%@ page import="com.cabbooking.model.Vehicle" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vehicle Details</title>

    <%-- Include Bootstrap --%>
    <%@include file="all_component/allCss.jsp" %>

    <style>
        .container {
            margin-top: 40px;
        }
        .card {
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .vehicle-image {
            width: 100%;
            max-height: 350px;
            object-fit: cover;
            border-radius: 8px;
        }
        .details-title {
            font-size: 22px;
            font-weight: bold;
        }
        .details-text {
            font-size: 18px;
        }
        .back-btn {
            font-size: 16px;
            padding: 10px 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body style="background-color: #f7f7f7;">

    <%-- Include Navbar --%>
    <%@include file="all_component/navbar.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-md-10 offset-md-1">
                <div class="card">
                    <div class="row">
                        <%
                            // Get vehicle ID from the query parameter
                            int vehicleId = Integer.parseInt(request.getParameter("id"));
                            
                            // Use the service to fetch vehicle details
                            VehicleService vehicleService = new VehicleService();
                            Vehicle vehicle = vehicleService.getVehicleById(vehicleId);
                            
                            if (vehicle != null) {
                        %>
                        <div class="col-md-6">
                            <img src="<%= vehicle.getVehicleImage() %>" alt="<%= vehicle.getVehicleName() %>" class="vehicle-image">
                        </div>
                        <div class="col-md-6">
                            <h3 class="text-center"><%= vehicle.getVehicleName() %></h3>
                            <hr>
                            <p class="details-title">Vehicle Type: <span class="details-text"><%= vehicle.getVehicleType() %></span></p>
                            <p class="details-title">Price: <span class="details-text">RS <%= vehicle.getPrice() %></span></p>
                            <p class="details-title">Engine Capacity: <span class="details-text"><%= vehicle.getEngineCapacity() %></span></p>
                            <p class="details-title">Vehicle Number: <span class="details-text"><%= vehicle.getVehicleNumber() %></span></p>
                            <p class="details-title">Details:</p>
                            <p class="details-text"><%= vehicle.getDetails() %></p>
                            <hr>
                            <a href="index.jsp" class="btn btn-primary back-btn">← Back to Vehicles</a>
                        </div>
                        <%
                            } else {
                        %>
                            <p>Vehicle details not found.</p>
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
