<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
    <%@page import="java.util.*" %>
   <%@ page import="java.util.List" %>
<%@ page import="com.User.User" %>
<%@ page import="com.admin.Read_admin" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<% String username=(String) session.getAttribute("username");
String role = (String) session.getAttribute("role");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/user.css">
<style type="text/css">
body{
background: url("images/pexels-mike-bird-100650.jpg");
background-size: cover;
}
.acountdtails{
	background: #fff;
	
}
table {
    border-collapse: collapse;
    margin: 150px;
    margin-left: 350px;
   
}
table th{
	
	padding: 10px;
	background: read;
}
table td{
	padding: 10px;
}
/* Style the "Update" link */
a.update-link {
    display: inline-block;
    background-color: green;
    color: white;
    width: 80px;
    height: 30px;
    text-align: center;
    line-height: 30px;
    text-decoration: none;
}
table tr:nth-child(odd) {
    background-color: #f2f2f2; /* Light gray color for odd rows */
}

table tr:nth-child(even) {
    background-color: #ffffff; 
    }/* White color for even rows */
.addadminlink {
    text-decoration: none;
    color: #fff;
    font-weight: bold;
    padding: 5px 10px;
    border: none;
    border-radius: 5px;
    background-color: green;
    transition: background-color 0.3s, color 0.3s;
    margin: 10px; /* Adjust the margin value to your preference */
}

.addadminlink:hover {
    background-color: #007bff;
    color: #fff;
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
Read_admin obj_Read_values = new Read_admin();
List<User> list = obj_Read_values.get_values();
Iterator<User> it_list = list.iterator();
%>

<table >
<tr><th><a href="adminsignup.jsp" class="addadminlink">add</a></th>

<th><h1>Admins</h1></th>
</tr>
    <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Phone Number</th>
        
       
        <th>Update</th>
    </tr>

    <%
    while (it_list.hasNext()) {
        User obj_User = it_list.next();
    %>
    <tr >
        <td><%= obj_User.getId() %></td>
        <td><%= obj_User.getFirstname()%></td>
        <td><%= obj_User.getLastname() %></td>
        <td><%= obj_User.getEmail() %></td>
        <td><%= obj_User.getPhone() %></td>
        
        
        <td><a href="updateAdmin.jsp?ID=<%=obj_User.getId() %>>" class="update-link">Update</a></td>
        <td><a href="DeleteAdminServlet?ID=<%= obj_User.getId() %>" class="update-link">Delete</a></td>
    </tr>
    <%
    }
    %>
</table>



<script type="text/javascript" src="javascript/useraccount.js">
	

</script>


</body>
</html>