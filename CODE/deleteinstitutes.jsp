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
String id = request.getParameter("id");
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
ResultSet resultSet = null;
%>
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <script language="JavaScript">
        function confirmDelete(delUrl) 
        {
          if (confirm("Are you sure you want to delete"))
          {
            document.location = delUrl;
          }
        }
        </script>

    </head>
	
<body>
	<h1 style="text-align:center">Retrieve data from database in jsp</h1>
	<table border="1">
		<tr>
			<th>College Id</th>
			<th>College Name</th>
			<th>Username</th>
			<th>Password</th>
			<th>College Email</th>
			<th>College Postal Address</th>
			<th>College Phone Number</th>
			<th>College Status</th>
			<th>Action</th>
		</tr>
		<%
Connection con=null;
Statement st=null;
ResultSet rs=null;
try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
			st=con.createStatement();
		String qry="select *from college";
		
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
			<td><a href="javascript:confirmDelete('delete.jsp?college_id=<%=rs.getString(1)%>')"><button
						type="button" class="delete">Delete</button></a></td>
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
