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
body{
background: url("images/pngtree-row-of-vintage-cars-stacked-up-one-next-to-the-other-picture-image_3053241.jpg");
background-repeat: no-repeat;
background-size: cover;
}
.adminsignupform{
margin-top: 100px;
margin-left: 500px;
}
.adminsignupform {
    margin: 200px;
    margin-left: 500px;
    width: 500px; /* Adjust the width to your liking */
    padding: 20px;
    border: 1px solid #ccc;
    background: #f9f9f9;
  }

  /* Style form elements */
  .adminsignupform input[type="text"],
  .adminsignupform input[type="email"],
  .adminsignupform input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  .adminsignupform button {
    background-color: #007bff; /* Change to your preferred button color */
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

  .adminsignupform button:hover {
    background-color: #0056b3; /* Change to a darker shade on hover */
  }
</style>

<script type="text/javascript">
        function validateForm() {
            var firstName = document.forms["userForm"]["firstname"].value;
            var lastName = document.forms["userForm"]["lastname"].value;
            var email = document.forms["userForm"]["email"].value;
            var phone = document.forms["userForm"]["phone"].value;
            var password = document.forms["userForm"]["psw"].value;
            var confirmPassword = document.forms["userForm"]["psw-repeat"].value;

            if (firstName === "" || lastName === "" || email === "" || phone === "" || password === "" || confirmPassword === "") {
                alert("All fields must be filled out");
                return false;
            }

            if (password !== confirmPassword) {
                alert("Passwords do not match");
                return false;
            }
        }
    </script>
</head>
<body>

<nav>
	<h1>LOGO</h1>
	<ul>
		<li><a href="#">Home</a></li>
		<li><a href="#">Vehicle</a></li>
		<li><a href="#">user</a></li>
		<li><a href="<%=request.getContextPath()%>/DisplayallreveiwsreceptionistServlet">Review</a></li>
		<li><a href="#">Contact Us</a></li>
		
	</ul>
	<img src="images/images/profile.png" alt="" class="user-pic" onclick="toggleMenu()">
	<p class="welcomep">Welcome , <%=role %> <%= username %>!</p>
	<div class="sub-meun-wrap" id="subMenu">
		<div class="sub-menu">
			<div class="user-info">
				<a href="receptionistaccount.jsp"><img src="images/images/profile.png" alt=""></a>
				<h3><a href="useraccount.jsp">Welcome, <%= username %>!<br><%=role %></a></h3>
			</div>
			<hr>
			<a href="updatereceptionistaccount.jsp" class="sub-menu-link">
			<img src="images/images/profile.png" alt="">
			<p> Edit Profile</p>
			<span>></span>
			</a>
			<a href="deletreceptionistaccount.jsp" class="sub-menu-link">
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



<form name="userForm" action="AddUserReceptionistServlet" method="post" class="adminsignupform" onsubmit="return validateForm()">
			 <label for="FirstName"><b>First Name :</b></label><br>
            <input type="text" placeholder="Enter First Name" name="firstname" required> <br> 
            <label for="LastName"><b>Last Name :</b></label> <br>
             <input type="text" placeholder="Enter Last Name" name="lastname" required > <br>
              <label for="email"><b>E-mail :</b></label>  <br>
              <input type="email" placeholder="Enter Email" name="email" required>   <br>
               <label for="mNumber">Mobile Number :<b></b></label><br>
               <input type="text" placeholder="Mobile Number" name="phone" required >  <br>
                <label for="psw"><b>Password :</b></label> <br>
                <input type="password" placeholder="Enter  Password" name="psw" required> <br>
                 <label for="re-psw"><b>Re-Enter Password :</b></label> <br> 
                 <input type="password" placeholder="Repeat Password" name="psw-repeat" required > <br>
                  <button type="submit" class="signupbtn2" name="submit">Sign Up</button>  <br>           
 </form>
</body>
</html>