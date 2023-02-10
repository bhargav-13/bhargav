<%@page import="com.bean.Cart"%>
<%@page import="com.dao.CartDao"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.Wishlist"%>
<%@page import="com.dao.WishlistDao"%>
<%@ include file="header.jsp" %>

<%
	int pid=Integer.parseInt(request.getParameter("pid"));
	int uid=u.getUid();
	CartDao.removefromcart(uid, pid);
	
	List<Cart> list = CartDao.getCartbyuser(u.getUid());
	int cart_count = list.size();
	session.setAttribute("cart_count", cart_count);
    response.sendRedirect("cart.jsp");
%>