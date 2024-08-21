package Reviews;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UpdateReview {
public Reviews getValuesOfReviews(String Id) {
		
		
		PreparedStatement ps =null;
		ResultSet rs = null;
		Reviews review_update = new Reviews();
		
		
		try {
			Connection connection = ReviewDao.getConnection();
		String sql ="SELECT id, username, email, reviewText, starRating, timestamp FROM vehiclerenteldemo.reviews where id=?";
		ps = connection.prepareStatement(sql);
		ps.setString(1, Id);
		rs =ps.executeQuery();
		
		while(rs.next()) {
	
			 review_update.setId(rs.getInt("id"));
			 review_update.setUsername(rs.getString("username"));
			 review_update.setEmail(rs.getString("email"));
			 review_update.setReviewText(rs.getString("reviewText"));
			 review_update.setStarRating(rs.getInt("starRating"));
			 review_update.setTimestamp(rs.getString("timestamp"));
		
		}
		
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return review_update;
	
}
}
