<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add product-Radhe</title>
</head>
<body>

<div class="hero_area">
<%@include file="seller-header.jsp" %>


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
                <form name="addproduct" method="post" action="ProductController" enctype="multipart/form-data" >
                
                <input type="hidden" name="seller" value="<%=u.getUid() %>">
                <div class="form-outline mb-4">
                    <select id="name" name ="product_category" class="form-control" >
                      <option>---Select Category---</option>
                      <option value="laptop">LAPTOP</option>
                      <option value="desktop">DESKTOP</option>
                      <option value="accessories">accessories</option>
                      </select>
                  </div>
                  
                  
                  <div class="form-outline mb-4">
                    <input type="text" id="name" name ="product_name" class="form-control" id="name"
                      placeholder="Product Name" />
                  </div>
                  
                  <div class="form-outline mb-4">
                    <input type="text" class="form-control" name ="product_price" id="name"
                      placeholder="Product Price" />
                    </div>

                  <div class="form-outline mb-4">
                    <input type="text" id="name" name="product_desc" class="form-control"
                      placeholder="Product Description" />
                    </div>
                    
                    <div class="form-outline mb-4">
                    <input type="file" id="name" name="product_image" class="form-control"
                      />
                    </div>


                  <div class="text-center pt-1 mb-5 pb-1">
                    <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3"  type="submit" name="action" value = "add product">ADD</button>
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