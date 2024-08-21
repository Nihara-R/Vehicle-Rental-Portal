<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="Reviews.Reviews" %>
<%@ page import="Reviews.UpdateReview" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/updateReviewFormStyle.css">
	<link rel="stylesheet" href="css/header.css">
	<style>
        body{
            width: 100%;
            height: 100vh;
            background:url(images/Background_image6.jpeg)no-repeat 50% 50%;
            background-size:cover;
            background-attachment: fixed;
            
           
        }
        .header-wrapper {
            position: fixed;
            width: 100%;
            z-index: 5;
            background-color: #fff;
        }
	</style>
</head>
<body>

<%
String id = request.getParameter("id");
UpdateReview obj_update_value = new UpdateReview();
Reviews review_update = obj_update_value.getValuesOfReviews(id);
%>










<div class="header-wrapper">

            <header>
            
                
             
            <!-- Display user reviews -->  
            
            <div class = "updateBox">

				<form action="UpdateReviewServlet" method="post">
					<h1 class="heading">Update Your Review Here</h1>
					
				    <input type="hidden" name="id" value="<%= review_update.getId() %>"><br>
				    <label for="" class="label">Full Name</label><br>
				    <input type="text" name="username" value="<%= review_update.getUsername() %>"  class = "updateName"><br><br>
				    <label for="" class="label">Email</label><br>
				    <input type="text" name="email" value="<%= review_update.getEmail() %>" readonly  class = "updateEmail"><br><br>
				    <label for="" class="label">Review</label><br>
				    <textarea name="reviewText"  class = "updateReview"><%= review_update.getReviewText() %></textarea><br><br>
				    <label for="" class="label">How many stars will you give us ??</label><br>
				    <input type="number" name="starRating" value="<%= review_update.getStarRating() %>" min="1" max="5"  class = "updateStar"><br><br>
				    
				    <input type="submit"  class = "updateButton" value="Update Review">
				</form>
				
			</div>
    
            </header>
                          
        </div>











</body>
</html>