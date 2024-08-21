package com.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Reviews.ReviewDao;
import Reviews.Reviews;

/**
 * Servlet implementation class DisplayallreveiwsServlet
 */
@WebServlet("/DisplayallreveiwsServlet")
public class DisplayallreveiwsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayallreveiwsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
listAllReviews(request, response);	
        

    }


	private void listAllReviews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<Reviews> listReviews = ReviewDao.selectAllReviews();
			request.setAttribute("listReviews", listReviews);
			RequestDispatcher dispatcher = request.getRequestDispatcher("displayallreviewsadmin.jsp");
			dispatcher.forward(request,  response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request,  response);
	}

}
