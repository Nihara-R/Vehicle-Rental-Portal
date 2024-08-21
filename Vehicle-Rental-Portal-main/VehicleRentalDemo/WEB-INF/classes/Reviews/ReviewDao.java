package Reviews;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReviewDao {
	private static String JDBC_URL = "jdbc:mysql://localhost:3306/vehiclerenteldemo";
    private static String JDBC_User = "root";
    private static String JDBC_Password = "Wbnp2001@";
  
    
    private static final String Query = "SELECT * FROM vehiclerenteldemo.reviews";
    private static final String select_user_query = "SELECT id, username, email, reviewText FROM vehiclerenteldemo.reviews where id = ?";
    
    public ReviewDao(){
    	
    }
    
    protected static Connection getConnection() {
    	Connection conn = null;
    	
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    		conn = DriverManager.getConnection(JDBC_URL, JDBC_User, JDBC_Password);
    	} catch(SQLException e){
    		e.printStackTrace();
    	} catch(ClassNotFoundException e){
    		e.printStackTrace();
    	}
    	return conn;
    }
    
    
    
    public static List<Reviews> selectAllReviews(){
    	
    	List <Reviews> reviews = new ArrayList<>();
    	
    	try (Connection conn = getConnection();
   	        PreparedStatement statement = conn.prepareStatement(Query);){
   			System.out.println(statement);
   			ResultSet result = statement.executeQuery();
   			
   			while(result.next()){
   				String username = result.getString("username");
   				String email = result.getString("email");
   				String reviewText = result.getString("reviewText");
   				int starRating = result.getInt("starRating");
   				String timestamp = result.getString("timestamp");
   				reviews.add(new Reviews(username, email, reviewText, starRating, timestamp));
   			}
       } catch(SQLException e){
   		e.printStackTrace();
       }
    	return reviews;
    }

    
    public static List<Reviews> selectReviewsByUser(String userEmail) {
        List<Reviews> userReviews = new ArrayList<>();

        String query = "SELECT id, username, reviewText, starRating, timestamp FROM vehiclerenteldemo.reviews WHERE email = ?";

        try (Connection conn = getConnection();
             PreparedStatement statement = conn.prepareStatement(query);) {
            statement.setString(1, userEmail);
            ResultSet result = statement.executeQuery();

            while (result.next()) {
            	int id = result.getInt("id");
                String username = result.getString("username");
                String reviewText = result.getString("reviewText");
                int starRating = result.getInt("starRating");
                String timestamp = result.getString("timestamp");
                userReviews.add(new Reviews(id, username, userEmail, reviewText, starRating, timestamp));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userReviews;
    }
    
    
    
    public static Reviews selectReview(int id) {
        Reviews existingReview = null;

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(select_user_query);) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String username = rs.getString("username");
                String email = rs.getString("email");
                String reviewText = rs.getString("reviewText");
                existingReview = new Reviews(id, username, email, reviewText);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return existingReview;
    }

    
    
    public static boolean updateReviewText(Reviews newReview) throws SQLException {
        boolean rowUpdated;
        String update_query = "UPDATE vehiclerenteldemo.reviews SET username = ?, reviewText = ?, starRating = ?, timestamp = ? WHERE id = ?";

        // First, retrieve the existing review
        Reviews existingReview = selectReview(newReview.getId());

        if (existingReview != null) {
            // Update the properties of the existing review with the new values
            existingReview.setUsername(newReview.getUsername());
            existingReview.setReviewText(newReview.getReviewText());
            existingReview.setStarRating(newReview.getStarRating());
            existingReview.setTimestamp(newReview.getTimestamp());

            try (Connection connection = getConnection();
                 PreparedStatement statement = connection.prepareStatement(update_query);) {
                statement.setString(1, existingReview.getUsername());
                statement.setString(2, existingReview.getReviewText());
                statement.setInt(3, existingReview.getStarRating());
                statement.setString(4, existingReview.getTimestamp());
                statement.setInt(5, existingReview.getId());

                rowUpdated = statement.executeUpdate() > 0;
            } catch (SQLException e) {
                e.printStackTrace();
                rowUpdated = false;
            }
        } else {
            // Handle the case where the review with the specified ID doesn't exist
            rowUpdated = false;
        }

        return rowUpdated;
    }
    
    
    
    
    
    
    public boolean deleteReview(int id) throws SQLException {
    	boolean rowDeleted;
    	String delete_query = "DELETE FROM reviews WHERE id = ?";
    	try (Connection connection = getConnection();
    			PreparedStatement statement = connection.prepareStatement(delete_query);) {
    		statement.setInt(1, id);;
    		rowDeleted = statement.executeUpdate() > 0;
    	}
    	return rowDeleted;
    }

    
    
}
