package com.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.User.CustomerDBUtil;

/**
 * Servlet implementation class AddUserReceptionistServlet
 */
@WebServlet("/AddUserReceptionistServlet")
public class AddUserReceptionistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserReceptionistServlet() {
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
		String fname = request.getParameter("firstname");
		String lname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String mobile = request.getParameter("phone");
		String password = request.getParameter("psw");
		String repassword = request.getParameter("psw-repeat");
		String role ="customer";
		
boolean isTrue;
		
		isTrue = CustomerDBUtil.insertcustomer(fname,lname, email, mobile, password,repassword,role);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("desplayalluserreceptionist.jsp");
			dis.forward(request, response);
		}
		else {
			RequestDispatcher dis1 = request.getRequestDispatcher("adduser.jsp");
			dis1.forward(request, response);
		}
	}

}
