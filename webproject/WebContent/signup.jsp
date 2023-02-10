<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up-Radhe</title>
</head>
<body>
<div class="hero_area">
<%@include file="header.jsp" %>
<section class="h-100 gradient-form" style="background-color: #eee;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-10">
        <div class="card rounded-3 text-black">
          <div class="row g-0">
            <div class="col-lg-6">
              <div class="card-body p-md-5 mx-md-4">

                <div class="text-center">
                  <img src="images/radhe.png"
                    style="width: 200px;" alt="">
                  
                </div>
                
                <b style="color: red;">
                <%
                      if(request.getAttribute("msg")!=null){
                    	  out.print(request.getAttribute("msg"));
                      }
                %>
                </b>

                <p><b>PLEASE ENTER DETAILS</b></p>
                <form name="signup" method="post" action="UserController" >
                
                <div class="form-outline mb-4">
                    <select id="name" name ="usertype" class="form-control" >
                      <option>---Select User Type---</option>
                      <option value="buyer">Buyer</option>
                      <option value="seller">Seller</option>
                      </select>
                  </div>
                  
                  
                  <div class="form-outline mb-4">
                    <input type="text" id="name" name ="fname" class="form-control" id="name"
                      placeholder="Your First Name" />
                  </div>
                  
                  <div class="form-outline mb-4">
                    <input type="text" class="form-control" name ="lname" id="name"
                      placeholder="Your Last Name" />
                    </div>

                  <div class="form-outline mb-4">
                    <input type="email" id="email" name="email" class="form-control"
                      placeholder="email address" />
                    </div>
                  
                  <div class="form-outline mb-4">
                    <input type="text" id="subject" name="mobile" class="form-control"
                      placeholder="Phone number" />
                  </div>
                  

                  <div class="form-outline mb-4">
                    <input type="password" id="name" name="password" class="form-control" placeholder="password"/>
                  </div>
                  
                  <div class="form-outline mb-4">
                    <input type="password" id="name" name="cpassword" class="form-control" placeholder="comfirm password" //>
                  </div>

                  <div class="text-center pt-1 mb-5 pb-1">
                    <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3"  type="submit" name="action" id="sendMessageButton" value = "signup">Sign up</button>
                    <a class="text-danger" href="login.jsp" ><p> <b>already have an account?</b></p></a>
                  </div>
                  </form>
                  </div>
                  </div>
                  </div>
                  </div>
                  </div>
                  </div>
                  </div>
                  </section>
                  </div>
                  
</body>
</html>