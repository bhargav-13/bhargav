package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.bean.book;
import com.util.ProjectUtil;

public class BookDao {
     public static void AddBook(book b) {
    	 try {
			Connection conn = ProjectUtil.createConnection();
			String sql = "insert into book (seller, bname, bprice, book_pdf,article_topic) value (?, ?, ?, ?, ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, b.getSeller());
			pst.setString(2,b.getBname());
			pst.setInt(3, b.getPrice());
			pst.setString(4, b.getBook_pdf());
			pst.setString(5, b.getArticle_topic());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
     }
     
     public static List<book> getBooksBySeller(int seller) {
 		List<book> list = new ArrayList<>();
 		try {
 			Connection conn = ProjectUtil.createConnection();
 			String sql = "select * from book where seller=?";
 			PreparedStatement pst = conn.prepareStatement(sql);
 			pst.setInt(1, seller);
 			ResultSet rs = pst.executeQuery();
 			while (rs.next()) {
 				book p = new book();
 				p.setBid(rs.getInt("bid"));
 				p.setSeller(rs.getInt("seller"));
 				p.setArticle_topic(rs.getString("article_topic"));
 				p.setBname(rs.getString("bname"));
 				p.setPrice(rs.getInt("bprice"));
 				p.setBook_pdf(rs.getString("book_pdf"));
 				list.add(p);
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
 		return list;
 	}
     
     public static List<book> getAllBooks() {
  		List<book> list = new ArrayList<>();
  		try {
  			Connection conn = ProjectUtil.createConnection();
  			String sql = "select * from book";
  			PreparedStatement pst = conn.prepareStatement(sql);
  			ResultSet rs = pst.executeQuery();
  			while (rs.next()) {
  				book p = new book();
  				p.setBid(rs.getInt("bid"));
  				p.setSeller(rs.getInt("seller"));
  				p.setArticle_topic(rs.getString("article_topic"));
  				p.setBname(rs.getString("bname"));
  				p.setPrice(rs.getInt("bprice"));
  				p.setBook_pdf(rs.getString("book_pdf"));
  				list.add(p);
  			}
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		return list;
  	}
    
    public static book getBookByBid(int bid) {
    	book p = new book();
 		try {
 			Connection conn = ProjectUtil.createConnection();
 			String sql = "select * from book where bid=?";
 			PreparedStatement pst = conn.prepareStatement(sql);
 			pst.setInt(1, bid);
 			ResultSet rs = pst.executeQuery();
 			while (rs.next()) {
 				p.setBid(rs.getInt("bid"));
 				p.setSeller(rs.getInt("seller"));
 				p.setArticle_topic(rs.getString("article_topic"));
 				p.setBname(rs.getString("bname"));
 				p.setPrice(rs.getInt("bprice"));
 				p.setBook_pdf(rs.getString("book_pdf"));
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
 		return p;
    }
     
}
