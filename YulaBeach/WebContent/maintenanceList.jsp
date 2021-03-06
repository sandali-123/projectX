<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String job_id = request.getParameter("job_id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "yulabeach";
String userid = "root";
String password = "12345";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>



<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {background-color: #f2f2f2;}
</style>




<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Maintenance Task List</title>

<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
     
    <link rel="stylesheet" style="text/css" href="styles/grn.css"> 
        <style>
     		<%@ include file="styles/formStyles.css"%>
		</style>
		
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<body>
	<%@include file="WEB-INF/view/header.jsp" %>
	
   
    <div id="leftNavi">
    
        <form method = "post" action="searchMaint.jsp">
    
    	<input id="search" type="text" class="form-control" name="job_id" placeholder="Enter Job ID">
    	<input id="searchBtn" type="submit" class="btn btn-primary" value="Search Job"/>  
    	
    	</form> 
    	
    	<div id="hrLine"></div>     	 
    	<a id="leftNevTEXT" href="inventory.jsp"><span class="glyphicon glyphicon-home"></span> Home</a><br>
    	<div id="hrLine"></div> 
    	<a id="leftNevTEXTbody" href="#"><span class="glyphicon glyphicon-th"></span> Dashboard</a><br>
    	<div id="hrLine"></div> 
    	<a id="leftNevTEXTbody" href="cleaning.jsp" ><span class="glyphicon glyphicon-tasks"></span> New cleaning Task</a><br>
    	<div id="hrLine"></div> 
    	<a id="leftNevTEXTbody" href="maintenance.jsp"><span class="glyphicon glyphicon-wrench"></span> New maintenance task </a><br>
    	<div id="hrLine"></div> 
    	<a id="leftNevTEXTbody" href="maintenanceList.jsp" style="color: yellow;"><span class="glyphicon glyphicon-list-alt"></span> Current Maint. tasks</a><br>
    	<div id="hrLine"></div> 
    	<a id="leftNevTEXTbody" href="cleaningList.jsp"><span class="glyphicon glyphicon-list-alt"></span> Current Cleaning tasks</a><br>
    	<div id="hrLine"></div>
    	<a id="leftNevTEXTbody" href="grn.jsp"><span class="glyphicon glyphicon-circle-arrow-down"></span> Requests</a><br>
    	<div id="hrLine"></div>
    	<a id="leftNevTEXTbody" href="grn.jsp"><span class="glyphicon glyphicon-tag"></span> Inventory</a><br>
    	<div id="hrLine"></div>
    	 
    </div>     
    <div id="topNavi">
    	<p id="topNavHeading"><span class="glyphicon glyphicon-list-alt"></span> Current Maintenance Tasks</p> 
    </div>



	<div class="containerX"  style="margin-left:350px;margin-right:250px;">
	
		<h2>Task List</h2><br>
	
			<table>
				<tr>
				<td>Job id</td>
				<td>Room number</td>
				<td>Assigned Employee ID</td>
				<td>Description</td>
				<td>Date</td>
				<td>Update</td>
				<td>Delete</td>
				</tr>
			
			<%
			try{
				connection = DriverManager.getConnection(connectionUrl+database, userid, password);
				statement=connection.createStatement();
				String sql ="select * from maintenance";
				resultSet = statement.executeQuery(sql);
				
				int j = 0;
				
				while(resultSet.next()){
			
			
			%>
				<tr>
				<td><%=resultSet.getString("job_id") %></td>
				<td><%=resultSet.getString("room_no") %></td>
				<td><%=resultSet.getString("emp_id") %></td>
				<td><%=resultSet.getString("desc") %></td>
				<td><%=resultSet.getString("date") %></td>
				<td><a class="btn btn-primary" href="updateMaintenance.jsp?job_id=<%=resultSet.getString("job_id")%>">Update</a></td>
				<td><a class="btn btn-primary" style="background-color:red;" href="deleteMaint.jsp?job_id=<%=resultSet.getString("job_id") %>">Delete</a></td>
				</tr>
	
			<%
			
			j++;
				}
				
				connection.close();
			
			} catch (Exception e) {
			
				e.printStackTrace();
			}
			%>
			
			</table>
	
	
	</div>

			<%@include file="WEB-INF/view/footer.jsp" %>
</body>
</html>