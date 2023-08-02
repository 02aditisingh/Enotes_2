<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.User.Post"%>
<%@page import="com.DAO.PostDAO"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
//Retrieving object userD -->
UserDetails usr3 = (UserDetails) session.getAttribute("userD");
if (usr3 == null)//no data found in usr object means that user is not registered or has not logged in
{
	response.sendRedirect("login.jsp");
	session.setAttribute("Login Error", "Please Login. . .");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_components/all_css.jsp"%>

<title>Show Notes</title>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>
	<%
	String updateMsg=(String)session.getAttribute("updateMsg");
	if(updateMsg!=null){
		%>
		<div class="alert alert-sucess" role="alert"><%=updateMsg%></div>
		<%
		session.removeAttribute("updateMsg");
		}
	%>
	<%
	String wrongMsg=(String)session.getAttribute("wrongMsg");
	if(updateMsg!=null){
		%>
		<div class="alert alert-danger" role="alert"><%=wrongMsg%></div>
		<%
		session.removeAttribute("wrongMsg");
		}
	%>
	
	
	<div class="container">
		<h2 class="text-center">All Notes</h2>
		<div class="row">
			<div class="col-md-12">


				<%
				if (usr3 != null) {
							PostDAO ob = new PostDAO(DBConnect.getConn());
							List<Post> post = ob.getData(usr3.getId());//take notes here
							for (Post po : post) {
				%>
				

				<div class="card mt-3">
				
					<div class="card-body p-4">
					
					



						<h5 class="card-title"><%=po.getTitle()%></h5>


						<p><%=po.getContent()%>.
						</p>


						<p>
							<b class="text-success">Published By:<%=usr3.getName()%></b></br> <b
								class="text-primary"></b>
						</p>

						<p>
							<b class="text-success">Publish Date:<%=po.getPdate()%></b></br> <b
								class="text-primary"></b>
						</p>

						<div class="container text-center" mt-2>
							<a href="deleteServlet?note_id=<%=po.getId() %>" class="btn btn-danger">Delete</a>
							
							<!-- URL Rewriting -->
							<a href="edit.jsp?note_id=<%= po.getId() %>" class="btn btn-primary">Edit</a>
						</div>

					</div>
				</div>
				<%
				}
				}
				%>

			</div>
		</div>


	</div>
	</div>
	</div>
	</div>

</body>
</html>