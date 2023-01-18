<%@page import="com.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Radhe</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Dosis:400,500|Poppins:400,700&display=swap" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
</head>

<body>
  <div class="hero_area">
    <!-- header section strats -->
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container">
          <a class="navbar-brand" href="seller-index.jsp">
            <img src="images/radhe.png" alt="" /><span>
              Radhe
            </span>
          </a>

          <div class="navbar-collapse" id="">
            <div class="container">
              <div class=" mr-auto flex-column flex-lg-row align-items-center">
                <ul class="navbar-nav justify-content-between ">
                  <div class="d-none d-lg-flex">
                    <li class="nav-item">
                      <a class="nav-link" href="fruit.jsp">
                        Customer Number : +91 9624413978</a>
                    </li>
                    
                    <li class="nav-item">
                      <a class="nav-link" href="service.jsp" color="blue">
                       HELP
                      </a>
                    </li>
                  </div>
                  <div class=" d-none d-lg-flex">
                    <li class="nav-item">
                      
                    </li>
                    <form class="form-inline my-2 ml-5 mb-3 mb-lg-0">
                      <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
                    </form>
                  </div>
                </ul>
              </div>
            </div>

            <div class="custom_menu-btn">
              <button onclick="openNav()"></button>
            </div>
            <div id="myNav" class="overlay">
              <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
              <div class="overlay-content">
              <%
                 User u=null;
                 if(session!=null){
                	 if(session.getAttribute("u")!=null){
                		 u=(User)session.getAttribute("u");
               %>
                <a href="add-product.jsp">Add Product</a>
                <a href="view-product.jsp">VIEW PRODUCTS</a>
                <a href="logout.jsp">logout</a>
                <a href="changepass.jsp">Change Password</a>
               <%
                	 }
                	 else
                	 {
                %>
                <a href="index.jsp">HOME</a>
                <a href="product.jsp">PRODUCTS</a>
                <a href="login.jsp">login</a>
                <a href="signup.jsp">register</a>
                <%
                 }
                 }
                 else
                 {
                %>
                    <a href="index.jsp">HOME</a>
                    <a href="product.jsp">PRODUCTS</a>
                    <a href="login.jsp">login</a>
                    <a href="signup.jsp">register</a>
                <%
                 }
                 
                %>
                
              </div>
            </div>
          </div>
        </nav>
      </div>
    </header>
    </div>
    </body>
    <!-- end header section -->
</html>