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

import com.bean.Article;
import com.dao.ArticleDao;

@WebServlet("/ArticleController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, maxFileSize = 1024 * 1024 * 512, maxRequestSize = 1024 * 1024 * 512) // 512MB
public class ArticleController extends HttpServlet {
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
		
     if(action.equalsIgnoreCase("add article")) {
		String savePath = "C:\\Users\\BHARGAV\\eclipse-workspace\\ArtistHub_Bhargav\\WebContent\\ar_images";
   	 File fileSaveDir = new File(savePath);
   	 if(!fileSaveDir.exists()) {
   		 fileSaveDir.mkdir();
   	 }
   	 Part file1 = request.getPart("ar_image");
   	 String fileName = extractfilename(file1);
   	 file1.write(savePath + File.separator + fileName);
   	 
   	 String savePath2 = "C:\\Users\\BHARGAV\\eclipse-workspace\\webproject\\WebContent\\ar_images";
   	 File imgSaveDir=new File(savePath2);
   	 if(!imgSaveDir.exists()) {
   		 imgSaveDir.mkdir();
   	 }	
   	 
     Article a = new Article();
     a.setAdder(Integer.parseInt(request.getParameter("adder")));
     a.setCategory(request.getParameter("article topic"));
     a.setTitle(request.getParameter("title"));
     a.setArticle(request.getParameter("article"));
     a.setAr_image(fileName);
     ArticleDao.addArticle(a);
     request.setAttribute("msg", "Article Added");
	 request.getRequestDispatcher("AddArticle.jsp").forward(request, response);
     }
     
     

}
	
}
