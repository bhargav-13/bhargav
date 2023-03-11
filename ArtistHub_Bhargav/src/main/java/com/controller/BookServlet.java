package com.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bean.book;
import com.dao.BookDao;

@WebServlet("/BookServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, maxFileSize = 1024 * 1024 * 512, maxRequestSize = 1024 * 1024 * 512) // 512MB
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String extractfilename(Part file) {
		String cd = file.getHeader("content-disposition");
		System.out.println(cd);
		String[] items = cd.split(";");
	    for(String string : items) {
	    	if(string.trim().startsWith("filename")) {
	    		return string.substring(string.indexOf("=") + 2, string.length()-1);
	    	}
	    }
		return "";
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("add book")) {
	 		String savePath = "C:\\Users\\BHARGAV\\eclipse-workspace\\ArtistHub_Bhargav\\WebContent\\book_pdf";
	    	 File fileSaveDir = new File(savePath);
	    	 if(!fileSaveDir.exists()) {
	    		 fileSaveDir.mkdir();
	    	 }
	    	 Part file1 = request.getPart("book_pdf");
	    	 String fileName = extractfilename(file1);
	    	 file1.write(savePath + File.separator + fileName);
	    	 
	    	 String savePath2 = "C:\\Users\\BHARGAV\\eclipse-workspace\\ArtistHub_Bhargav\\WebContent\\book_pdf";
	    	 File imgSaveDir=new File(savePath2);
	    	 if(!imgSaveDir.exists()) {
	    		 imgSaveDir.mkdir();
	    	 }	
	    	    book b = new book();
	 	     	b.setSeller(Integer.parseInt(request.getParameter("seller")));
	 	     	b.setArticle_topic(request.getParameter("article topic"));
	 		    b.setBname(request.getParameter("name"));
	 		    b.setPrice(Integer.parseInt(request.getParameter("bprice")));
	 		    b.setBook_pdf(fileName);
	 		    BookDao.AddBook(b);
	 		    request.setAttribute("msg", "Book Added");
	 			request.getRequestDispatcher("sell.jsp").forward(request, response);
		}
		
		
	}

}
