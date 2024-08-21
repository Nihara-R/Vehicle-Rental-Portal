package addpackage;

public class Package_Bean {
	private int id;
	private String packagename;
	private String packagediscription;
	private String vehicletype;
	private String baseprice;
	private String includemileage;
	private String additionaldriverfee;
	private String insurancecoverage;
	private String otherservice;
	private String discountrate;
	
	public  Package_Bean() {
		
	}
	
	public Package_Bean(int newId, String newpackagename, String newpackagediscription, String newvehicletype,
			String newbaseprice, String newincludedmileage, String newadditionaldriverfee, String insurancecoverage2,
			String otherservice2, String discountrate2) {
		this.id = newId;
		this.packagename = newpackagename;
		this.packagediscription = newpackagediscription;
		this.vehicletype = newvehicletype;
		this.baseprice = newbaseprice;
		this.includemileage = newincludedmileage;
		this.additionaldriverfee = newadditionaldriverfee;
		this.insurancecoverage = insurancecoverage2;
		this.otherservice = otherservice2;
		this.discountrate = discountrate2;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPackagename() {
		return packagename;
	}
	public void setPackagename(String packagename) {
		this.packagename = packagename;
	}
	public String getPackagediscription() {
		return packagediscription;
	}
	public void setPackagediscription(String packagediscription) {
		this.packagediscription = packagediscription;
	}
	public String getVehicletype() {
		return vehicletype;
	}
	public void setVehicletype(String vehicletype) {
		this.vehicletype = vehicletype;
	}
	public String getBaseprice() {
		return baseprice;
	}
	public void setBaseprice(String baseprice) {
		this.baseprice = baseprice;
	}
	public String getIncludemileage() {
		return includemileage;
	}
	public void setIncludemileage(String includemileage) {
		this.includemileage = includemileage;
	}
	public String getAdditionaldriverfee() {
		return additionaldriverfee;
	}
	public void setAdditionaldriverfee(String additionaldriverfee) {
		this.additionaldriverfee = additionaldriverfee;
	}
	public String getInsurancecoverage() {
		return insurancecoverage;
	}
	public void setInsurancecoverage(String insurancecoverage) {
		this.insurancecoverage = insurancecoverage;
	}
	public String getOtherservice() {
		return otherservice;
	}
	public void setOtherservice(String otherservice) {
		this.otherservice = otherservice;
	}
	public String getDiscountrate() {
		return discountrate;
	}
	public void setDiscountrate(String discountrate) {
		this.discountrate = discountrate;
	}
}
