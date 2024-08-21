<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <% String username=(String) session.getAttribute("username");
String role = (String) session.getAttribute("role");
    %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/deleteaccount.css">
</head>
<body>

<div class="delete_account">
<p>Are you sure you want to delete your account ?</p>
<form action="DeleteadminaccountServlet" method="post">

<input type="hidden" name="id"  value="${sessionScope.user.id}">
<button type="submit" name="confirmDelete" value="true" class="delete">delete my account</button>
<a href="receptionistaccount.jsp"class="cancel" > Cancel</a>
</form>

</div>

</body>
</html>