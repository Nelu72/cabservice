<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mega city cab: Register</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #f0f1f2;">
  <%@include file="all_component/navbar.jsp" %>

  <div class="container p-2">
    <div class="row">
      <div class="col-md-4 offset-md-4">
        <div class="card">
          <div class="card-body">
            
            <%-- Display Success or Error Message --%>
            <% String message = (String) request.getAttribute("message");
               String messageType = (String) request.getAttribute("messageType");
               if (message != null) { %>
                <div class="alert alert-<%= messageType %>" role="alert">
                  <%= message %>
                </div>
            <% } %>

            <form action="RegisterServlet" method="post">
              <h4 class="text-center">Registration Form</h4>

              <div class="form-group">
                  <label>Enter Full Name</label>
                  <input type="text" class="form-control" name="fullName" required="required">
              </div>

              <div class="form-group">
                  <label>Email Address</label>
                  <input type="email" class="form-control" name="email" required="required">
              </div>

              <div class="form-group">
                  <label>Phone No</label>
                  <input type="text" class="form-control" name="phone" required="required">
              </div>

              <div class="form-group">
                  <label>Password</label>
                  <input type="password" class="form-control" name="password" required="required">
              </div>

              <button type="submit" class="btn btn-primary">Submit</button>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>

  <%@include file="all_component/footer.jsp" %>
</body>
</html>
