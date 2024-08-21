package com.receptionist;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteReceptionistServlet
 */
@WebServlet("/DeleteReceptionistServlet")
public class DeleteReceptionistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReceptionistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int userId = Integer.parseInt(request.getParameter("id"));

        try {
            String JDBC_URL = "jdbc:mysql://localhost:3306/vehiclerenteldemo";
            String JDBC_USERNAME = "root";
            String JDBC_PASSWORD = "Wbnp2001@";

            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

            String deleteQuery = "DELETE FROM user WHERE id = ?";

            PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);
            preparedStatement.setInt(1, userId);

            int rowsDeleted = preparedStatement.executeUpdate();

            // Check if the delete was successful
            if (rowsDeleted > 0) {
                HttpSession session = request.getSession();
                session.invalidate();

                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("header.jsp?message=Account_Deletion_Failed");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("receptionistaccount.jsp?message=SQL_Error");
        } 
	}

}
