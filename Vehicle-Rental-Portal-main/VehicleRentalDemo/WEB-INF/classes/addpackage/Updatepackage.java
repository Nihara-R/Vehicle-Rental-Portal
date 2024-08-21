package addpackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.User.DataBaseConnection;

public class Updatepackage {
	public Package_Bean getValuesOfPackage(String Id) {
		
		
		PreparedStatement ps =null;
		ResultSet rs = null;
		Package_Bean obj_package_Bean = new Package_Bean();
		
		
		try {
			Connection connection = DataBaseConnection.getConnection();
		String sql ="SELECT * FROM primumpackge where id=?";
		ps = connection.prepareStatement(sql);
		ps.setString(1, Id);
		rs =ps.executeQuery();
		
		while(rs.next()) {
			
			
			
			obj_package_Bean.setId(rs.getInt("id"));
			obj_package_Bean.setPackagename(rs.getString("packagename"));
			obj_package_Bean.setPackagediscription(rs.getString("packagediscription"));
			obj_package_Bean.setVehicletype(rs.getString("vehicletype"));
			obj_package_Bean.setBaseprice(rs.getString("baseprice"));
			obj_package_Bean.setIncludemileage(rs.getString("includedmileage"));
			obj_package_Bean.setAdditionaldriverfee(rs.getString("additionaldriverfee"));
			obj_package_Bean.setInsurancecoverage(rs.getString("insurancecoverage"));
			obj_package_Bean.setOtherservice(rs.getString("otherservice"));
			obj_package_Bean.setDiscountrate(rs.getString("discountrate"));

			
			
		}
		
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return obj_package_Bean;
	
}
	
	public void updatePackage(Package_Bean obj_package_Bean) {
        
        
    
}

}
