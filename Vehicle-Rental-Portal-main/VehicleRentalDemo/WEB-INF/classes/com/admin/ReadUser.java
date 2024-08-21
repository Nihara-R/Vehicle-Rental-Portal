package com.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.DataBaseConnection;
import com.User.User;



public class ReadUser {
	public static void main(String[] args) {
		ReadUser obj_read_Value = new ReadUser();
		obj_read_Value.get_values();
	}
	
	public List<User> get_values() {
		
		
		PreparedStatement ps =null;
		ResultSet rs = null;
		
		List<User> list = new ArrayList<User>();
		try {
			Connection connection = DataBaseConnection.getConnection();
		String sql ="SELECT * FROM user";
		ps = connection.prepareStatement(sql);
		rs =ps.executeQuery();
		
		while(rs.next()) {
			User obj_User = new User();
			
			
			obj_User.setId(rs.getInt("id"));
			obj_User.setFirstname(rs.getString("firstname"));
			obj_User.setLastname(rs.getString("lastname"));
			obj_User.setEmail(rs.getString("email"));
			obj_User.setPhone(rs.getString("phone"));
			obj_User.setPassword(rs.getString("password"));
			obj_User.setRepassword(rs.getString("repassword"));
			obj_User.setRole(rs.getString("role"));
			

			
			list.add(obj_User);
		}
		
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}
}
