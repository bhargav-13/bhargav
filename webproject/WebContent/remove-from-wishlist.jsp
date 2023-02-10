<%@page import="java.util.List"%>
<%@page import="com.bean.Wishlist"%>
<%@page import="com.dao.WishlistDao"%>
<%@ include file="header.jsp" %>

<%
	int pid=Integer.parseInt(request.getParameter("pid"));
	int uid=u.getUid();
	Wishlist w = new Wishlist();
	w.setPid(pid);
	w.setUid(uid);
	WishlistDao.deleteProduct(w);
	List<Wishlist> list = WishlistDao.getWishlistbyUsr(u.getUid());
	int wishlist_count = list.size();
	  session.setAttribute("wishlist_count", wishlist_count);
	response.sendRedirect("wishlist.jsp");
%>