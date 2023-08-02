<%@page import="com.Db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background: url("img/img.jpeg");
	width: 100%;
	height: 80vh;
	background-repeat: no repeat;
	background-size: cover;
}
</style>
<meta charset="UTF-8">
<title>HOME PAGE</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>
	<%
	Connection conn = DBConnect.getConn();
	System.out.print(conn);
	%>

	<div class="container-fluid back-img">

		<div class="text-center">
			<h1 class="text-white">
				<i class="fa fa-book" aria-hidden="true"></i>E Notes-Save your
				Notes.
			</h1>
			<a href="login.jsp" class="btn btn-light"><i
				class="fa fa-sign-in" aria-hidden="true"></i>Login</a> <a
				href="register.jsp" class="btn btn-light"><i class="fa fa-user"
				aria-hidden="true"></i>Register</a>
		</div>

	</div>
	<%@include file="all_components/footer.jsp"%>
</body>
</html>