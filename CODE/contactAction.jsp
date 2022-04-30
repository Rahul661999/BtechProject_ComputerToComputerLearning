<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>

<%!
	private DriverManager DriverManager1;
    private Connection con;
    private Statement st;
%><%
String driver = "com.mysql.jdbc.Driver";
String name=request.getParameter("name");
String phone=request.getParameter("phone");
String email=request.getParameter("email");
String text=request.getParameter("text");

try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
	//con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
	Statement st=con.createStatement();
	//System.out.println(st.execute("SELECT * FROM user"));
	st.executeUpdate("INSERT INTO contact (name,phone,email,text) values ('"+name+"','"+phone+"','"+email+"','"+text+"')");
	//INSERT INTO `user` (`name`, `mobileNo`, `email`, `password`) VALUES ('test1', '765454211', 'a@a.aaa', '765454211');
	//response.sendRedirect("save.html");
	out.println("succefully inserted");
	
}


catch(Exception e)
{
	System.out.println(e);
	//response.sendRedirect("error.html");
	out.println("error");
}
%>