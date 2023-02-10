<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
  	<title>Sign up </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">

	</head>
	<body class="img js-fullheight" style="background-image: url(images/bg.jpg);">
	<%@include file="header.jsp" %>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">change password</h2>	
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-5">
					<div class="login-wrap p-0">
					
					<b style="color: red;">
                <%
                      if(request.getAttribute("msg")!=null){
                    	  out.print(request.getAttribute("msg"));
                      }
                %>
                </b>
		      	
		      	<form  name="changepass"  method="post" action="UserController" class="signin-form">

	            <div class="for	m-group">
	              <input id="password-field" type="password" name ="old_password" class="form-control" placeholder="old password" required>
	              <br>
	            </div>
	            <div class="for	m-group">
	              <input id="password-field" type="password" name ="new_password" class="form-control" placeholder="new password" required>
	              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
	            </div>
	            <div class="for	m-group">
	              <input id="password-field" type="password" name ="cnew_password" class="form-control" placeholder="confirm new password" required>
	              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
	            </div>
	            <div class="form-group">
	            	<button type="submit" class="form-control btn btn-primary submit px-3" name="action" id="sendMessageButton" value = "changepass" >change password</button>
	            </div>
	            <div class="form-group d-md-flex">
	            	<div class="w-50">
								</div>
								<div class="w-50 text-md-right">
									<a href="signup.jsp" style="color: dark">make new one...</a>
								</div>
	            </div>
	          </form>
	          
	          </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>

	</body>
</html>

