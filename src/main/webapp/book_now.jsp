<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cabbooking.model.Vehicle" %>
<%@ page import="com.cabbooking.model.Driver" %>
<%@ page import="com.cabbooking.service.DriverService" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Now</title>
    <%@include file="all_component/allCss.jsp" %>

    <style>
        .container { margin-top: 40px; }
        .card { padding: 25px; border-radius: 10px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); }
        .vehicle-image { width: 100%; max-height: 300px; object-fit: cover; border-radius: 8px; }
        .details-title { font-size: 18px; font-weight: bold; }
        .details-text { font-size: 16px; }
        .form-control[readonly] { background-color: #e9ecef; }
        .book-btn { font-size: 18px; padding: 10px 20px; border-radius: 5px; }
        .final-amount { font-size: 20px; font-weight: bold; color: green; margin-top: 15px; }
    </style>

    <script>
        function calculateFinalAmount() {
            var bookDate = document.getElementById("bookDate").value;
            var endDate = document.getElementById("endDate").value;
            var pricePerDay = parseFloat(document.getElementById("pricePerDay").value);

            if (bookDate && endDate && pricePerDay > 0) {
                var start = new Date(bookDate);
                var end = new Date(endDate);
                var totalDays = (end - start) / (1000 * 3600 * 24);

                if (totalDays < 0) {
                    alert("End date must be after the start date.");
                    return;
                }

                var finalAmount = totalDays * pricePerDay;
                document.getElementById("finalAmount").value = finalAmount.toFixed(2);
            }
        }

        function updateDriverContact() {
            var driverSelect = document.getElementById("driverSelect");
            var contactInput = document.getElementById("contactNumber");
            contactInput.value = driverSelect.options[driverSelect.selectedIndex].getAttribute("data-contact");
        }

        window.onload = function() {
            document.getElementById("bookDate").addEventListener("change", calculateFinalAmount);
            document.getElementById("endDate").addEventListener("change", calculateFinalAmount);
        }
    </script>
</head>
<body style="background-color: #f7f7f7;">

    <%@include file="all_component/navbar.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-md-10 offset-md-1">
                <div class="card">
                    <div class="row">
                        <%
                            Vehicle vehicle = (Vehicle) request.getAttribute("vehicle");
                            if (vehicle == null) {
                                response.sendRedirect("index.jsp?error=Vehicle details not available");
                                return;
                            }
                        %>
                        <div class="col-md-6">
                            <img src="<%= vehicle.getVehicleImage() %>" alt="<%= vehicle.getVehicleName() %>" class="vehicle-image">
                        </div>
                        <div class="col-md-6">
                            <h3 class="text-center">Book Vehicle</h3>
                            <hr>
                            <form action="VehicalBookServlet" method="post">
                                <input type="hidden" name="vehicleImage" value="<%= vehicle.getVehicleImage() %>">
                                <input type="hidden" name="vehicleId" value="<%= vehicle.getId() %>">
                                
                                <div class="mb-3">
                                    <label class="details-title">Vehicle Name:</label>
                                    <input type="text" name="vehicleName" class="form-control" value="<%= vehicle.getVehicleName() %>" readonly>
                                </div>
                                <div class="mb-3">
                                    <label class="details-title">Vehicle Type:</label>
                                    <input type="text" class="form-control" value="<%= vehicle.getVehicleType() %>" readonly>
                                </div>
                                <div class="mb-3">
                                    <label class="details-title">Vehicle Number:</label>
                                    <input type="text" name="vehicleNumber" class="form-control" value="<%= vehicle.getVehicleNumber() %>" readonly>
                                </div>
                                <div class="mb-3">
                                    <label class="details-title">Price per Day:</label>
                                    <input type="hidden" id="pricePerDay" value="<%= vehicle.getPrice() %>">
                                    <input type="text" class="form-control" value="₹<%= vehicle.getPrice() %>" readonly>
                                </div>
                                
                                <!-- Driver Selection from Database -->
                                <div class="mb-3">
                                    <label class="details-title">Driver Name:</label>
                                    <select id="driverSelect" name="driverId" class="form-control" onchange="updateDriverContact()">
                                        <option value="">Select Driver</option>
                                        <% 
                                            // Fetch list of drivers from the service
                                            DriverService driverService = new DriverService();
                                            List<Driver> drivers = driverService.getAllDrivers();
                                            for (Driver driver : drivers) {
                                        %>
                                            <option value="<%= driver.getId() %>" data-contact="<%= driver.getContactNumber() %>">
                                                <%= driver.getDriverName() %>
                                            </option>
                                        <% } %>
                                    </select>
                                </div>
                                
                                <!-- Auto-filled Driver Contact Number -->
                                <div class="mb-3">
                                    <label class="details-title">Driver Contact Number:</label>
                                    <input type="text" id="contactNumber" name="contactNumber" class="form-control" readonly>
                                </div>

                                <hr>
                                <h4>User Details</h4>

                                <div class="mb-3">
                                    <label class="details-title">Customer Name:</label>
                                    <input type="text" name="customerName" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="details-title">ID Card Number:</label>
                                    <input type="text" name="idCardNumber" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="details-title">Address:</label>
                                    <textarea name="address" class="form-control" rows="3" required></textarea>
                                </div>

                                <hr>
                                <h4>Booking Dates</h4>

                                <div class="mb-3">
                                    <label class="details-title">Vehicle Book Date:</label>
                                    <input type="date" id="bookDate" name="bookDate" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="details-title">Book End Date:</label>
                                    <input type="date" id="endDate" name="endDate" class="form-control" required>
                                </div>

                                <hr>
                                <div class="mb-3">
                                    <label class="details-title">Final Amount:</label>
                                    <input type="text" id="finalAmount" name="finalAmount" class="form-control" readonly>
                                </div>

                                <hr>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-success book-btn">Book Now</button>
                                    <a href="index.jsp" class="btn btn-secondary book-btn">Cancel</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="all_component/footer.jsp" %>

</body>
</html>
