package Reviews;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserReviewsServlet
 */
@WebServlet("/UserReviewsServlet")
public class UserReviewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReviewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Get the user's email from the session (assuming it's stored during login)
	    HttpSession session = request.getSession();
	    String userEmail = (String) session.getAttribute("email");

	    // Retrieve reviews for the logged-in user from the database
	    List<Reviews> userReviews = ReviewDao.selectReviewsByUser(userEmail);

	    // Set the userReviews attribute in the request for the JSP
	    request.setAttribute("userReviews", userReviews);

	    String action = request.getParameter("action");

	    if ("edit".equals(action)) {
	        try {
				showEditForm(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    } else if ("update".equals(action)) {
	        try {
				updateReviews(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    } else if ("delete".equals(action)) {
	        deleteReviews(request, response);
	    } else {
	        // Forward the request to the userReviews.jsp page
	        RequestDispatcher dispatcher = request.getRequestDispatcher("userReviews.jsp");
	        dispatcher.forward(request, response);
	    }

        
	}
	
	
	
	
	
	//select user 
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)  throws SQLException, IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		Reviews existingReview = ReviewDao.selectReview(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("updateReviews.jsp");
		request.setAttribute("reviews", existingReview);
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	private void deleteReviews(HttpServletRequest request, HttpServletResponse response)  {
		
		
	}


	//update
	private void updateReviews(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
	    int id = Integer.parseInt(request.getParameter("id"));
	    String fullname = request.getParameter("username");
	    String email = request.getParameter("email");
	    String reviewText = request.getParameter("reviewText");

	    Reviews reviews = new Reviews(id, fullname, email, reviewText);

	    boolean rowUpdated = ReviewDao.updateReviewText(reviews);

	    if (rowUpdated) {

	        response.sendRedirect("UserReviewsServlet?updateSuccess=1");
	    } else {

	        response.sendRedirect("UserReviewsServlet?updateError=1");
	    }
	}









}
