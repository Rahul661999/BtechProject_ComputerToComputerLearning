<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String email = request.getParameter("email");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "project";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
%>
<html>
<body>
	<h1>Data from Student Table</h1>
	<table id="t01" border="1">
		<tr>
			<th>FirstName</th>
			<th>Lastname</th>
			<th>Username</th>
			<th>Password</th>
			<th>Mobile</th>
			<th>Email</th>
			<th>Address</th>
			<th>College</th>
			<th>Action</th>
		</tr>

		<%
		try
			{
			Connection con = null;
			Statement st = null;

				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
 				st=con.createStatement();
				String qry="select *from student";
				
				rs=st.executeQuery(qry);
				while(rs.next())
				{
					%>
		<tr>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4) %></td>
			<td><%= rs.getString(5) %></td>
			<td><%= rs.getString(6) %></td>
			<td><%= rs.getString(7) %></td>
			<td><%= rs.getString(8) %></td>
			<td><a href="studentupdate1.jsp?email=<%=rs.getString(6)%>"><button>update</button></a></td>
		</tr>
		<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
	</table>
</body>
</html>
