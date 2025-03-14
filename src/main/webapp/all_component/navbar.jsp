<%
    String userEmail = (String) session.getAttribute("userEmail"); // Get email stored in session after login
    String fullName = (String) session.getAttribute("user"); // Get full name stored in session after login
    String displayName = "Login"; // Default display name

    if (fullName != null) {
        displayName = fullName; // Show full name if available
    } else if (userEmail != null) {
        displayName = userEmail.split("@")[0]; // Show part of email if name is not available
    }
%>

<div class="container-fluid" style="height: 10px; background-color: #303f9f"></div>

<div class="container-fluid p-3 bg-light">
    <div class="row">
        <div class="col-md-3 text-success">
            <h3>
                <i class="fa-solid fa-car"></i> Mega City Cab
            </h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
        <div class="col-md-3 text-right">
            <% if (userEmail == null) { %>
                <!-- Display login and register buttons if not logged in -->
                <a href="login.jsp" class="btn btn-success">
                    <i class="fa-solid fa-right-to-bracket"></i> Login
                </a>
                <a href="register.jsp" class="btn btn-primary text-white">
                    <i class="fa-solid fa-user"></i> Register
                </a>
            <% } else { %>
                <!-- Display username and logout button if logged in -->
                <a href="#" class="btn btn-success">
                    <i class="fa-solid fa-user"></i> <%= displayName %>
                </a>
                <a href="logout" class="btn btn-danger">Logout</a>
            <% } %>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active"><a class="nav-link" href="#"><i class="fas fa-home"></i> Home
                <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active"><a class="nav-link" href="#"> <i class="fa-solid fa-car"></i> Rented vehicles </a></li>
            <li class="nav-item active"><a class="nav-link" href="#"> <i class="fa-solid fa-car"></i> Old vehicles </a></li>
            <li class="nav-item active">
                <a class="nav-link" href="AboutUs.jsp"> 
                    <i class="fa-solid fa-car"></i> About Us 
                </a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
           <a href="View_driver.jsp" class="btn btn-light my-2 my-sm-0">
    <i class="fa-solid fa-person"></i> Drivers
</a>

            <a href="ContactUs.jsp">
                <button class="btn btn-light my-2 my-sm-0 ml-1" type="button"> 
                    <i class="fa-solid fa-phone"></i> Contact Us
                </button>
            </a>
        </form>
    </div>
</nav>
