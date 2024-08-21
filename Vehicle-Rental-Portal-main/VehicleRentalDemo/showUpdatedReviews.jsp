<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 <h1>Your Reviews</h1>
    
    <c:choose>
        <c:when test="${not empty userReviews}">
            <c:forEach var="review" items="${userReviews}">
				 <c:if test="${not empty updatedReview}">
			        <!-- Display the updated review here -->
			        <h2>Updated Review</h2>
			        <p>ID: ${updatedReview.id}</p>
			        <p>Username: ${updatedReview.username}</p>
			        <p>Email: ${updatedReview.email}</p>
			        <p>Review Text: ${updatedReview.reviewText}</p>
			    </c:if>
                <tr>
                    <c:out value="${review.id}" /><br>
                    <c:out value="${review.username}" /><br>
                    <c:out value="${review.reviewText}" /><br>
                    <div class="stars">
                        <c:forEach begin="1" end="${review.starRating}">
                            <span class="dark-star">★</span>
                        </c:forEach>
                        <c:forEach begin="${review.starRating + 1}" end="5">
                            <span class="dark-star">☆</span>
                        </c:forEach>
                    </div>
                    <c:out value="${review.timestamp}" /><br><br>
                    <a href="updateReviews.jsp?id=<c:out value='${review.id}' />" class="update">Update</a>
                    <a href="deleteReviews.jsp" class="delete">Delete</a><br><br>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>"Oops, it looks like your review collection is empty! 🙈 Help us and fellow users by sharing your experiences. Be the trendsetter and start writing reviews today!"</p>
            <a href="review.jsp" class="write">Write a review</a>
        </c:otherwise>
    </c:choose>


</body>
</html>