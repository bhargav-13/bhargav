<%@page import="java.util.List"%>
<%@page import="com.dao.CartDao"%>
<%@page import="com.bean.Cart"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="com.bean.Wishlist"%>
<%@page import="com.dao.WishlistDao"%>
<%@ include file="header.jsp" %>

<%
	int pid=Integer.parseInt(request.getParameter("pid"));
	int uid=u.getUid();
	int product_qty=1;
	Product p = ProductDao.getProductByPid(pid);
	int product_price = p.getProduct_price();
	int total_price = p.getProduct_price();
	String payment_status = "pending";
	Cart c = new Cart();
	c.setUid(uid);
	c.setPid(pid);
	c.setProduct_price(product_price);
	c.setProduct_qty(product_qty);
	c.setTotal_price(total_price);
	c.setPayment_status(payment_status);
	CartDao.AddtoCart(c);
	List<Cart> list = CartDao.getCartbyuser(u.getUid());
	int cart_count = list.size();
	session.setAttribute("cart_count", cart_count);
	
	response.sendRedirect("cart.jsp");
%>