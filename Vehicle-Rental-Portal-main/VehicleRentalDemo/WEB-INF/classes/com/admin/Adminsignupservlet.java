package com.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.User.CustomerDBUtil;


@WebServlet("/Adminsignupservlet")
public class Adminsignupservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Adminsignupservlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname = request.getParameter("firstname");
		String lname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String mobile = request.getParameter("phone");
		String password = request.getParameter("psw");
		String repassword = request.getParameter("psw-repeat");
		String role ="admin";
		
boolean isTrue;
		
		isTrue = CustomerDBUtil.insertcustomer(fname,lname, email, mobile, password,repassword,role);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("displayalladmin.jsp");
			dis.forward(request, response);
		}
		else {
			RequestDispatcher dis1 = request.getRequestDispatcher("admin.jsp");
			dis1.forward(request, response);
		}
	}

}
