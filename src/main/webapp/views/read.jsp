<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import ="com.springboot.springbootdealvps.entity.User"%>
    <%@page import ="com.springboot.springbootdealvps.service.Service"%>
    <%@page import ="java.util.*"%>
<%
     
   Object obj = request.getAttribute("user");
   User user = (User) obj;
 %>   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Page</title>
</head>

<style>

 table{
        
        	width: 50%;
        	border: 1px solid #ccc;
        }
        
        th, td{
        	padding: 10px;
        	text-align:left;
        	border-bottom: 1px solid #ccc;
        }
        
        th{
        	background-color: #f2f2f2;
        	font-weight: bold;
        }


</style>

<body>

<h1>Display</h1>

<table border="1" cellspacing="0">

	<tr>
	<th>id</th>
	<th>Name</th>
	<th>Description</th>
	</tr>
	

<% if(user !=null) { %>
	<tr>
	<td><%= user.getId() %></td>
	<td><%= user.getName() %></td>
	<td><%= user.getDescription() %></td>
	</tr>
<%}else { %>
<p>User Not Found!!!</p>
<% }%>
</table>

</body>
</html>