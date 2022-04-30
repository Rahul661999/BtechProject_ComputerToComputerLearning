<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%!
	private DriverManager DriverManger1;
    private Connection con;
    private Statement st;
    PreparedStatement pst;
    ResultSet rs;

%>
<%


try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
	Statement st=con.createStatement();
String studentid =request.getParameter("studentid");
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String username=request.getParameter("username");
String password=request.getParameter("password");
String mobile=request.getParameter("mobile");
String email=request.getParameter("email");
String address=request.getParameter("address");
String college=request.getParameter("college");
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
st=con.createStatement();
pst = con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?)");
pst.setString(1,studentid);
pst.setString(2,firstname);
pst.setString(3,lastname);
pst.setString(4,username);
pst.setString(5,password);
pst.setString(6,mobile);
pst.setString(7,email);
pst.setString(8,address);
pst.setString(9,college);
pst.execute();
%>
<div style="position: absolute; width: 370px; height: 47px; z-index: 1; left: 500px; top: 500px" id="layer4">
    <font size=4 color="#00FF00">
        <h2><font size="2" face="Verdana">You have registered successfully</font></h2>
    </font>            
</div>
<%
}
//response.sendRedirect("studentlogin.html");	
catch(Exception e)
{
	//response.sendRedirect("error.html");
	out.println(e);
}
%>
<html>
<title>
</title>
<body>
<jsp:include page="studentlogin.html"></jsp:include>
</body></html>