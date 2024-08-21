package addpackage;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.User.DataBaseConnection;

public class Delete_values {

	public void delete_values(String id) {
PreparedStatement ps =null;
		
		
		
		
		try {
			Connection connection = DataBaseConnection.getConnection();
		String sql ="DELETE FROM primumpackge where id=?";
		ps = connection.prepareStatement(sql);
		ps.setString(1, id);
		 ps.executeUpdate();
		
		
		
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
	}
}
