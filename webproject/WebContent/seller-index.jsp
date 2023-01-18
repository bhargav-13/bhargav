<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Home-Radhe</title>

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css?family=Dosis:400,500|Poppins:400,700&display=swap"
	rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="css/responsive.css" rel="stylesheet" />
</head>

<body>
	<div class="hero_area">
		<%@include file="seller-header.jsp"%>
	</div>

	<!-- detail section -->
	<section class="detail_section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3">
					<div class="detail_img-box">
						<img src="images/detail.png" alt="" class="w-100" />
					</div>
				</div>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				&nbsp; &nbsp; &nbsp;
				<div class=" col-lg-7">
					<div class="detail_container">
						<div class="detail-box d-box-1">
							<a href="view-product.jsp">
								<div class="detail-content">

									<h5>View products</h5>
								</div>
							</a>
						</div>
						<div class="detail-box d-box-2">
							<a href="">
								<div class="detail-content">
                              
									<h5>Edit products</h5>
								</div>
							</a>
						</div>

						<div class="detail-box d-box-3">
							<a href="add-product.jsp">
								<div class="detail-content">
									<img src="images/d-4.png" alt="" />
									<h5>Add Product</h5>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end detail section -->

	<!-- products section -->
	<section class="products_section">
		<div class="heading_container">

			<h2>
				&emsp;&emsp;&emsp;&nbsp;<br> <br> <br> <br> Your
				Products In Store
			</h2>
		</div>
		<div class="container layout_padding">
			<div class="product_container">
                <%
                   List<Product> list = ProductDao.getProductBySeller(u.getUid());
                   for(Product p : list){
                %>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="">
					<div class="product_box">
						<div class="product_img-box">
							<img src="product_image/<%=p.getProduct_image() %>" alt="" height="150px" width="150px" /> <span>
								Rs.<%=p.getProduct_price() %>/-
							</span>
						</div>
						<div class="product_detail-box">
							<span> <%=p.getProduct_name() %>

							</span>
							<p>
								<%=p.getProduct_category() %>
							</p>
						</div>
					</div>
				</a>
				<br>
				<%} %>
				
			</div>
		</div>



		<!-- info section -->
		<section class="info_section layout_padding">
			<div class="container links_container">
				<div class="row ">
					<div class="col-md-3">
						<h3>SELLER SERVICE</h3>
						<ul>
							<li><a href=""> International Help </a></li>
							<li><a href=""> Contact Seller Care </a></li>
							<li><a href=""> Return Policy </a></li>
							<li><a href=""> Privacy Policy </a></li>
							<li><a href=""> Promotion Terms </a></li>
						</ul>
					</div>
					<div class="col-md-3">
						<h3>LET US HELP YOU</h3>
						<ul>
							<li><a href=""> Your Account </a></li>
							<li><a href=""> Amazon Prime </a></li>
							<li><a href=""> Returns & Replacements </a></li>
							<li><a href=""> Help </a></li>
						</ul>
					</div>
					<div class="col-md-3">
						<h3>INFORMATION</h3>
						<ul>
							<li><a href=""> About Us </a></li>
							<li><a href=""> Careers </a></li>
							<li><a href="signup.jsp"> Sell on shop </a></li>
							<li><a href=""> Press & News </a></li>
							<li><a href=""> Competitions </a></li>
							<li><a href=""> Terms & Conditions </a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="follow_container">
					<div class="row">
						<div class="col-md-9">
							<div class="app_container">
								<h3>DOWNLOAD OUR APPS</h3>
								<div>
									<img src="images/google-play.png" alt=""> <img
										src="images/apple-store.png" alt="">
								</div>
							</div>
						</div>
						<div class="col-md-3 ">
							<div class="info_social">
								<div>
									<a href=""> <img src="images/fb.png"
										href="https://www.facebook.com/profile.php?id=100005185455198">
									</a>
								</div>
								<div>
									<a href=""> <img src="images/twitter.png"
										href="https://twitter.com/thesiya_bhargav">
									</a>
								</div>
								<div>
									<a href=""> <img src="images/linkedin.png"
										href="https://www.linkedin.com/in/bhargav-thesiya-63900524a/">
									</a>
								</div>
								<div>
									<a href=""> <img src="images/instagram.png"
										href="https://www.instagram.com/radheinfosys_jnd/">
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- end info section -->

		<!-- footer section -->
		<section class="container-fluid footer_section">
			<p>
				Copyright &copy; 2019 All Rights Reserved By <a
					href="https://html.design/">Free Html Templates</a>
			</p>
		</section>

		<!-- footer section -->

		<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>

		<script>
    function openNav() {
      document.getElementById("myNav").style.width = "100%";
    }

    function closeNav() {
      document.getElementById("myNav").style.width = "0%";
    }
  </script>
</body>

</html>