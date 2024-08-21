package addpackage;

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



/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
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
            String newpackagename = request.getParameter("packagename");
            String newpackagediscription = request.getParameter("packagedescription");
            String newvehicletype = request.getParameter("vehicletype");
            String newbaseprice = request.getParameter("baseprice");
            String newincludedmileage = request.getParameter("includemileage");
            String newadditionaldriverfee = request.getParameter("additionaldriverfee");
            String insurancecoverage = request.getParameter("insurancecoverage");
            String otherservice = request.getParameter("otherservice");
            String discountrate = request.getParameter("discountrate");
            
            Connection connection = DataBaseConnection.getConnection();
            
            String updateQuery = "UPDATE vehiclerenteldemo.primumpackge SET packagename=?,packagediscription=?,vehicletype=?,baseprice=?,includedmileage=?,additionaldriverfee=?,insurancecoverage=?,otherservice=?,discountrate=? WHERE id = ? ";

            PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);

            
            preparedStatement.setString(1, newpackagename);
            preparedStatement.setString(2, newpackagediscription);
            preparedStatement.setString(3, newvehicletype);
            preparedStatement.setString(4, newbaseprice);
            preparedStatement.setString(5, newincludedmileage);
            preparedStatement.setString(6, newadditionaldriverfee);
            preparedStatement.setString(7, insurancecoverage);
            preparedStatement.setString(8, otherservice);
            preparedStatement.setString(9, discountrate);
            preparedStatement.setInt(10, newId);
           

            
            int rowsUpdated = preparedStatement.executeUpdate();
            
            connection.close();
            
            if (rowsUpdated > 0) {
                HttpSession session = request.getSession();
                Package_Bean obj_package_Bean = new Package_Bean(newId,newpackagename,newpackagediscription,newvehicletype,newbaseprice,newincludedmileage,newadditionaldriverfee,insurancecoverage,otherservice,discountrate);
                session.setAttribute("user", obj_package_Bean);
                response.sendRedirect("displayallpackage.jsp?success=true");
            } else {
                response.sendRedirect("unsuccess.jsp");
            }
            
		} catch (SQLException e) {
			e.printStackTrace();
            response.sendRedirect("unsuccess.jsp?message=SQL_Error");
		}catch (IOException e) {
            e.printStackTrace();
            response.sendRedirect("unsuccess.jsp?message=IO_Error");
        }

	}
}
