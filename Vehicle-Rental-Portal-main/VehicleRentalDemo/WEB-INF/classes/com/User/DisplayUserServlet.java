package com.User;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DisplayUserServlet")
public class DisplayUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DisplayUserServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
		    

		    try {
		        Class.forName("com.mysql.jdbc.Driver");
		        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclerenteldemo", "root", "Wbnp2001@");
		        PreparedStatement ps = con.prepareStatement("select * from user");
		        ResultSet rs = ps.executeQuery();

		        request.setAttribute("userResultSet", rs); // Set the ResultSet in request attribute

		        // Forward the request to the JSP page for rendering
		        request.getRequestDispatcher("customer.jsp").forward(request, response);
		    } catch (Exception e) {
		        e.printStackTrace();
		        // Handle the exception as needed
		    }
	}

}
