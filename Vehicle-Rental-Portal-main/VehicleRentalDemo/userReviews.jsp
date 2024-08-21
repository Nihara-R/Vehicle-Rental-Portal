<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <% String username=(String) session.getAttribute("username");
String role = (String) session.getAttribute("role");
String userEmail = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="css/userReviewStyle.css">

	<link rel="stylesheet" href="css/user.css">

	<%
        String coloredPersonSymbol = "\uD83D\uDC64"; 
    %>
    <style>
        body{
            width: 100%;
            height: 100Vh;
            background:url(images/Background_image8.jpeg)no-repeat 40% 40%;
            background-size:cover;
            background-attachment: fixed;
            

        }
        .header-wrapper {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1;
            background: rgba(0, 0, 0, 0.7);
        }
        .acountdtails{
	background: #fff;
	
}

.para{
color:#fff;
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
          
                
             
            <!-- Display user reviews -->  
            
            <div class = "box">
			<h1 class = "heading" >Your Reviews</h1>
			    
			    <c:choose>
			        <c:when test="${not empty userReviews}">
			            <c:forEach var="review" items="${userReviews}">
			                <tr>
			                <div class="tiles">
			                <div class="coloredpersonsymbol"><c:out value="<%= coloredPersonSymbol %>"/><c:out value="${review.username}" /></div><br>
			                
			                <div class="stars">
			                        <c:forEach begin="1" end="${review.starRating}">
			                            <span class="dark-star">★</span>
			                        </c:forEach>
			                        <c:forEach begin="${review.starRating + 1}" end="5">
			                            <span class="dark-star">☆</span>
			                        </c:forEach>
			               	                
			                <span class="green-date"><c:out value="${review.timestamp}" /></span><br>
			                
			                <div class = "text"><c:out value="${review.reviewText}" /></div>
			                </div>

			                    
			                    <a href="updateReviews.jsp?id=<c:out value='${review.id}' />" class="update">Update</a>
			                    <a href="confirmDeleteReview.jsp?id=<c:out value='${review.id}' />" class="delete">Delete</a><br><br>
			                </div>
			                </tr>
			            </c:forEach>
			        </c:when>
			        <c:otherwise>
			            <p class="para">"Oops, it looks like your review collection is empty! 🙈 Help us and fellow users by sharing your experiences. Be the trendsetter and start writing reviews today!"</p>
			            <a href="reviewForm.jsp" class="write">Write a review</a>
			        </c:otherwise>
			    </c:choose>
			    </div>

    
            </header>
                          
        </div>
        
        <script>
		    const stars = document.querySelectorAll(".star");
		    let userRating = 0;
		
		    stars.forEach((star, index) => {
		        star.addEventListener("click", () => {
		            userRating = index + 1;
		            highlightStars(index);
		            
		            const starRatingInput = document.getElementById("starRating");
		            starRatingInput.value = userRating;
		        });
		    });
		
		    function highlightStars(index) {
		        stars.forEach((star, i) => {
		            if (i <= index) {
		                star.style.color = "#FFD700"; 
		            } else {
		                star.style.color = "#000"; 
		            }
		        });
		    }
		</script> 
		<script type="text/javascript" src="javascript/useraccount.js">
	

</script>
</body>
</html>