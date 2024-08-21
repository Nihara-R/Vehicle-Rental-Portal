package com.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.User.DataBaseConnection;

public class DeleteUserValue {
	public void deleteUserValue(String id) {
		PreparedStatement ps =null;
				
				
				
				
				try {
					Connection connection = DataBaseConnection.getConnection();
				String sql ="DELETE FROM User where id=?";
				ps = connection.prepareStatement(sql);
				ps.setString(1, id);
				 ps.executeUpdate();
				
				
				
				}catch(Exception e) {
					e.printStackTrace();
					
				}
				
			}
}
