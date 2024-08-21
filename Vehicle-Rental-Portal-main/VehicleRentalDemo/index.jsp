<%@page import="addpackage.Read_values"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
    <%@page import="java.sql.*" %>
    <%@page import="java.util.*" %>
   <%@ page import="java.util.List" %>
<%@ page import="addpackage.Package_Bean" %>
<%@ page import="addpackage.Read_values" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
 header{
            width: 100%;
            height: 100vh;
            background:url(images/car-rides-road-among-forest-top-view.jpg)no-repeat 50% 50%;
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
        .content2{
            width: 100%;
            height: 100Vh;
            background:url(images/car2.png)no-repeat 50% 50%;
            background-size:cover;
            background-attachment: fixed;
        }
        .content4{
            width: 100%;
            height: 400px;
            background:url(images/jep.jpg)no-repeat 50% 50%;
            background-size:cover;
            background-attachment: fixed;
        }

		.dispaly{
display:flex;
flex-wrap: wrap;
margin-left:200px;
margin-top: 200px;
margin-bottom: 50px;

}
.display-container{
margin:20px;

border:7px solid #C0C0C0;

padding:10px;
width :300px;
align-items:center;
justify-content: center;
text-align: center;
height: auto;
font-size: 18;
line-height: 30px;
}
hr{
border: 1px solid #C0C0C0;

}
.display-container:hover{
border:7px solid #BDB76B;
}
.price{
font-size:18px;
background: #BDB76B;
height: 100px;
padding: 30px;
color:#fff;

}
.price span{
font-size: 60px;
}
.price sub{
font-size: 30px;
margin: 10px;
}
.buynow{
margin-top:20px;
width: 100px;
height: 40px;
background: none;
outline:3px solid #000;
border: none;
}
.buynow:hover{
outline: 3px solid #BDB76B;
color: #BDB76B;
}
		
</style>

</head>
<body>

<div class="wrapper">
            <!-- begin of header -->
            <header>
                <!-- nav bar -->
                <nav>
                    <div class="logo">
                        LOGO
                    </div>
                    <div class="menu">
                        <ul>
                            <li><a href="">Home</a></li>
                            <li><a href="">Services</a></li>
                            <li><a href="">About Us</a></li>
                            <li><a href="">Contact Us</a></li>
                            <li class="login_and_signupbtn">
                            
                            <button class="signupbtn" onclick="document.getElementById('id02').style.display='block'">Sign Up</button>
                            <button class="signupbtn" onclick="document.getElementById('id01').style.display='block'" >Login</button>

                        
                    </li>
                        </ul>
                        
                    </div>

                    <!-- Login form -->
                    <div id="id01" class="modal">
  
                        <form class="modal-content animate" action="UserLoginServlet" method="post">
                          <div class="imgcontainer">
                            <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                            <img src="images/profile.png" alt="Avatar" class="avatar">
                          </div>
                      
                          <div class="container">
                            <label for="uname"><b>Username</b></label>
                            <input type="text" placeholder="Enter Username" name="email" required class="inputfield">
                      
                            <label for="psw"><b>Password</b></label>
                            <input type="password" placeholder="Enter Password" name="psw" required class="inputfield">
                              
                            <button type="submit" class="loginbtn" name="submit">Login</button>
                            <label>
                              <input type="checkbox" checked="checked" name="remember"> Remember me
                            </label>
                          </div>
                      
                          <div class="container" style="background-color:#f1f1f1">
                            <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
                            <span class="psw">Forgot <a href="#">password?</a></span>
                          </div>
                        </form>
                      </div>

                      <!-- end of login form -->

                      <!-- Sign up form -->
                      <div id="id02" class="modal2">
                        <span onclick="document.getElementById('id02').style.display='none'" class="close2" title="Close Modal">&times;</span>
                        <form class="modal2-content" action="SignupServlet" method="post" onsubmit="return validateForm()">
                          <div class="container2">
                            <h1 class="signuph1">Sign Up</h1>
                            <p class="signupp">Please fill in this form to create an account.</p>
                            
                            <label for="FirstName"><b>First Name :</b></label>
                            <input type="text" placeholder="Enter First Name" name="firstname" id="firstname" required class="inputfield2">
                      
                            <label for="LastName"><b>Last Name :</b></label>
                            <input type="text" placeholder="Enter Last Name" name="lastname" id="lastname" required class="inputfield2">
                      
                            <label for="email"><b>E-mail :</b></label>
                            <input type="email" placeholder="Enter Email" name="email" id="email" required class="inputfield2">
                            <label for="mNumber">Mobile Number :<b></b></label>
                            <input type="text" placeholder="Mobile Number" name="phone" id="phone" required class="inputfield2">
                            <label for="psw"><b>Password :</b></label>
                            <input type="password" placeholder="Enter  Password" name="psw" id="password" required class="inputfield2">
                            <label for="re-psw"><b>Re-Enter Password :</b></label>
                            <input type="password" placeholder="Repeat Password" name="psw-repeat" id="password-repeat" required class="inputfield2">
                            <label>
                              <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
                            </label>
                      
                            <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>
                      
                            <div class="clearfix2">
                              <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn2">Cancel</button>
                              <button type="submit" class="signupbtn2" name="submit">Sign Up</button>
                            </div>
                          </div>
                        </form>
                      </div>
                      <!-- end of signup form -->
                      
                    
                </nav>
                
                <script type="text/javascript">
                function validateForm() {
                    var firstname = document.getElementById("firstname").value;
                    var lastname = document.getElementById("lastname").value;
                    var email = document.getElementById("email").value;
                    var phone = document.getElementById("phone").value;
                    var password = document.getElementById("password").value;
                    var passwordRepeat = document.getElementById("password-repeat").value;

                    // Perform validation here
                    if (firstname === "") {
                      alert("First Name must be filled out");
                      return false;
                    }
                    if (lastname === "") {
                      alert("Last Name must be filled out");
                      return false;
                    }
                    if (email === "") {
                      alert("Email must be filled out");
                      return false;
                    }
                    if (phone === "") {
                      alert("Mobile Number must be filled out");
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

                    // Additional validation can be added here, e.g., email format, password strength, etc.
                    return true;
                  }
                
                </script>
                <!-- End of nav bar -->

                <!-- pick up form -->

                <div class="pickupform" >
                    <h1 class="mainhead">Looking for a <span>vehicle?</span><br> You're at the right place.</h1>
                    <form action="" class="form">
                        <div class="formleft" class="textbox1">
                        pick up date <br>
                        <input type="text" class="textbox1"><br>
                        pick up date & time <br>
                        <input type="text"class="textbox2">
                        <input type="time" class="textbox2">
                        
                        
                    </div>
                    <div class="formright">
                        Drop off Location<br>
                        <input type="text" class="textbox1">
                        <br>
                        return date & time <br>
                        <input type="text"class="textbox2">
                        <input type="time"class="textbox2">
                        <br>
                        <input type="submit" class="submitbtn">
                    </div>
                        
                      


                    </form>
                </div>
                <!-- End of pick up form -->
            </header>
            <!-- end of header -->

            <!-- content 1 -->
            <h2 class="contentheding">Why Choose Us</h2>
            <h1 class="contentheding2">Our Features</h1>
            <p class="contentp">Discover a world of convenience, safety, and customization, paving the way for unforgettable adventures and seamless mobility solutions.</p>
            <div class="content">
                <div class="contentleft">
                    <h2>First class services</h2>
                    <p>Where luxury meets exceptional care, creating unforgettable moments and exceeding your every expectation.</p>
                    <h2>24/7 road assistance</h2>
                    <p>Reliable support when you need it most, keeping you on the move with confidence and peace of mind.</p>
                </div>
                <div class="contentmidle">
                    <img src="images/car.png" alt="" class="contentimg">
                </div>
                <div class="contentright">
                    <h2>Quality at Minimum Expense</h2>
                    <p>Unlocking affordable brilliance with elevating quality while minimizing costs for maximum value.</p>
                    <h2>Free Pick-Up & Drop-Off</h2>
                    <p>Enjoy free pickup and drop-off services, adding an extra layer of ease to your car rental experience.</p>
                </div>
            </div>
            <!-- end content 1 -->

            <!-- content 2 -->
            <div class="content2">
                <div class="content2main">
                    <div class="content2left">
                        <p class="content2p1">We offer customers a wide range of<span> commercial cars </span>and <span>luxury cars </span>for any occasion.</p>
                    </div>
                    <div class="content2right">
                        <p  class="content2p2">At our car rental agency, we believe that everyone deserves to experience the pleasure of driving a reliable and comfortable vehicle, regardless of their budget. We have curated a diverse fleet of well-maintained cars, ranging from sleek sedans to spacious SUVs, all at competitive prices. With our streamlined rental process, you can quickly and conveniently reserve your desired vehicle. Whether you need transportation for a business trip, family vacation, or simply want to enjoy a weekend getaway, we have flexible rental options to accommodate your schedule.</p>
                    </div>
                </div>
            </div>
            <!-- end of content 2 -->

            <!-- content 3 -->
            <div class="content3">
                <h2 class="contentheding">Enjoy Your Ride</h2>
                <h1 class="contentheding2">Our Vehicle Fleet</h1>
                <p class="contentp"> Driving your dreams to reality with an exquisite fleet of versatile vehicles for unforgettable journeys.</p>
            </div>
            <div class="content4">
                <div class="content4main">
                    <div class="content4_1">
                        <h1>Let's Your Adventure Begin</h1>
                       
                    </div>
                    
                    <div class="content4_2">
                        <h2>First Class Services</h2><br>
                        <p>Where luxury meets exceptional care, creating unforgettable moments and exceeding your every expectation.</p>
                    </div>
                    <div class="content4_3">
                        <h2>24/7 road assistance</h2><br>
                        <p>Reliable support when you need it most, keeping you on the move with confidence and peace of mind.</p>
                    </div>
                    <div class="content4_4">
                        <h2>Free Pick-Up & Drop-Off</h2><br>
                        <p>Enjoy free pickup and drop-off services, adding an extra layer of ease to your car rental experience.</p>
                    </div>
                </div>
            </div>
            <!-- end of content 4 -->

            <!-- content 5 -->
            <div class="content5">
                <h2 class="contentheding">Latest From Us</h2>
            <h1 class="contentheding2">News & Promo</h1>
            <p class="contentp">Breaking news, fresh perspectives, and in-depth coverage - stay ahead with our latest news, insights, and analysis.</p>
            <div class="content5main">
                <div class="content5left">
                    <img src="images/travle.jpg" alt="">
                    <div class="content5leftp">
                        <h2>Enjoy Best Travel Experience</h2>
                       <p> Traveling is an enriching experience that allows us to explore new destinations, immerse ourselves in different cultures, and create lifelong memories.</p><br>
                       <button class="readmorbtn">Read More</button>
                    </div>
                </div>
                <div class="content5midle">
                    <img src="images/drive.jpeg" alt="">
                    <div class="content5midlep">
                        <h2>The Future of Car Rent</h2>
                        <p>As technology continues to advance at a rapid pace, the car rental industry is poised for a transformative shift. The future of car rental promises..</p><br>
                        <button class="readmorbtn">Read More</button>
                    </div>
                </div>
                <div class="content5right">
                    <img src="images/adventucherjpg.jpg" alt="">
                    <div class="content5rightp">
                        <h2>Holiday Tips For Backpacker</h2>
                        <p>For adventure seekers and budget-conscious travelers, backpacking offers a thrilling and immersive way to explore the world. Whether you're embarking..</p><br>
                        <button class="readmorbtn">Read More</button>
                    </div>
                </div>
            </div>
            </div>
            <!-- end of content 5 -->

            <!-- content 6 -->
            
				<%

Read_values obj_Read_values = new Read_values();

List<Package_Bean> list = obj_Read_values.get_values();

Iterator<Package_Bean> it_list = list.iterator();
%>
<div class="dispaly">

<%

while(it_list.hasNext()){
	Package_Bean obj_package_bean = it_list.next();
	
	
	
	%>
	
	 <div class="display-container">
	
        <%= obj_package_bean.getPackagename() %><br>
        <div class="price"><span><%= obj_package_bean.getBaseprice() %></span><sub>$</sub><br>
        <%= obj_package_bean.getPackagediscription() %><br></div> 
        <%= obj_package_bean.getVehicletype() %><br><hr>
       
        <%= obj_package_bean.getIncludemileage() %><br><hr>
        <%= obj_package_bean.getAdditionaldriverfee() %><br><hr>
        <%= obj_package_bean.getInsurancecoverage() %><br><hr>
        <%= obj_package_bean.getOtherservice() %><br><hr>
        <%= obj_package_bean.getDiscountrate() %><br><hr>
      <input type="submit" value="BUY NOW" class="buynow">
      
    </div>
	<%
}
%>

</div>
				
           
           
            
            
            <!-- end of content 6 -->

            <!-- begin of content 7 -->
            
        </div>
        <!-- end of content 7 -->

        <!--footer section -->
        <footer>
            <div class="footer1">
                <h3>About Rentaly</h3>
                <p>Where quality meets affordability. We understand the importance of a smooth and enjoyable journey without the burden of excessive costs. That's why we have meticulously crafted our offerings to provide you with top-notch vehicles at minimum expense.</p>
            </div>
            <div class="footer2">
                <h3>Contact Info</h3>
                <p>08 W 36th St, New York, NY 10001<br>
                    +1 333 9296<br>
                    contact@example.com<br>
                    Download Brochure</p>
            </div>
            <div class="footer3">
                <h3>Quick Links</h3>
                <a href="">Home</a><br>
                <a href="">Services</a><br>
                <a href="">About Us</a><br>
                <a href="">Contact Us</a><br>
            </div>
            <div class="footer4">
                <h3>Social Network</h3>
            </div>

        </footer>
        
       <div class="copyright">
        
        Copyright 2023 - Rentaly by Designesia
       </div> 
       <!-- enf of footer section -->


        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" src="javascript/script.js"></script>


</body>
</html>