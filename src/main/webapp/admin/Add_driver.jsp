<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Driver Details</title>
    <%@include file="../all_component/allCss.jsp"%>
    
    <style>
        .navbar {
            background-color: #007bff !important;
        }
        .navbar .nav-link, .navbar .navbar-brand {
            color: white !important;
        }
        .container {
            margin-top: 40px;
        }
        .card {
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .form-control-lg {
            font-size: 18px;
            padding: 10px;
        }
        .btn-lg {
            font-size: 20px;
            padding: 10px;
            width: 100%;
        }
    </style>
</head>
<body style="background-color: #f0f2f2;">
    <%@include file="../all_component/navbar.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center">Add Driver Details</h3>

                        <form action="../AddDriverServlet" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="driverName">Driver Name*</label>
                                <input name="driver_name" type="text" class="form-control form-control-lg" id="driverName" required>
                            </div>

                            <div class="form-group">
                                <label for="contactNumber">Contact Number*</label>
                                <input name="contact_number" type="text" class="form-control form-control-lg" id="contactNumber" required>
                            </div>

                            <div class="form-group">
                                <label for="address">Address*</label>
                                <textarea class="form-control form-control-lg" id="address" name="address" rows="3" required></textarea>
                            </div>

                            <div class="form-group">
                                <label for="details">Details*</label>
                                <textarea class="form-control form-control-lg" id="details" name="details" rows="4" required></textarea>
                            </div>

                            <div class="form-group">
                                <label for="driverImage">Driver Image*</label>
                                <input type="file" class="form-control form-control-lg" id="driverImage" name="driver_image" accept="image/*" required>
                            </div>

                            <button type="submit" class="btn btn-primary btn-lg btn-block">Add Driver</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
