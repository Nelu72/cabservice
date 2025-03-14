<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mega city cab login</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #f0f1f2;">
  <%@include file="all_component/navbar.jsp" %>

  <div class="container">
    <div class="row mt-2">
      <div class="col-md-4 offset-md-4">
        <div class="card">
          <div class="card-body">

            <h3 class="text-center">Login Form</h3>

            <%-- Display Success or Error Message --%>
            <% 
              String message = (String) session.getAttribute("message");
              String messageType = (String) session.getAttribute("messageType");
              if (message != null) { 
            %>
              <div class="alert alert-<%= messageType %>" role="alert">
                <%= message %>
              </div>
            <% 
              session.removeAttribute("message"); 
              session.removeAttribute("messageType");
              } 
            %>

            <form action="LoginServlet" method="post">
              <div class="form-group">
                <label for="exampleInputEmail1">Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
              </div>
              <div class="text-center">
                <button type="submit" class="btn btn-primary">Login</button><br>
                <a href="register.jsp">Create Account</a>
              </div>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
  
</body>
</html>
