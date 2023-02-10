<%@page import="com.dao.CartDao"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
</head>
<body>
	<%@ include file="header.jsp"%>

	<!-- Breadcrumb Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="index.jsp">Home</a> <a
						class="breadcrumb-item text-dark" href="product.jsp">Products</a>
					<span class="breadcrumb-item active">Product Detail</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<%
		Product p = ProductDao.getProductByPid(Integer.parseInt(request.getParameter("pid")));
	%>
	<!-- Shop Detail Start -->
	<div class="container-fluid pb-5">
		<div class="row px-xl-5">
			<div class="col-lg-5 mb-30">
				<div id="product-carousel" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner bg-light">
						<div class="carousel-item active">
							<img class="w-100 h-100"
								src="product_image/<%=p.getProduct_image() %>" alt="Image">
						</div>

					</div>
					<a class="carousel-control-prev" href="#product-carousel"
						data-slide="prev"> <i class="fa fa-2x fa-angle-left text-dark"></i>
					</a> <a class="carousel-control-next" href="#product-carousel"
						data-slide="next"> <i
						class="fa fa-2x fa-angle-right text-dark"></i>
					</a>
				</div>
			</div>

			<div class="col-lg-7 h-auto mb-30">
				<div class="h-100 bg-light p-30">
					<h3>
						<b><%=p.getProduct_name() %></b>
					</h3>
					<div class="d-flex mb-3">
						<div class="text-primary mr-2">
							<small class="fas fa-star"></small> <small class="fas fa-star"></small>
							<small class="fas fa-star"></small> <small
								class="fas fa-star-half-alt"></small> <small class="far fa-star"></small>
						</div>

					</div>
					<h3 style="color: red;" class="font-weight-semi-bold mb-4">
						<b>Rs.<%=p.getProduct_price() %>/-
						</b>
					</h3>
					<p class="mb-4"><%=p.getProduct_desc() %></p>


					<div class="d-flex align-items-center mb-4 pt-2">
						<!-- <div class="input-group quantity mr-3" style="width: 130px;">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-minus">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input type="text" class="form-control bg-secondary border-0 text-center" value="1">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-plus">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div> -->
						<%
                         	if(session.getAttribute("u")!=null)
                            {
                                			
                         %>
						<%
                               boolean flag1 = CartDao.checkCart(u.getUid(), p.getPid());
                               if(flag1==false){
                            %>
						<a href="add-to-cart.jsp?pid=<%=p.getPid()%>">
							<button class="btn btn-info px-3">
								<i class="fa fa-shopping-cart mr-1"></i> Add To Cart
							</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</a>
						
						<%
                               }
                               else
                               {
                        %>
                        <a href="remove-from-cart.jsp?pid=<%=p.getPid()%>">
							<button class="btn btn-info px-3">
								<i class="fa fa-shopping-cart mr-1"></i> Remove from cart
							</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</a>
                        
                        
						<%
                               }
						%>

						<%
								  boolean flag = WishlistDao.checkWishlist(u.getUid(), p.getPid());
								  if(flag==false){
								%>
						<a href="add-to-wishlist.jsp?pid=<%=p.getPid()%>">
							<button class="btn btn-warning px-3">
								<i class="fa fa-heart mr-1"></i> Add To Wishlist
							</button>
						</a>
						<%
								  }
								  else
								  {
								%>
						<a href="remove-from-wishlist.jsp?pid=<%=p.getPid()%>">
							<button class="btn btn-warning px-3">
								<i class="fa fa-heart mr-1"></i> Remove To Wishlist
							</button>
						</a>
						<%
                            }
                            }
                         	else
                         	{
                         %>
						<a href="login.jsp"><button class="btn btn-primary px-3">
								<i class="fa fa-sign-in mr-1"></i> Login
							</button></a>
						<%
                         	}
                         %>
					</div>

				</div>
			</div>
		</div>
		<div class="row px-xl-5">
			<div class="col">
				<div class="bg-light p-30">
					<div class="nav nav-tabs mb-4">
						<a class="nav-item nav-link text-dark active" data-toggle="tab"
							href="#tab-pane-1">Description</a> <a
							class="nav-item nav-link text-dark" data-toggle="tab"
							href="#tab-pane-2">Information</a> <a
							class="nav-item nav-link text-dark" data-toggle="tab"
							href="#tab-pane-3">Reviews (0)</a>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="tab-pane-1">
							<h4 class="mb-3">Product Description</h4>
							<p><%=p.getProduct_desc() %></p>
						</div>
						<div class="tab-pane fade" id="tab-pane-2">
							<h4 class="mb-3">Additional Information</h4>
							<p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam
								sea. Consetetur vero aliquyam invidunt duo dolores et duo sit.
								Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur
								invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd
								ipsum rebum diam. Dolore diam stet rebum sed tempor kasd eirmod.
								Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut
								diam consetetur duo justo est, sit sanctus diam tempor aliquyam
								eirmod nonumy rebum dolor accusam, ipsum kasd eos consetetur at
								sit rebum, diam kasd invidunt tempor lorem, ipsum lorem elitr
								sanctus eirmod takimata dolor ea invidunt.</p>
							<div class="row">
								<div class="col-md-6">
									<ul class="list-group list-group-flush">
										<li class="list-group-item px-0">Sit erat duo lorem duo
											ea consetetur, et eirmod takimata.</li>
										<li class="list-group-item px-0">Amet kasd gubergren sit
											sanctus et lorem eos sadipscing at.</li>
										<li class="list-group-item px-0">Duo amet accusam eirmod
											nonumy stet et et stet eirmod.</li>
										<li class="list-group-item px-0">Takimata ea clita labore
											amet ipsum erat justo voluptua. Nonumy.</li>
									</ul>
								</div>
								<div class="col-md-6">
									<ul class="list-group list-group-flush">
										<li class="list-group-item px-0">Sit erat duo lorem duo
											ea consetetur, et eirmod takimata.</li>
										<li class="list-group-item px-0">Amet kasd gubergren sit
											sanctus et lorem eos sadipscing at.</li>
										<li class="list-group-item px-0">Duo amet accusam eirmod
											nonumy stet et et stet eirmod.</li>
										<li class="list-group-item px-0">Takimata ea clita labore
											amet ipsum erat justo voluptua. Nonumy.</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab-pane-3">
							<div class="row">
								<div class="col-md-6">
									<h4 class="mb-4">1 review for "Product Name"</h4>
									<div class="media mb-4">
										<img src="" alt="Image" class="img-fluid mr-3 mt-1"
											style="width: 45px;">
										<div class="media-body">
											<h6>
												John Doe<small> - <i>01 Jan 2045</i></small>
											</h6>
											<div class="text-primary mb-2">
												<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i>
												<i class="far fa-star"></i>
											</div>
											<p>Diam amet duo labore stet elitr ea clita ipsum, tempor
												labore accusam ipsum et no at. Kasd diam tempor rebum magna
												dolores sed sed eirmod ipsum.</p>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<h4 class="mb-4">Leave a review</h4>
									<small>Your email address will not be published.
										Required fields are marked *</small>
									<div class="d-flex my-3">
										<p class="mb-0 mr-2">Your Rating * :</p>
										<div class="text-primary">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i>
										</div>
									</div>
									<form>
										<div class="form-group">
											<label for="message">Your Review *</label>
											<textarea id="message" cols="30" rows="5"
												class="form-control"></textarea>
										</div>
										<div class="form-group">
											<label for="name">Your Name *</label> <input type="text"
												class="form-control" id="name">
										</div>
										<div class="form-group">
											<label for="email">Your Email *</label> <input type="email"
												class="form-control" id="email">
										</div>
										<div class="form-group mb-0">
											<input type="submit" value="Leave Your Review"
												class="btn btn-primary px-3">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Shop Detail End -->




	<!-- info section -->
	<section class="info_section layout_padding">
		<div class="container links_container">
			<div class="row ">
				<div class="col-md-3">
					<h3>CUSTOMER SERVICE</h3>
					<ul>
						<li><a href=""> International Help </a></li>
						<li><a href=""> Contact Customer Care </a></li>
						<li><a href=""> Return Policy </a></li>
						<li><a href=""> Privacy Policy </a></li>
						<li><a href=""> Shipping Information </a></li>
						<li><a href=""> Promotion Terms </a></li>
					</ul>
				</div>
				<div class="col-md-3">
					<h3>LET US HELP YOU</h3>
					<ul>
						<li><a href=""> Your Account </a></li>
						<li><a href=""> Your Orders </a></li>
						<li><a href=""> Shipping Rates & Policies </a></li>
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
						<li><a href=""> Sell on shop </a></li>
						<li><a href=""> Press & News </a></li>
						<li><a href=""> Competitions </a></li>
						<li><a href=""> Terms & Conditions </a></li>
					</ul>
				</div>
				<div class="col-md-3">
					<h3>OUR SHOP</h3>
					<ul>
						<li><a href=""> Daily Deals </a></li>
						<li><a href=""> App Only Deals </a></li>
						<li><a href=""> Our Hottest Products </a></li>
						<li><a href=""> Gift Vouchers </a></li>
						<li><a href=""> Trending Product </a></li>
						<li><a href=""> Hot Flash Buy </a></li>
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