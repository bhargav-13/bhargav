package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bean.student;
import com.util.studentutil;

public class studentdao {
	
	 public static void insertstudent(student s) {
		 try {
			 Connection conn = studentutil.createConnection();
			 String sql="insert into student(fname,lname,email,mobile,address,gender) VALUES (?,?,?,?,?,?)";
			 PreparedStatement pst=conn.prepareStatement(sql);
			 pst.setString(1, s.getFname());
			 pst.setString(2, s.getLname());
			 pst.setString(3, s.getEmail());
			 pst.setString(4, s.getMobile());
			 pst.setString(5, s.getAddress());
			 pst.setString(6, s.getGender());
			 pst.executeUpdate();
		} catch (Exception e) {
             e.printStackTrace();        
		}
		 
	 }

}
