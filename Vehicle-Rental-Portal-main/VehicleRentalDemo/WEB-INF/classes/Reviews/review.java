package Reviews;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class review
 */
@WebServlet("/review")
public class review extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public review() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			String username = request.getParameter("username");
	        String email = request.getParameter("email");
	        String reviewText = request.getParameter("reviewText");
	        String starRatingParam = request.getParameter("starRating");
	        int starRating = -1; 

	        if (starRatingParam != null && !starRatingParam.isEmpty()) {
	            try {
	            	starRating = Integer.parseInt(request.getParameter("starRating"));;
	            } catch (NumberFormatException e) {
	            	e.printStackTrace();
	            }
	        }
	        boolean consent = request.getParameter("consent") != null;
	
	        // Establish a database connection 
	        String JDBC_URL = "jdbc:mysql://localhost:3306/vehiclerenteldemo";
	        String JDBC_USERNAME = "root";
	        String JDBC_PASSWORD = "Wbnp2001@";

        
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

            String sql = "INSERT INTO vehiclerenteldemo.reviews (username, email, reviewText, starRating, consent) VALUES (?, ?, ?, ?, ?)";
            
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, reviewText);
            preparedStatement.setInt(4, starRating);
            preparedStatement.setBoolean(5, consent);

            preparedStatement.executeUpdate();

            conn.close();
            

            // Forward the request to the success.jsp page
            RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
            dispatcher.forward(request, response);
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("unsuccess.jsp");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("unsuccess.jsp");
        } catch (IOException e) {
            e.printStackTrace();
            response.sendRedirect("unsuccess.jsp");
        }
	}

}
