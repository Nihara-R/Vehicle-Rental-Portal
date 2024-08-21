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

/**
 * Servlet implementation class DeleteReviews
 */
@WebServlet("/DeleteReviews")
public class DeleteReviews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReviews() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String idString = request.getParameter("id");
	        String confirmDelete = request.getParameter("confirmDelete");

	        if (idString != null) {
	            try {
	                int id = Integer.parseInt(idString);

	                // Retrieve the user's email from the session or another source
	                String userEmail = (String) request.getSession().getAttribute("email");

	                if (userEmail != null) {
	                    // Create an instance of ReviewDao
	                    ReviewDao reviewDao = new ReviewDao();

	                    if (confirmDelete != null && confirmDelete.equals("false")) {
	                        // User canceled the delete action, display reviews
	                        List<Reviews> userReviews = reviewDao.selectReviewsByUser(userEmail);
	                        request.setAttribute("userReviews", userReviews);

	                        // Forward to userReviews.jsp
	                        RequestDispatcher dispatcher = request.getRequestDispatcher("userReviews.jsp");
	                        dispatcher.forward(request, response);
	                    } else if (confirmDelete != null && confirmDelete.equals("true")) {
	                        // User confirmed the delete action
	                        boolean deleted = reviewDao.deleteReview(id);

	                        if (deleted) {
	                            // Successfully deleted, you can redirect to userReviews.jsp
	                            List<Reviews> userReviews = reviewDao.selectReviewsByUser(userEmail);
	                            request.setAttribute("userReviews", userReviews);

	                            // Forward to userReviews.jsp
	                            RequestDispatcher dispatcher = request.getRequestDispatcher("userReviews.jsp");
	                            dispatcher.forward(request, response);
	                        } else {
	                            // Handle the case where the review couldn't be deleted
	                            response.sendRedirect("unsuccess.jsp");
	                        }
	                    } else {
	                        // Handle other cases if necessary
	                        response.sendRedirect("unsuccess.jsp");
	                    }
	                } else {
	                    // Handle the case where the user's email is not available
	                    response.sendRedirect("unsuccess.jsp");
	                }
	            } catch (NumberFormatException e) {
	                // Handle the case where the ID parameter is not a valid integer
	                response.sendRedirect("unsuccess.jsp");
	            } catch (SQLException e) {
	                e.printStackTrace();
	                response.sendRedirect("unsuccess.jsp");
	            }
	        } else {
	            // Handle the case where the ID parameter is not provided
	            response.sendRedirect("unsuccess.jsp");
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
