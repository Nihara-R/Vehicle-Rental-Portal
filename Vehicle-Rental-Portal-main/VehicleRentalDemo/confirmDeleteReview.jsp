<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/deleteConfirm.css">
    <style>
        body{
            width: 100%;
            height: 100vh;
            background:url(images/Background_image3.jpeg)no-repeat 50% 50%;
            background-size:cover;
            background-attachment: fixed;
            
           
        }
        .header-wrapper {
            position: fixed;
            width: 100%;
            z-index: 2;
            background-color: #fff;
        }
    </style>
</head>
<body>

<div class="box">
	    <div class="smallbox">
		    <p class="heading">Are you sure you want to delete this review?</p>
		    <form action="DeleteReviews" method="post" class="card">
		        <input type="hidden" name="id" value="${param.id}">
		        <button type="submit" name="confirmDelete" value="true" class="true1">Yes, Delete My Review</button>
		        <a href="DeleteReviews?id=${param.id}&confirmDelete=false" class="false1">Cancel</a>
		    </form>   
        </div>
    </div>

</body>
</html>