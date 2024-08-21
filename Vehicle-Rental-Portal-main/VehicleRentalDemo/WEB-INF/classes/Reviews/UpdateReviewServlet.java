package Reviews;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateReviewServlet
 */
@WebServlet("/UpdateReviewServlet")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReviewServlet() {
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
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String reviewText = request.getParameter("reviewText");
        int starRating = Integer.parseInt(request.getParameter("starRating"));
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String timestamp = sdf.format(new Date());

        // Create a Reviews object with the updated values
        Reviews updatedReview = new Reviews(Integer.parseInt(id), username, email, reviewText);
        updatedReview.setStarRating(starRating);
        updatedReview.setTimestamp(timestamp.toString());
        
        // Update the review in the database
        try {
            if (ReviewDao.updateReviewText(updatedReview)) {
                // Redirect back to userReviews.jsp and display updated and existing reviews
                String userEmail = request.getParameter("email");
                List<Reviews> userReviews = ReviewDao.selectReviewsByUser(userEmail);
                request.setAttribute("userReviews", userReviews);
                request.getRequestDispatcher("userReviews.jsp").forward(request, response);
            } else {
                // Handle the case where the update fails
                // You can set an attribute for error message and forward to an error page
                request.setAttribute("updateError", "Failed to update the review.");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}

}
