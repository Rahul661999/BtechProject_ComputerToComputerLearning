<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display data in jsp</title>
<style>
table {
	width: 100%;
}

table, th, td {
	border: 1px solid pink;
	border-collapse: collapse;
}

th, td {
	padding: 15px;
	text-align: left;
}

#t01 tr:hover {
	background-color: blue;
}

#t01 tr:nth-child(even) {
	background-color: #eee;
}

#t01 tr:nth-child(odd) {
	background-color: #fff;
}

#t01 th {
	background-color: black;
	color: white;
}
</style>

</head>
<body>
	<center>
		<h1>Data from CollFeedback Table</h1>
		<table id="t01">
			<tr>
				<th>College Id</th>
				<th>College Name</th>
				<th>Feedback</th>
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
				String qry="select *from collfeedback";
				
				rs=st.executeQuery(qry);
				while(rs.next())
				{
					%>
			<tr>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
			</tr>
			<%
				}
			}
			catch(Exception e)
			{
				out.println("Exception:"+e.getMessage());
				e.printStackTrace();
			}
			%>
			</center>
		</table>
</body>
</html>