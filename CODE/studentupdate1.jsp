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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from student where email="+email;
rs = statement.executeQuery(sql);
while(rs.next()){
%>
<!DOCTYPE html>
<html>
<body>
	<h1>Update data from database in jsp</h1>
	<form method="post" action="studentupdate2.jsp">
		<input type="hidden" name="email" value="<%=rs.getString("email") %>">
		<input type="email" name="email" value="<%=rs.getString("email") %>">
		<br> First name:<br> <input type="text" name="firstname"
			value="<%=rs.getString("firstname") %>"> <br> Last name:<br>
		<input type="text" name="lastname"
			value="<%=rs.getString("lastname") %>"> <br> User name:<br>
		<input type="text" name="username"
			value="<%=rs.getString("username") %>"> <br> Password:<br>
		<input type="password" name="password"
			value="<%=rs.getString("password") %>"> <br> Mobile:<br>
		<input type="text" name="mobile" value="<%=rs.getString("mobile") %>">
		<br> Address:<br> <input type="text" name="address"
			value="<%=rs.getString("address") %>"> <br> College:<br>
		<input type="text" name="college"
			value="<%=rs.getString("college") %>"> <br>
		<br> <input type="submit" value="submit">
	</form>
	<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>
