<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users with All Poor Reviews :(</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>


<body>
<h4>Users with All Poor Reviews :(</h4>
<div class = "card">
<table class = "table table-dark">
<tr>
<td>USERNAME</td>
</tr>

<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "dbProject.Item" %>
<%@ page import = "dbProject.FavoriteItem" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "dbProject.User" %>
<% 


Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/projectdb?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();
String x ="SELECT username FROM users WHERE user_id in (SELECT userR_id FROM reviews WHERE userR_id not in(SELECT userR_id FROM reviews WHERE (Score='Good' or Score='Fair' or Score='Excellent')) GROUP BY user_id);";
ResultSet rs = st.executeQuery(x);

while(rs.next()){
	

	%>
	
	<tr>
	<td><%=rs.getString("username") %></td>
   	</tr> 
   	<% 
   	
}
rs.close();
%>
</table>
</div>
</body>
</html>




</table>
<br><br>
<a href = "part3Menu.html">Part 3 Menu</a><br></br>
<a href = "mainMenu.jsp">Main Menu </a><br></br>
</body>
</html>