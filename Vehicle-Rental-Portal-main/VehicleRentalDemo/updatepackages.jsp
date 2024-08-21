<%@page import="addpackage.Package_Bean"%>
<%@page import="addpackage.Updatepackage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% String username=(String) session.getAttribute("username");
String role = (String) session.getAttribute("role");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/user.css">
<style>


body{
background: url("images/wp2911075.jpg");
background-repeat: no-repeat;
background-size: cover;
}
.acountdtails{
	background: #fff;
	
}
form{
background: #fff;
width: 400px;
padding: 50px;
align-items: center;
justify-content: center;
margin-left: 500px;
margin-top: 100px;
}
input[type=text]{
width: 300px;
height: 30px;
}
textarea {
	width: 300px;
height: 100px;
resize: none;
}
.addpackageh1{
	font-size: 25px;
}

input[type=submit]{
width: 305px;
height: 40px;
background: #60EE36;
outline: none;
border: none;
}
</style>
</head>
<body>


<nav>
	<h1>LOGO</h1>
	<ul>
		<li><a href="#">Home</a></li>
		<li><a href="#">Vehicle</a></li>
		<li><a href="desplayalluser.jsp">Users</a></li>
		<li><a href="desplayallreceptionist.jsp">Receptionists</a></li>
		<li><a href="displayalladmin.jsp">admins</a></li>
		<li><a href="displayallpackage.jsp">Packages</a></li>
		<li><a href="<%=request.getContextPath()%>/DisplayallreveiwsServlet">Reviews</a></li>
	</ul>
	<img src="images/images/profile.png" alt="" class="user-pic" onclick="toggleMenu()">
	<p class="welcomep">Welcome , <%=role %> <%= username %>!</p>
	<div class="sub-meun-wrap" id="subMenu">
		<div class="sub-menu">
			<div class="user-info">
				<a href="adminaccount.jsp"><img src="images/images/profile.png" alt=""></a>
				<h3><a href="adminaccount.jsp">Welcome, <%= username %>!<br><%=role %></a></h3>
			</div>
			<hr>
			<a href="updateadminprofile.jsp" class="sub-menu-link">
			<img src="images/images/profile.png" alt="">
			<p> Edit Profile</p>
			<span>></span>
			</a>
			<a href="deleteadminaccount.jsp" class="sub-menu-link">
			<p> Delete Account</p>
			<span>></span>
			</a>
			<a href="#" class="sub-menu-link">
			<img src="images/images/setting.png" alt="">
			<p> Settings & privacy</p>
			<span>></span>
			</a>
			<a href="#" class="sub-menu-link">
			<img src="images/images/help.png" alt="">
			<p> Help & support</p>
			<span>></span>
			</a>
			<a href="LogoutServlet" class="sub-menu-link">
			<img src="images/images/logout.png" alt="">
			<p> LogOut</p>
			<span>></span>
			</a>
		</div>
	</div>
</nav>

<%
String id = request.getParameter("ID");

Updatepackage obj_update_value = new Updatepackage();
Package_Bean obj_package_bean = obj_update_value.getValuesOfPackage(id);
%>

<form action="UpdateServlet" method="post" onsubmit="return validateForm()">
    <h1 class="addpackageh1">Add Premium Package</h1>
    <input type="text" name="id" value="<%= obj_package_bean.getId() %>" readonly="readonly" id="packagename">
    <p>Package Name :</p>
    <input type="text" name="packagename" value="<%= obj_package_bean.getPackagename() %>" id="packagename"> <br>
    <p>Package Description :</p>
    <textarea rows="" cols="" name="packagedescription" id="packagedescription"><%= obj_package_bean.getPackagediscription() %></textarea><br>
    
    <p>Vehicle Type</p>
    <input type="text" name="vehicletype" value="<%= obj_package_bean.getVehicletype() %>" id="vehicletype"> <br>
    <p>Base Price</p>
    <input type="text" name="baseprice" value="<%= obj_package_bean.getBaseprice() %>" id="baseprice"> <br>
    <p>Include Mileage</p>
    <input type="text" name="includemileage" value="<%= obj_package_bean.getIncludemileage() %>" id="includemileage"> <br>
    <p>Additional Driver Fee</p>
    <input type="text" name="additionaldriverfee" value="<%= obj_package_bean.getAdditionaldriverfee() %>" id="additionaldriverfee"> <br>
    <p>Insurance Coverage</p>
    <input type="text" name="insurancecoverage" value="<%= obj_package_bean.getInsurancecoverage() %>" id="insurancecoverage"> <br>
    <p>Other Service</p>
    <textarea rows="" cols="" name="otherservice" id="otherservice"><%= obj_package_bean.getOtherservice() %></textarea><br>
    <p>Discount Rate</p>
    <input type="text" name="discountrate" value="<%= obj_package_bean.getDiscountrate() %>" id="discountrate"> <br><br>

    
    <input type="submit" name="submit" value="add"> <br>
</form>

<script type="text/javascript">
function validateForm() {
    var packagename = document.getElementById("packagename").value;
    var packagedescription = document.getElementById("packagedescription").value;
    var vehicletype = document.getElementById("vehicletype").value;
    var baseprice = document.getElementById("baseprice").value;
    var includemileage = document.getElementById("includemileage").value;
    var additionaldriverfee = document.getElementById("additionaldriverfee").value;
    var insurancecoverage = document.getElementById("insurancecoverage").value;
    var otherservice = document.getElementById("otherservice").value;
    var discountrate = document.getElementById("discountrate").value;

    // Perform validation here
    if (packagename === "") {
      alert("Package Name must be filled out");
      return false;
    }
    // You can add more validation for other fields as needed.

    // Example: Check if the base price is a valid number
    if (isNaN(baseprice)) {
      alert("Base Price must be a valid number");
      return false;
    }

    // Example: Check if the discount rate is a valid number between 0 and 100
    var discountRate = parseFloat(discountrate);
    if (isNaN(discountRate) || discountRate < 0 || discountRate > 100) {
      alert("Discount Rate must be a valid number between 0 and 100");
      return false;
    }

    // Additional validation can be added for other fields as required.

    return true;
}
</script>




  
<script type="text/javascript" src="javascript/useraccount.js">
	

</script>


</body>
</html>