package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.bean.User;
import com.dao.UserDao;


@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if (action.equalsIgnoreCase("signup")) {

			boolean flag = UserDao.checkMail(request.getParameter("email"));
			if (flag == true) {
				request.setAttribute("msg", "email already registerd");
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			} else {
				if (request.getParameter("password").equals(request.getParameter("cpassword"))) {
					User u = new User();
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
		}
		else if (action.equalsIgnoreCase("login")) 
		{
			User u = UserDao.login(request.getParameter("email"));
			if (u == null) {
				request.setAttribute("msg", "email not registered");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} else {
				if (u.getPassword().equals(request.getParameter("password"))) {
					HttpSession session = request.getSession();
					session.setAttribute("u", u);
					request.getRequestDispatcher("index.jsp").forward(request, response);

				} else {
					request.setAttribute("msg", "incorrect password");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			}
		}
		else if (action.equalsIgnoreCase("changepass")) 
			{
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
						request.getRequestDispatcher("changepass.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("msg", "your old password & new password are same");
					request.getRequestDispatcher("changepass.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("msg", "old does not match");
				request.getRequestDispatcher("changepass.jsp").forward(request, response);
			}
		}
	         
	
	}

}
