<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>change password-radhe</title>
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

                <form method="post" action="UserController">
 
                  <div class="form-outline mb-4">
                    <input type="password" id="name" name= "old_password" class="form-control" />
                    <label class="form-label" for="form2Example22">Your Old Password</label>
                  </div>
                  
                  <div class="form-outline mb-4">
                    <input type="password" id="name" name= "new_password" class="form-control" />
                    <label class="form-label" for="form2Example22">Your New Password</label>
                  </div>
                  
                  <div class="form-outline mb-4">
                    <input type="password" id="name" name= "cnew_password" class="form-control" />
                    <label class="form-label" for="form2Example22">Your Confirm New Password</label>
                  </div>

                  <div class="text-center pt-1 mb-5 pb-1">
                    <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit" name ="action" value ="changepassword" >Change password</button>
                    <a class="text-danger" href="forgot-password.jsp">Forgot password?</a>
                  </div>

                  <div class="d-flex align-items-center justify-content-center pb-4">
                    <p class="mb-0 me-2">Don't have an account?</p>
                 
                    <a type="button" class="btn btn-outline-danger" href ="signup.jsp"><b>Create new</b></a>
                  </div>

                </form>

              </div>
            </div>
            <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
              <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                <h4 class="mb-4">We are more than just a company</h4>
                <p class="small mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                  exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
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