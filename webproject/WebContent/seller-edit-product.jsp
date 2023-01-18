<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit product-Radhe</title>
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
                    if(request.getAttribute("msg")!=null)
                 		{
                  			out.print(request.getAttribute("msg"));
                   		}
                %>
                </b>
                <%
                      int pid = Integer.parseInt(request.getParameter("pid"));
                      Product p = ProductDao.getProductByPid(pid);
                %>
                

                <p><b>PLEASE ENTER DETAILS</b></p>
                <form name="addproduct" method="post" action="ProductController" enctype="multipart/form-data" >
                
                <input type="hidden" name="seller" value="<%=u.getUid() %>">
                <input type="hidden" name="pid" value="<%=p.getPid() %>">
                <div class="form-outline mb-4">
                    <select id="name" name ="product_category" class="form-control" >
                      <%
                            		if(p.getProduct_category().equals("laptop"))
                            		{
                            	%>
                            			<option>---Select Category---</option>
                                        <option value="laptop" selected="selected">LAPTOP</option>
                                        <option value="desktop">DESKTOP</option>
                                        <option value="accessories">accessories</option>
                            	<%	
                            		}
                            		else if(p.getProduct_category().equals("desktop"))
                            		{
                            	%>
                            			<option>---Select Category---</option>
                                        <option value="laptop">LAPTOP</option>
                                        <option value="desktop" selected="selected">DESKTOP</option>
                                        <option value="accessories">accessories</option>
                            	<%		
                            		}
                            		else if(p.getProduct_category().equals("accessories"))
                            		{
                            	%>
                            			<option>---Select Category---</option>
                                        <option value="laptop">LAPTOP</option>
                                        <option value="desktop">DESKTOP</option>
                                        <option value="accessories" selected="selected">accessories</option>
                            	<%		
                            		}
                            		else
                            		{
                            	%>
                            			<option>---Select Category---</option>
                                        <option value="laptop">LAPTOP</option>
                                        <option value="desktop">DESKTOP</option>
                                        <option value="accessories">accessories</option>
                            	<%		
                            		}
                            	%>
                      </select>
                  </div>
                  
                  
                  <div class="form-outline mb-4">
                    <input type="text" id="name" name ="product_name" value="<%=p.getProduct_name() %>" class="form-control" id="name"
                       />
                  </div>
                  
                  <div class="form-outline mb-4">
                    <input type="text" class="form-control" name ="product_price" value="<%=p.getProduct_price() %>" id="name"
                       />
                    </div>

                  <div class="form-outline mb-4">
                    <input type="text" id="name" name="product_desc" value="<%=p.getProduct_desc() %>" class="form-control"
                       />
                    </div>
                    <div class="form-outline mb-4">
                    <img alt="" src="product_image/<%=p.getProduct_image()%>" height="250px" width="250px">
                    </div>
                    
                    <div class="form-outline mb-4">
                    <input type="hidden" id="name" name="product_image1" value=<%=p.getProduct_image() %> class="form-control"/>
                    </div>
                    
                    <div class="form-outline mb-4">
                    <input type="file" id="name" name="product_image" class="form-control"/>
                    </div>


                  <div class="text-center pt-1 mb-5 pb-1">
                    <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3"  type="submit" name="action" value = "update product">Update</button>
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