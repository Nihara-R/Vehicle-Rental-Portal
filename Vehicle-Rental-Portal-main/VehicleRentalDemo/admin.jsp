
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <% String username=(String) session.getAttribute("username");
String role = (String) session.getAttribute("role");

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/deleteaccount.css">
<style>
.acountdtails{
	background: #fff;
	
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
				<h3><a href="adminaccount.jsp">Welcome,<%= username %>!<br><%=role %></a></h3>
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
			<a href="LogoutServlet" class="sub-menu-link" >
			<img src="images/images/logout.png" alt="">
			<p> LogOut</p>
			<span>></span>
			</a>
		</div>
	</div>
</nav>







  
<script type="text/javascript" src="javascript/useraccount.js">
	

</script>


</body>
</html>