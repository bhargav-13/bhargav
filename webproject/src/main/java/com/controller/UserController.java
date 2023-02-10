package com.controller;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Cart;
import com.bean.User;
import com.bean.Wishlist;
import com.dao.CartDao;
import com.dao.UserDao;
import com.dao.WishlistDao;
import com.service.Services;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("signup")) {

			boolean flag = UserDao.checkMail(request.getParameter("email"));
			if (flag == true) {
				request.setAttribute("msg", "email already registerd");
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			} else {
				if (request.getParameter("password").equals(request.getParameter("cpassword"))) {
					User u = new User();
					u.setUsertype(request.getParameter("usertype"));
					u.setFname(request.getParameter("fname"));
					u.setLname(request.getParameter("lname"));
					u.setEmail(request.getParameter("email"));
					u.setMobile(request.getParameter("mobile"));
					u.setPassword(request.getParameter("password"));
					UserDao.signup(u);
					request.setAttribute("msg", "Sign up Successfully");
					request.getRequestDispatcher("signup.jsp").forward(request, response);
				} else {
					request.setAttribute("msg", "password doesn't match to confirm password ");
					request.getRequestDispatcher("signup.jsp").forward(request, response);
				}
			}
		} else if (action.equalsIgnoreCase("login")) {
			User u = UserDao.login(request.getParameter("email"));
			if (u == null) {
				request.setAttribute("msg", "email not registered");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} else {
				if (u.getPassword().equals(request.getParameter("password"))) {
					HttpSession session = request.getSession();
					session.setAttribute("u", u);
					if (u.getUsertype().equals("buyer")) {
						List<Wishlist> list = WishlistDao.getWishlistbyUsr(u.getUid());
						int wishlist_count = list.size();
						  session.setAttribute("wishlist_count", wishlist_count);
						  
						  List<Cart> list1 = CartDao.getCartbyuser(u.getUid());
							int cart_count = list1.size();
							  session.setAttribute("cart_count", cart_count);
						request.getRequestDispatcher("index.jsp").forward(request, response);
					} else {
						request.getRequestDispatcher("seller-index.jsp").forward(request, response);
					}

				} else {
					request.setAttribute("msg", "incorrect password");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			}
		} else if (action.equalsIgnoreCase("changepassword")) {
			HttpSession session = request.getSession();
			User u = (User) session.getAttribute("u");
			if (u.getPassword().equals(request.getParameter("old_password"))) {
				if (!u.getPassword().equals(request.getParameter("new_password"))) {
					if (request.getParameter("new_password").equals(request.getParameter("cnew_password"))) {
						UserDao.changePassword(u.getEmail(), request.getParameter("new_password"));
						request.setAttribute("msg", "password change successfully");
						request.getRequestDispatcher("login.jsp").forward(request, response);
					} else {
						request.setAttribute("msg", "new password and confirm new password does not match");
						request.getRequestDispatcher("sellchangepass.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("msg", "your old password & new password are same");
					request.getRequestDispatcher("sellchangepass.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("msg", "old does not match");
				request.getRequestDispatcher("sellchangepass.jsp").forward(request, response);
			}
		} else if (action.equalsIgnoreCase("forgot password")) {
			boolean flag = UserDao.checkMail(request.getParameter("email"));
			if (flag == true) {
				Random t = new Random();
				int minRange = 1000, maxRange = 9999;
				int otp = t.nextInt(maxRange - minRange) + minRange;
				Services.sendMail(request.getParameter("email"), otp);
				request.setAttribute("email", request.getParameter("email"));
				request.setAttribute("otp", otp);
				request.getRequestDispatcher("otp.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "email is not regitered");
				request.getRequestDispatcher("forgot-password.jsp");
			}
		} else if (action.equalsIgnoreCase("verify otp")) {
			String email = request.getParameter("email");
			int otp = Integer.parseInt(request.getParameter("otp"));
			int uotp = Integer.parseInt(request.getParameter("uotp"));
			if (otp == uotp) {
				request.setAttribute("email", email);
				request.getRequestDispatcher("new-password.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "invalid OTP");
				request.setAttribute("otp", otp);
				request.setAttribute("email", email);
				request.getRequestDispatcher("otp.jsp").forward(request, response);
			}
		} else if (action.equalsIgnoreCase("updatepassword")) {
			String email = request.getParameter("email");
			String new_password = request.getParameter("new_password");
			String cnew_password = request.getParameter("cnew_password");

			if (new_password.equals(cnew_password)) {
				UserDao.changePassword(email, cnew_password);
				request.setAttribute("msg", "password updated successfully");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "new password and confirm new password does not match");
				request.setAttribute("email", email);
				request.getRequestDispatcher("new-password.jsp").forward(request, response);
			}
		}
	}

}
