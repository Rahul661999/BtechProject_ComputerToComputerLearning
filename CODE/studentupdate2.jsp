<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/project";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String firstname = request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String username=request.getParameter("username");
String password=request.getParameter("password");
String mobile=request.getParameter("mobile");
String email=request.getParameter("email");
String address=request.getParameter("address");
String college=request.getParameter("college");

if(email != null)
{
Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update student set firstname=?,lastname=?,username=?,password=?,mobile=?,email=?,address=?,college=? where email="+email;
ps = con.prepareStatement(sql);
ps.setString(1,firstname);
ps.setString(2,lastname);
ps.setString(3,username);
ps.setString(4,password);
ps.setString(5,mobile);
ps.setString(6,email);
ps.setString(7,address);
ps.setString(8,college);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>