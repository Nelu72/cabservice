<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin panel</title>
<%@include file="allCss.jsp" %>
</head>
<body>
      <%@include file="navbar.jsp" %>
 <style type="text/css">
 a{
   text-decoration: none;
   color: black;
 }
 
 a:hover {
	text-decoration: none;
	color: black;
}
 
 </style>
 
 <div class="container">
 <div class="row p-5">
 <div class="col-md-3">
 
 <a href="add_vehical.jsp">
 <div class="card">
 <div class="card-body text-center">
 <i class="fa-solid fa-plus-square fa-3x text-primary"></i><br>
 <h4>Add Vehical</h4>
 -----------
 </div>
 </div>
 
 </a>
 </div>
 
 
  <div class="col-md-3">
  <a href="view_vehical.jsp">
 <div class="card">
 <div class="card-body text-center">
 <i class="fa-solid fa-car fa-3x text-danger"></i></i><br>
 <h4>View Vehical</h4>
 -----------
 </div>
 </div>
 </a>
 </div>
 
 
 
  <div class="col-md-3">
  <a href="Booking_view.jsp">
 <div class="card">
 <div class="card-body text-center">
<i class="fa-solid fa-box-open fa-3x text-warning"></i><br>
 <h4>Booking details</h4>
 -----------
 </div>
 </div>
 </a>
 </div>
 
   <div class="col-md-3">
 <div class="card">
 <div class="card-body text-center">
 <i class="fa-solid fa-user fa-3x text-primary"></i><br>
 <h4>user details</h4>
 -----------
 </div>
 </div>
 </div>
 
 
    <div class="col-md-3">
   <a href="Add_driver.jsp">
 <div class="card">
 <div class="card-body text-center">
<i class="fa-solid fa-users fa-3x text-primary"></i><br>
 <h4>Add to Driver</h4>
 -----------
 </div>
 </div>
 </div>
 
    <div class="col-md-3">
   <a href="Driver_details.jsp">
 <div class="card">
 <div class="card-body text-center">
<i class="fa-solid fa-circle-info fa-3x  text-warning"></i><br>
 <h4>Driver Details</h4>
 -----------
 </div>
 </div>
 </div>
 
 
  <div class="col-md-3">
   <a href="../index.jsp">
 <div class="card">
 <div class="card-body text-center">
<i class="fa-solid fa-right-from-bracket fa-3x text-danger"></i><br>
 <h4>Log out</h4>
 -----------
 </div>
 </div>
 </div>
 
 

 
 </div>
 
</body>
</html>