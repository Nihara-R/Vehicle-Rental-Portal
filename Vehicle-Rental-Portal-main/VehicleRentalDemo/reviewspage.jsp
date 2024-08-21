<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
       <%@page import="java.sql.*"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <%@ page import="java.util.List" %>
	<%@ page import="Reviews.Reviews" %>
	<%@ page import="Reviews.ReviewDao" %>
	
	<% String username=(String) session.getAttribute("username");
String role = (String) session.getAttribute("role");
String userEmail = (String) session.getAttribute("email");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="css/reviewListStyle.css">
    <%
        String coloredPersonSymbol = "\uD83D\uDC64"; 
    %>
    <link rel="stylesheet" href="css/user.css">
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
		<li><a href="<%=request.getContextPath()%>/ReviewServlet">Review</a></li>
		
		<li><a href="#">Contact Us</a></li>
	</ul>
	<img src="images/images/profile.png" alt="" class="user-pic" onclick="toggleMenu()">
	<p class="welcomep">Welcome , <%=role %> <%= username %>!</p>
	<div class="sub-meun-wrap" id="subMenu">
		<div class="sub-menu">
			<div class="user-info">
				<a href="useraccount.jsp"><img src="images/images/profile.png" alt=""></a>
				<h3><a href="useraccount.jsp">Welcome, <%= username %>!<br><%=role %></a></h3>
			</div>
			<hr>
			<a href="updateuserprofile.jsp" class="sub-menu-link">
			<img src="images/images/profile.png" alt="">
			<p> Edit Profile</p>
			<span>></span>
			</a>
			<a  href="<%=request.getContextPath()%>/UserReviewsServlet" class="sub-menu-link">
			
			<p>My Review</p>
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


<div class="header-wrapper">

            <header>
                
                <div class="box">
                <h1 class="heading">Ratings & Reviews - What Our Customers Say About Us</h1>
                <p class="review_p"><span class="sentence">Give your valuable reviews about us.<br>&#x270D; </span><br>
                <a href="reviewForm.jsp" class="write">Write a review</a></p>
					<c:forEach var="reviews" items="${listReviews}">
					<div class="tiles">
					<div class="coloredpersonsymbol"><c:out value="<%= coloredPersonSymbol %>"/><c:out value="${reviews.username}"/></div><br>
                    <div class="stars"><c:choose >
                        <c:when test="${reviews.starRating >= 1}">
                            <span class="dark-star">★</span>
                        </c:when>
                        <c:otherwise>
                            ☆
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${reviews.starRating >= 2}">
                            <span class="dark-star">★</span>
                        </c:when>
                        <c:otherwise>
                            ☆
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${reviews.starRating >= 3}">
                            <span class="dark-star">★</span>
                        </c:when>
                        <c:otherwise>
                            ☆
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${reviews.starRating >= 4}">
                            <span class="dark-star">★</span>
                        </c:when>
                        <c:otherwise>
                            ☆
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${reviews.starRating >= 5}">
                           <span class="dark-star">★</span>
                        </c:when>
                        <c:otherwise>
                            ☆
                        </c:otherwise>
                    </c:choose>
					<span class="green-date"><c:out value="${reviews.timestamp}"/></span><br>
					<c:out value="${reviews.reviewText}"/></div>
					</div>

</c:forEach>
</div>
                

                
            </header>
                          
        </div>

<script type="text/javascript" src="javascript/useraccount.js">
	

</script>
</body>
</html>