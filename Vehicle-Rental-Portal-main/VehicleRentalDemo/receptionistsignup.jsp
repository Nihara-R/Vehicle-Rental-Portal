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
<link rel="stylesheet" href="css/deleteaccount.css">
<link rel="stylesheet" href="css/receptionistsignup.css">
<link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
/>
<style>
body{
width: 100%;
            height: 100%;
            background:url(images/Background_image1.jpg)no-repeat 50% 50%;
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


</style>
</head>
<body>

<nav>
	<h1>LOGO</h1>
	<ul>
		<li><a href="#">Home</a></li>
		<li><a href="#">Vehicle</a></li>
		<li><a href="desplayalluserreceptionist.jsp">user</a></li>
		<li><a href="<%=request.getContextPath()%>/DisplayallreveiwsreceptionistServlet">Review</a></li>
		<li><a href="#">Contact Us</a></li>
	</ul>
	<img src="images/images/profile.png" alt="" class="user-pic" onclick="toggleMenu()">
	<p class="welcomep">Welcome , <%=role %> <%= username %>!</p>
	<div class="sub-meun-wrap" id="subMenu">
		<div class="sub-menu">
			<div class="user-info">
				<a href="receptionistaccount.jsp"><img src="images/images/profile.png" alt=""></a>
				<h3><a href="adminaccount.jsp">Welcome,<%= username %>!<br><%=role %></a></h3>
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
			<a href="LogoutServlet" class="sub-menu-link" >
			<img src="images/images/logout.png" alt="">
			<p> LogOut</p>
			<span>></span>
			</a>
		</div>
	</div>
</nav>





<div class="wrapper">

            <header>

                <div class="fullpage">

                
              
                    <div class="signupbox">
                    
                    <form id="form" name="form" action="ReceptionistSignupServlet" onsubmit="return validateForm()" method="post">
                    
                    <div class="signupform">
                    <h1 class="heading2">Sign-Up</h1>
                    <div class="inputfields">
                        <div class="inputnames">
                        First name<br><input type="text" placeholder="Enter first name" name="firstname" class="inputline1"><br>
                        Last name<br><input type="text" placeholder="Enter last name" name="lastname" class="inputline1"><br>
                        E-mail<br><input type="email" placeholder="Enter e-mail" name="email" class="inputline2" id="C_email"><br>
                        Contact number<br><input type="text" placeholder="Enter mobile number" name="phone" class="inputline3"><br>
                        Password<input type="password" placeholder="Enter a strong password" name="psw" class="inputline5" id="C_password">
                        <i class="material-icons visibility" onclick="togglePasswordVisibility('C_password')">visibility</i><br>
                        Re-enter Password<input type="password" placeholder="Re-enter your password" name="psw-repeat" class="inputline7" id="C_password"><br>
                        </div>
                    </div>
                    
                    <div class="signupmain">
                        <div class="signupagree">
                            <input type="checkbox" id="agreeCheckbox" name="agreeCheckbox">
                            <label for="agreeCheckbox">I agree to the <a href="#">terms and conditions</a></label>
                        </div>
                    </div>
                    
                        <input type="submit" name="submit" value="Sign-Up" class="Signup-upBtn" id="submit">
                    
                    </div>
                        
                    </form>
                    </div>
                    
                    <div class="rightside">
                        <div class="signup_text">
                            <p>
                                <span class="comma">"</span> Ready to hit the road ? Join <span class="company">ABC Vehicle Rental Company</span> and experience 
                                seamless car rental like never before. Signing up is a breeze-get 
                                started now and unlock a world of possibilities behind the wheel ! <span class="comma">"</span>
                            </p>
                        </div>
                    </div>
                    
                    </div> 
                
            </header>
                          
        </div>
<script type="text/javascript">

function validateForm() {
    var firstname = document.forms["form"]["firstname"].value;
    var lastname = document.forms["form"]["lastname"].value;
    var email = document.forms["form"]["email"].value;
    var phone = document.forms["form"]["phone"].value;
    var password = document.forms["form"]["psw"].value;
    var passwordRepeat = document.forms["form"]["psw-repeat"].value;
    var agreeCheckbox = document.getElementById("agreeCheckbox");

    // Perform validation here
    if (firstname === "") {
      alert("First name must be filled out");
      return false;
    }
    if (lastname === "") {
      alert("Last name must be filled out");
      return false;
    }
    if (email === "" || !validateEmail(email)) {
      alert("Please enter a valid email address");
      return false;
    }
    if (phone === "") {
      alert("Contact number must be filled out");
      return false;
    }
    if (password === "") {
      alert("Password must be filled out");
      return false;
    }
    if (password !== passwordRepeat) {
      alert("Passwords do not match");
      return false;
    }
    if (!agreeCheckbox.checked) {
      alert("You must agree to the terms and conditions");
      return false;
    }

    // You can add more advanced validation here as needed.

    return true;
}

function validateEmail(email) {
    // Basic email validation regex
    var regex = /^\S+@\S+\.\S+$/;
    return regex.test(email);
}
function togglePasswordVisibility(passwordFieldId) {
    var passwordField = document.getElementById(passwordFieldId);
    if (passwordField.type === "password") {
        passwordField.type = "text";
    } else {
        passwordField.type = "password";
    }
}


</script>
        <script src="javascript/receptionistsignup.js"></script>
<script type="text/javascript" src="javascript/useraccount.js">
	

</script>

</body>
</html>