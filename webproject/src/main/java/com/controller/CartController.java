package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Cart;

import com.dao.CartDao;



@WebServlet("/CartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
	   int cid = Integer.parseInt(request.getParameter("cid"));
	   int product_qty = Integer.parseInt(request.getParameter("product_qty"));
	   Cart c = CartDao.getCartbyCid(cid);
	   int product_price = c.getProduct_price();
	   int total_price  = product_price*product_qty;
	   CartDao.Updatecart(cid, product_qty, total_price);
	   
	   response.sendRedirect("cart.jsp"); 
	   
		
	}

}
