<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us - Mega City Cab</title>
    <%@include file="all_component/allCss.jsp" %>
    <style>
     .about-section {
    background: #303f9f; /* Temporary solid color */
    padding: 100px 0;
    color: white;
    text-align: center;
}

        .card {
            transition: 0.3s;
        }
        .card:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <%@include file="all_component/navbar.jsp" %>

    <div class="about-section">
        <h1>Welcome to Mega City Cab</h1>
        <p>Your trusted partner for safe, comfortable, and affordable rides.</p>
    </div>

    <!-- About Us Content -->
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6">
                <img src="img/man.jpeg" class="img-fluid rounded shadow" alt="Mega City Cab">
            </div>
            <div class="col-md-6">
                <h2 class="text-primary">Who We Are</h2>
                <p>
                    Mega City Cab is a premium cab service provider dedicated to making transportation
                    seamless and convenient. With a fleet of modern vehicles and professional drivers,
                    we ensure a safe and comfortable journey for all our customers.
                </p>
                <ul class="list-unstyled">
                    <li><i class="fas fa-check-circle text-success"></i> 24/7 Customer Support</li>
                    <li><i class="fas fa-check-circle text-success"></i> Affordable Pricing</li>
                    <li><i class="fas fa-check-circle text-success"></i> Highly Trained Drivers</li>
                    <li><i class="fas fa-check-circle text-success"></i> Easy Booking System</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Our Services -->
    <div class="container mt-5">
        <h2 class="text-center text-primary">Our Services</h2>
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card shadow-sm text-center p-3">
                    <i class="fas fa-car fa-3x text-primary"></i>
                    <h4 class="mt-3">City Rides</h4>
                    <p>Quick and affordable rides across the city, available 24/7.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm text-center p-3">
                    <i class="fas fa-plane fa-3x text-primary"></i>
                    <h4 class="mt-3">Airport Transfers</h4>
                    <p>Reliable airport pick-up and drop services to ensure timely travel.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm text-center p-3">
                    <i class="fas fa-road fa-3x text-primary"></i>
                    <h4 class="mt-3">Outstation Trips</h4>
                    <p>Comfortable and safe long-distance travel at competitive rates.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact Section -->
    <div class="container mt-5 text-center">
        <h2 class="text-primary">Get In Touch</h2>
        <p>Have questions? Reach out to us anytime!</p>
        <a href="ContactUs.jsp" class="btn btn-primary"><i class="fas fa-phone"></i> Contact Us</a>
    </div>

    <%@include file="all_component/footer.jsp" %>
</body>
</html>
