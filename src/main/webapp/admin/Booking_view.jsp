<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cabbooking.model.Booking" %>
<%@ page import="com.cabbooking.service.BookingService" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - View Bookings</title>
    <%@ include file="allCss.jsp" %>
    <style>
        .table-container {
            margin-top: 40px;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
        .vehicle-image {
            width: 100px;
            height: 60px;
            object-fit: cover;
            border-radius: 5px;
        }
        .no-image {
            width: 100px;
            height: 60px;
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
        <h2 class="text-center mb-4">Booking List</h2>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Vehicle Name</th>
                    <th>Vehicle Number</th>
                    <th>Customer Name</th>
                    <th>Address</th>
                    <th>Book Date</th>
                    <th>End Date</th>
                    <th>Final Amount</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    BookingService bookingService = new BookingService();
                    List<Booking> bookings = bookingService.displayAllBookings(); // Fetch data from database
                    if (bookings != null && !bookings.isEmpty()) {
                        for (Booking b : bookings) {
                %>
                <tr>
                    <td><%= b.getId() %></td>
                    
                    <%-- Display vehicle image or "No Image" box if unavailable --%>
                    <td>
                        <% if (b.getVehicleImage() != null && !b.getVehicleImage().isEmpty()) { 
                            String imagePath = request.getContextPath() + "/" + b.getVehicleImage();
                        %>
                            <img src="<%= imagePath %>" alt="Vehicle Image" class="vehicle-image">
                        <% } else { %>
                            <div class="no-image">No Image</div>
                        <% } %>
                    </td>

                    <td><%= b.getVehicleName() %></td>
                    <td><%= b.getVehicleNumber() %></td>
                    <td><%= b.getCustomerName() %></td>
                    <td><%= b.getAddress() %></td>
                    <td><%= b.getBookDate() %></td>
                    <td><%= b.getEndDate() %></td>
                    <td>₹ <%= b.getFinalAmount() %></td>
                    <td>
                        <a href="accept_booking.jsp?id=<%= b.getId() %>" class="btn btn-success btn-sm">Accept</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="10" class="text-center">No bookings available.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

</body>
</html>
