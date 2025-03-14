<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Contact Us - Mega City Cab</title>
  <%@ include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #f0f1f2;">
  <%@ include file="all_component/navbar.jsp" %>

  <div class="container p-4">
    <div class="row">
      <div class="col-md-8 offset-md-2">
        <div class="card">
          <div class="card-body">
            <h3 class="text-center">Contact Us</h3>
            <p class="text-center">Have any questions or inquiries? Please fill out the form below, and our team will get back to you as soon as possible.</p>

            <!-- Contact Form -->
            <form action="ContactUsServlet" method="post">
              <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" required="required">
              </div>
              
              <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" required="required">
              </div>
              
              <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" class="form-control" id="phone" name="phone">
              </div>

              <div class="form-group">
                <label for="message">Message</label>
                <textarea class="form-control" id="message" name="message" rows="5" required="required"></textarea>
              </div>

              <div class="form-group text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="all_component/footer.jsp" %>
</body>
</html>
