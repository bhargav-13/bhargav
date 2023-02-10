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
                    <span class="breadcrumb-item active">My Orders</span>
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
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    <%
                    int netprice = 0;
                      List<Cart> list =CartDao.getMyOrder(u.getUid());

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
                                    <input type="text" name="product_qty"  class="form-control form-control-red form-control-sm bg-dark text-white border-2 text-center" value="<%=c.getProduct_qty()%>">
                                    </form>
                                </div>
                            </td>
                            <td class="align-middle"><%=c.getTotal_price() %></td>
                            
                        </tr>
                        <%
                      }
                        %>
                        
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
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