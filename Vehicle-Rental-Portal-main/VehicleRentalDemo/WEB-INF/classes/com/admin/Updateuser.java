package com.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.User.DataBaseConnection;
import com.User.User;

;

public class Updateuser {
	public User getValuesOfPackage(String Id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        User obj_User = new User();

        try {
            Connection connection = DataBaseConnection.getConnection();
            String sql = "SELECT * FROM user where id=?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, Id);
            rs = ps.executeQuery();

            while (rs.next()) {
                obj_User.setId(rs.getInt("id"));
                obj_User.setFirstname(rs.getString("firstname"));
                obj_User.setLastname(rs.getString("lastname"));
                obj_User.setEmail(rs.getString("email"));
                obj_User.setPhone(rs.getString("phone"));
                obj_User.setPassword(rs.getString("password"));
                obj_User.setRepassword(rs.getString("repassword"));
                obj_User.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return obj_User;
    }
	
	
}
