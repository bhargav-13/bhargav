<%@page import="java.util.Random"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="com.dao.CartDao"%>
<%@page import="com.bean.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    
</head>

<body>
	<%@ include file="header.jsp" %>
      <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="index.jsp">Home</a>
                    <a class="breadcrumb-item text-dark" href="product.jsp">Shop</a>
                    <span class="breadcrumb-item active">Shopping Cart</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Cart Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    <%
                    int netprice = 0;
                      List<Cart> list =CartDao.getCartbyuser(u.getUid());

                      for(Cart c : list){
                    	  Product p = ProductDao.getProductByPid(c.getPid());
                    	  netprice = netprice+c.getTotal_price();
                    %>
                        <tr>
                            <td class="align-middle"><img src="product_image/<%=p.getProduct_image() %>" alt="" style="width: 50px;"> <%=p.getProduct_name() %></td>
                            <td class="align-middle"><%=p.getProduct_price() %></td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 50px;">
                                    <form name="change_qty" method="post"  action="CartController">
                                    <input type="hidden" name="cid" value="<%=c.getCid() %>" >
                                    <input type="number" name="product_qty" min="1" max="10"  class="form-control form-control-red form-control-sm bg-dark text-white border-2 text-center" value="<%=c.getProduct_qty()%>" onchange="this.form.submit();">
                                    </form>
                                </div>
                            </td>
                            <td class="align-middle"><%=c.getTotal_price() %></td>
                            <td class="align-middle"><a href="remove-from-cart.jsp?pid=<%=p.getPid()%>"	><button class="btn btn-sm btn-danger"><i class="fa fa-times"></i></button></a></td>
                        </tr>
                        <%
                      }
                      Random randomGenerator = new Random();
              		  int randomInt = randomGenerator.nextInt(1000000);
                        %>
                        
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
                <form class="mb-30" action="">
                    <div class="input-group">
                        <input type="text" class="form-control border-0 p-4" placeholder="Coupon Code">
                        <div class="input-group-append">
                            <button class="btn btn-outline-info">Apply Coupon</button>
                        </div>
                    </div>
                    <br>
                    <br>
                </form>
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-info pr-3 rounded-lg border border-secondary ">  Cart Summary</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="border-bottom pb-2">
                        <div class="d-flex justify-content-between mb-3">
                            <h6>Subtotal</h6>
                            <h6>Rs.<%=netprice%></h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Shipping</h6>
                            <h6 class="font-weight-medium">Rs.10</h6>
                        </div>
                    </div>
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5><b>Total</b></h5>
                            <h5><b>Rs.<%=netprice+100 %></b></h5>
                        </div>
                        
                    </div>
                    <form method="post" action="pgRedirect.jsp">
					<table border="1">
						<tbody>
							<tr>
								<th>S.No</th>
								<th>Label</th>
								<th>Value</th>
							</tr>
							<tr>
								<td>1</td>
								<td><label>ORDER_ID::*</label></td>
								<td><input id="ORDER_ID" tabindex="1" maxlength="20"
									size="20" name="ORDER_ID" autocomplete="off"
									value="ORDS_<%= randomInt %>"></td>
							</tr>
							<tr>
								<td>2</td>
								<td><label>CUSTID ::*</label></td>
								<td><input id="CUST_ID" tabindex="2" maxlength="30"
									size="12" name="CUST_ID" autocomplete="off" value="<%=u.getUid()%>_<%=u.getFname()%>"></td>
							</tr>
							<tr>
								<td>3</td>
								<td><label>INDUSTRY_TYPE_ID ::*</label></td>
								<td><input id="INDUSTRY_TYPE_ID" tabindex="4"
									maxlength="12" size="12" name="INDUSTRY_TYPE_ID"
									autocomplete="off" value="Retail"></td>
							</tr>
							<tr>
								<td>4</td>
								<td><label>Channel ::*</label></td>
								<td><input id="CHANNEL_ID" tabindex="4" maxlength="12"
									size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
								</td>
							</tr>
							<tr>
								<td>5</td>
								<td><label>txnAmount*</label></td>
								<td><input title="TXN_AMOUNT" tabindex="10" type="text"
									name="TXN_AMOUNT" value="<%=netprice+100%>"></td>
							</tr>
							<tr>
								<td colspan="3">
									<button value="CheckOut" type="submit" class="btn btn-block btn-success font-weight-bold my-3 py-3">Proceed To Checkout</button>
								</td>
								</tr>
						</tbody>
					</table>
					* - Mandatory Fields
				</form>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart End -->


    <!-- Footer Start -->
    <section class="info_section layout_padding">
    <div class="container links_container">
      <div class="row ">
        <div class="col-md-3">
          <h3>
            CUSTOMER SERVICE
          </h3>
          <ul>
            <li>
              <a href="">
                International Help
              </a>
            </li>
            <li>
              <a href="">
                Contact Customer Care
              </a>
            </li>
            <li>
              <a href="">
                Return Policy
              </a>
            </li>
            <li>
              <a href="">
                Privacy Policy
              </a>
            </li>
            <li>
              <a href="">
                Shipping Information
              </a>
            </li>
            <li>
              <a href="">
                Promotion Terms
              </a>
            </li>
          </ul>
        </div>
        <div class="col-md-3">
          <h3>
            LET US HELP YOU
          </h3>
          <ul>
            <li>
              <a href="">
                Your Account
              </a>
            </li>
            <li>
              <a href="">
                Your Orders
              </a>
            </li>
            <li>
              <a href="">
                Shipping Rates & Policies
              </a>
            </li>
            <li>
              <a href="">
                Amazon Prime
              </a>
            </li>
            <li>
              <a href="">
                Returns & Replacements
              </a>
            </li>
            <li>
              <a href="">
                Help
              </a>
            </li>
          </ul>
        </div>
        <div class="col-md-3">
          <h3>
            INFORMATION
          </h3>
          <ul>
            <li>
              <a href="">
                About Us
              </a>
            </li>
            <li>
              <a href="">
                Careers
              </a>
            </li>
            <li>
              <a href="">
                Sell on shop
              </a>
            </li>
            <li>
              <a href="">
                Press & News
              </a>
            </li>
            <li>
              <a href="">
                Competitions
              </a>
            </li>
            <li>
              <a href="">
                Terms & Conditions
              </a>
            </li>
          </ul>
        </div>
        <div class="col-md-3">
          <h3>
            OUR SHOP
          </h3>
          <ul>
            <li>
              <a href="">
                Daily Deals
              </a>
            </li>
            <li>
              <a href="">
                App Only Deals
              </a>
            </li>
            <li>
              <a href="">
                Our Hottest Products
              </a>
            </li>
            <li>
              <a href="">
                Gift Vouchers
              </a>
            </li>
            <li>
              <a href="">
                Trending Product
              </a>
            </li>
            <li>
              <a href="">
                Hot Flash Buy
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="follow_container">
        <div class="row">
          <div class="col-md-9">
            <div class="app_container">
              <h3>
                DOWNLOAD OUR APPS

              </h3>
              <div>
                <img src="images/google-play.png" alt="">
                <img src="images/apple-store.png" alt="">
              </div>
            </div>
          </div>
          <div class="col-md-3 ">
            <div class="info_social">
              <div>
                <a href="">
                  <img src="images/fb.png" href="https://www.facebook.com/profile.php?id=100005185455198">
                </a>
              </div>
              <div>
                <a href="">
                  <img src="images/twitter.png" href="https://twitter.com/thesiya_bhargav">
                </a>
              </div>
              <div>
                <a href="">
                  <img src="images/linkedin.png" href="https://www.linkedin.com/in/bhargav-thesiya-63900524a/">
                </a>
              </div>
              <div>
                <a href="">
                  <img src="images/instagram.png" href="https://www.instagram.com/radheinfosys_jnd/">
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
      Copyright &copy; 2019 All Rights Reserved By
      <a href="https://html.design/">Free Html Templates</a>
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