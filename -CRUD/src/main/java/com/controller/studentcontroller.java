package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.student;
import com.dao.studentdao;

@WebServlet("/StudentController")
public class studentcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public studentcontroller() {
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String action = request.getParameter("action");
       System.out.println(action);
       if(action.equalsIgnoreCase("insert")) {
    	   student s= new student();
    	   s.setFname(request.getParameter("fname"));
    	   s.setLname(request.getParameter("lname"));
    	   s.setEmail(request.getParameter("email"));
    	   s.setMobile(request.getParameter("mobile"));
    	   s.setAddress(request.getParameter("address"));
    	   s.setGender(request.getParameter("gender"));
    	   studentdao.insertstudent(s);
    	   request.setAttribute("msg", "data inserted successfully");
    	   request.getRequestDispatcher("insert.jsp").forward(request, response);
       }
	}

}
