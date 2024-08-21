<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/reviewFormStyle.css">
<link rel="stylesheet" href="css/header.css">
<style>
        header{
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

<div class="wrapper">

            <header>

                
			<div class="reviewForm">
				<form id="review-form" action="review" method="post" onsubmit="return validateForm()">
	
			<div class="Reviewform">
				<h1 class="heading">Drop your review here </h1>
				<p class="p1">Your review, your voice. Share your thoughts !</p>
				
				<div class="inputfields">
					<input type="text" placeholder="Full name" name="username" id="username" required>
					<br>
					
					<input type="email" placeholder="E-mail" name="email" class="email" id="email" value="${sessionScope.user.email}" readonly required>
					<br>
					
			        <textarea id="reviewText" name="reviewText" rows="4" placeholder="Write your review here..." required></textarea>
			        <br>
			        
			        <p class="p2">Rate your experience below to help us enhance our service.</p>
			        <div class="star-rating">
			      <input type="hidden" name="starRating" id="starRating" value="0">
					    <span class="star">&#9733;</span>
					    <span class="star">&#9733;</span>
					    <span class="star">&#9733;</span>
					    <span class="star">&#9733;</span>
					    <span class="star">&#9733;</span>
					</div>
			        
			
			        <input type="checkbox" id="consent" name="consent" required>
			        <label for="consent" class="consent">I agree to the Privacy Policy and consent to data usage.</label>
			        <br>
				</div>
				
				<input type="submit" name="submit" value="Submit" class="SubmitBtn">
				<a href="Receptionist.jsp" class="CancelBtn">Cancel</a>
				
			
			</div>
	
	    </form>
			
						
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
		
		<script type="text/javascript">
		  function validateForm() {
	            var username = document.getElementById("username").value;
	            var email = document.getElementById("email").value;
	            var reviewText = document.getElementById("reviewText").value;
	            var starRating = document.getElementById("starRating").value;
	            var consent = document.getElementById("consent").checked;

	            // Check if the fields are not empty
	            if (username === "" || email === "" || reviewText === "" || starRating === "0" || !consent) {
	                alert("Please fill in all the required fields and agree to the Privacy Policy.");
	                return false;
	            }

	            // You can add more specific validation rules for each field if needed.

	            return true; // Submit the form
	        }
		
		
		</script>


</body>
</html>