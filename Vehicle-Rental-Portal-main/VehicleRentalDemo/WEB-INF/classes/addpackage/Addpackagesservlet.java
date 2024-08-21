package addpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.User.DataBaseConnection;


@WebServlet("/Addpackagesservlet")
public class Addpackagesservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Addpackagesservlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String packagename = request.getParameter("packagename");
		String packagediscription = request.getParameter("packagediscription");
		String vehicletype = request.getParameter("vehicletype");
		String baseprice = request.getParameter("baseprice");
		String includedmileage = request.getParameter("includemileage");
		String additionaldriverfee = request.getParameter("additionaldriverfee");
		String insurancecoverage = request.getParameter("insurancecoverage");
		String otherservice = request.getParameter("otherservice");
		String discountrate = request.getParameter("discountrate");
		
		
		PreparedStatement ps =null;
		try {
			Connection connection = DataBaseConnection.getConnection();
			String sql ="insert into primumpackge(packagename,packagediscription,vehicletype,baseprice,includedmileage,additionaldriverfee,insurancecoverage,otherservice,discountrate) values(?,?,?,?,?,?,?,?,?)";
			
			ps = connection.prepareStatement(sql);
			
			ps.setString(1, packagename);
			ps.setString(2, packagediscription);
			ps.setString(3, vehicletype);
			ps.setString(4, baseprice);
			ps.setString(5, includedmileage);
			ps.setString(6, additionaldriverfee);
			ps.setString(7, insurancecoverage);
			ps.setString(8, otherservice);
			ps.setString(9, discountrate);
			ps.executeUpdate();
			
			RequestDispatcher rd = request.getRequestDispatcher("displayallpackage.jsp");
			rd.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
