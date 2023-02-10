package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Article;
import com.util.ProjectUtil;

public class ArticleDao {
	
	public static void addArticle(Article a) {
		try {
			Connection conn = ProjectUtil.createConnection();
			String sql = "insert into article(adder,category,title,article,ar_image ) value (?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, a.getAdder());
			pst.setString(2, a.getCategory());
			pst.setString(3, a.getTitle());
			pst.setString(4, a.getArticle());
			pst.setString(5, a.getAr_image());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static List<Article> getAllArticle() {
		List<Article> list = new ArrayList<>();
		try {
			Connection conn = ProjectUtil.createConnection();
			String sql = "select * from article";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Article a = new Article();
				a.setAid(rs.getInt("aid"));	
				a.setAdder(rs.getInt("adder"));
				a.setCategory(rs.getString("category"));
				a.setTitle(rs.getString("title"));
				a.setArticle(rs.getString("article"));
			    a.setAr_image(rs.getString("ar_image"));
			    list.add(a);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public static Article getArticleByAid(int aid) {
		Article a = new Article();
		try {
			Connection conn = ProjectUtil.createConnection();
			String sql = "select * from article where aid=?";
		    PreparedStatement pst = conn.prepareStatement(sql);
		    pst.setInt(1, aid);
		    ResultSet rs = pst.executeQuery();
		    while(rs.next()) {
		      a.setAid(rs.getInt("aid"));
		      a.setAdder(rs.getInt("adder"));
		      a.setCategory(rs.getString("category"));
		      a.setTitle(rs.getString("title"));
		      a.setArticle(rs.getString("article"));
		      a.setAr_image(rs.getString("ar_image"));
		    
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

}
