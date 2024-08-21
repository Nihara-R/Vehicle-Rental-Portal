package addpackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.DataBaseConnection;

public class Read_values {
	public static void main(String[] args) {
		Read_values obj_read_Value = new Read_values();
		obj_read_Value.get_values();
	}
	
	public List<Package_Bean> get_values() {
		
		
		PreparedStatement ps =null;
		ResultSet rs = null;
		
		List<Package_Bean> list = new ArrayList<Package_Bean>();
		try {
			Connection connection = DataBaseConnection.getConnection();
		String sql ="SELECT * FROM primumpackge";
		ps = connection.prepareStatement(sql);
		rs =ps.executeQuery();
		
		while(rs.next()) {
			Package_Bean obj_package_bean = new Package_Bean();
			
			
			obj_package_bean.setId(rs.getInt("id"));
			obj_package_bean.setPackagename(rs.getString("packagename"));
			obj_package_bean.setPackagediscription(rs.getString("packagediscription"));
			obj_package_bean.setVehicletype(rs.getString("vehicletype"));
			obj_package_bean.setBaseprice(rs.getString("baseprice"));
			obj_package_bean.setIncludemileage(rs.getString("includedmileage"));
			obj_package_bean.setAdditionaldriverfee(rs.getString("additionaldriverfee"));
			obj_package_bean.setInsurancecoverage(rs.getString("insurancecoverage"));
			obj_package_bean.setOtherservice(rs.getString("otherservice"));
			obj_package_bean.setDiscountrate(rs.getString("discountrate"));

			
			list.add(obj_package_bean);
		}
		
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}
}
