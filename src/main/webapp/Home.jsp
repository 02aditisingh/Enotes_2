<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	//Retrieving object userD -->
	UserDetails usr2 = (UserDetails)session.getAttribute("userD");
	if(usr2==null)//no data found in usr object means that user is not registered or has not logged in
	{
		response.sendRedirect("login.jsp");
		session.setAttribute("Login Error", "Please Login. . .");
	}
	 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<%@include file="all_components/all_css.jsp"%>
</head>
</head>
<body>

<div class="container-fluid p-0">
<%@include file="all_components/navbar.jsp"%>
<div class="card py-5">
<div class="card body text-center">
<img alt="" src="img/p1.jpg" class="img-fluid mx-auto" style="max-width: 300px;">
<h1>START TAKING YOUR NOTES</h1>
<a href="addNotes.jsp" class="btn btn-outline-primary">Start Here</a>
</div>
</div>
</div>
	
</body>

</html>