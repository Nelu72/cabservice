<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Vehicle</title>
    
    <%-- Include Bootstrap & Custom CSS --%>
    <%@include file="../all_component/allCss.jsp"%>
    
    <style>
        /* Navbar Styling */
        .navbar {
            background-color: #007bff !important; /* Bootstrap Primary Blue */
        }
        .navbar .nav-link, .navbar .navbar-brand {
            color: white !important;
        }

        /* Form Container */
        .container {
            margin-top: 40px;
        }

        /* Card Styling */
        .card {
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        /* Form Controls */
        .form-control-lg {
            font-size: 18px;
            padding: 10px;
        }

        /* Submit Button */
        .btn-lg {
            font-size: 20px;
            padding: 10px;
            width: 100%;
        }
    </style>
</head>
<body style="background-color: #f0f2f2;">

    <%-- Include Navbar --%>
    <%@include file="../all_component/navbar.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2"> <!-- Wider form -->
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center">Add Vehicle</h3> <!-- Bigger Heading -->

                        <form action="../AdminAddVehicalServlet" method="post" enctype="multipart/form-data">
                            <!-- Vehicle Name -->
                            <div class="form-group">
                                <label for="vehicleName">Vehicle Name*</label>
                                <input name="vehicle_name" type="text" class="form-control form-control-lg" id="vehicleName" required>
                            </div>

                            <!-- Vehicle Type -->
                            <div class="form-group">
                                <label for="vehicleType">Vehicle Type*</label>
                                <input name="vehicle_type" type="text" class="form-control form-control-lg" id="vehicleType" required>
                            </div>

                            <!-- Price -->
                            <div class="form-group">
                                <label for="price">Price*</label>
                                <input name="price" type="number" class="form-control form-control-lg" id="price" required>
                            </div>

                            <!-- Vehicle Details -->
                            <div class="form-group">
                                <label for="details">Details*</label>
                                <textarea class="form-control form-control-lg" id="details" name="details" rows="4" required></textarea>
                            </div>

                            <!-- Vehicle Category -->
                            <div class="form-group">
                                <label for="vehicleCategory">Vehicle Category*</label>
                                <select class="custom-select custom-select-lg" id="vehicleCategory" name="vehicle_category">
                                    <option value="New Generation Vehicles" selected>New Generation Vehicles</option>
                                    <option value="Old Generation Vehicles">Old Generation Vehicles</option>
                                </select>
                            </div>

                            <!-- Vehicle Number -->
                            <div class="form-group">
                                <label for="vehicleNumber">Vehicle Number*</label>
                                <input name="vehicle_number" type="text" class="form-control form-control-lg" id="vehicleNumber" required>
                            </div>

                            <!-- Engine Capacity -->
                            <div class="form-group">
                                <label for="engineCapacity">Engine Capacity*</label>
                                <input name="engine_capacity" type="text" class="form-control form-control-lg" id="engineCapacity" required>
                            </div>
                            
                            
                         

                            <!-- Vehicle Image Upload -->
                            <div class="form-group">
                                <label for="vehicleImage">Upload Vehicle Image</label>
                                <input type="file" class="form-control-file" id="vehicleImage" name="vehicle_image" required>
                            </div>

                            <!-- Submit Button -->
                            <button type="submit" class="btn btn-primary btn-lg btn-block">Add Vehicle</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
