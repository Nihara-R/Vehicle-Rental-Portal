package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.User.DataBaseConnection;
import com.User.User;



/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
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
		try {
            int newId = Integer.parseInt(request.getParameter("id"));
            String newfirstname = request.getParameter("firstname");
            String newlastname = request.getParameter("lastname");
            String newemail = request.getParameter("email");
            String newphone = request.getParameter("phone");
            String newpassword = request.getParameter("psw");
            String newrepassword = request.getParameter("psw-repeat");
            String newrole = request.getParameter("role");

            Connection connection = DataBaseConnection.getConnection();
            String updateQuery = "UPDATE user SET firstname=?, lastname=?, email=?, phone=?, password=?, repassword=?, role=? WHERE id = ? ";

            PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);

            preparedStatement.setString(1, newfirstname);
            preparedStatement.setString(2, newlastname);
            preparedStatement.setString(3, newemail);
            preparedStatement.setString(4, newphone);
            preparedStatement.setString(5, newpassword);
            preparedStatement.setString(6, newrepassword);
            preparedStatement.setString(7, newrole);
            preparedStatement.setInt(8, newId);

            int rowsUpdated = preparedStatement.executeUpdate();
            connection.close();

            if (rowsUpdated > 0) {
                HttpSession session = request.getSession();
                User obj_User = new User(newId, newfirstname, newlastname, newemail, newphone, newpassword, newrepassword, newrole);
                session.setAttribute("user", obj_User);
                response.sendRedirect("desplayalluser.jsp?success=true");
            } else {
                response.sendRedirect("unsuccess.jsp");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("unsuccess.jsp?message=SQL_Error");
        } catch (IOException e) {
            e.printStackTrace();
            response.sendRedirect("unsuccess.jsp?message=IO_Error");
        }

	}

}
