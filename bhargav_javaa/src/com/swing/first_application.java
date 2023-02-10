package com.swing;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class first_application implements ActionListener {
	
	JFrame f;
	JLabel l1,l2,l3,l4,l5;
	JTextField t1,t2,t3,t4,t5;
	JButton b1,b2,b3,b4;
	
	public first_application() {
		
		
		f= new JFrame("My First Application");
		f.setVisible(true);
		f.setSize(500, 500);
		f.setLayout(null);
		
		
		l1 = new JLabel("ID:");
		l2 = new JLabel("First Name:");
		l3 = new JLabel("Last Name:");
		l4 = new JLabel("Email:");
		l5 = new JLabel("Mobile:");
		
		t1 = new JTextField(50);
		t2 = new JTextField(50);
		t3 = new JTextField(50);
		t4 = new JTextField(50);
		t5 = new JTextField(50);
		
		b1 = new JButton("SEARCH");
		b2 = new JButton("DELETE");
		b3 = new JButton("UPDATE");
		b4 = new JButton("INSERT");
		
		f.add(l1);
		f.add(t1);
		f.add(l2);
		f.add(t2);
		f.add(l3);
		f.add(t3);
		f.add(l4);
		f.add(t4);
		f.add(l5);
		f.add(t5);
		
		f.add(b1);
		f.add(b2);
		f.add(b3);
		f.add(b4);
		
		l1.setBounds(50, 50, 120, 25);
		l2.setBounds(50, 100, 120, 25);
		l3.setBounds(50, 150, 120, 25);
		l4.setBounds(50, 200, 120, 25);
		l5.setBounds(50, 250, 120, 25);
		
		t1.setBounds(150, 50, 200, 20);
		t2.setBounds(150, 100, 200, 20);
		t3.setBounds(150, 150, 200, 20);
		t4.setBounds(150, 200, 200, 20);
		t5.setBounds(150, 250, 200, 20);
		
		b1.setBounds(50, 300, 130, 30);
		b2.setBounds(220, 300, 130, 30);
		b3.setBounds(50, 350, 130, 30);
		b4.setBounds(220, 350, 130, 30);
		
		b1.addActionListener(this);
		b2.addActionListener(this);
		b3.addActionListener(this);
		b4.addActionListener(this);
		
	}
	
	public static void main(String[] args) {
		 new first_application();
	}


	public void actionPerformed(ActionEvent e) {
	
		if(e.getSource()==b1) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bhargav_java","root","");
				String sql = "select * from form where id = ?";
				java.sql.PreparedStatement src= conn.prepareStatement(sql);
				src.setInt(1, Integer.parseInt(t1.getText()));
				ResultSet rs = src.executeQuery();
				if(rs.next()) {
				t2.setText(rs.getString("f_name"));
				t3.setText(rs.getString("l_name"));
				t4.setText(rs.getString("email"));
				t5.setText(rs.getString("mobile"));
				}
				else {
					t2.setText("");
					t3.setText("");
					t4.setText("");
					t5.setText("");
					System.out.println("id not found");
				}
				} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		else if(e.getSource()==b2) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bhargav_java","root","");
				String sql = "delete from form where id = ?";
				java.sql.PreparedStatement pst = conn.prepareStatement(sql);
				pst.setInt(1, Integer.parseInt(t1.getText()));
				pst.executeUpdate();
				t2.setText("");
				t3.setText("");
				t4.setText("");
				t5.setText("");
				System.out.println("deleted successfully");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
		}
		else if(e.getSource()==b3) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bhargav_java","root","");
                String sql = "update form set f_name=?, l_name=?,email=?,mobile=? where id=?";
                java.sql.PreparedStatement pst = conn.prepareStatement(sql);
                
                pst.setString(1, t2.getText());
                pst.setString(2, t3.getText());
                pst.setString(3, t4.getText());
                pst.setString(4, t5.getText());
                pst.setInt(5, Integer.parseInt(t1.getText()));
                pst.executeUpdate();
                t2.setText("");
                t3.setText("");
                t4.setText("");
                t5.setText("");
                
                System.out.println("updated successfully");
                
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		
		else if(e.getSource()==b4) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bhargav_java","root","");
				String sql = "insert into form(f_name,l_name,email,mobile) values('"+t2.getText()+"','"+t3.getText()+"','"+t4.getText()+"','"+t5.getText()+"')";
				java.sql.Statement stmt = conn.createStatement();
				stmt.execute(sql);
				System.out.println("insert successfull");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
		}
		

}
}
