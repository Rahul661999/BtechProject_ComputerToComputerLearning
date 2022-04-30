<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%!
	private DriverManager DriverManger1;
    private Connection con;
    private Statement st;
    ResultSet rs;
%>
<%


try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
	Statement st=con.createStatement();
String driver = "com.mysql.jdbc.Driver";
String college_id=request.getParameter("college_id");
String college_name=request.getParameter("college_name");
String username=request.getParameter("username");
String password=request.getParameter("password");
String college_email=request.getParameter("college_email");
String college_Postal_Address=request.getParameter("college_Postal_Address");
String college_phone_number=request.getParameter("college_phone_number");
String status="NOT APPROVED";
String qry="insert into college(college_id,college_name,username,password,college_email,college_Postal_Address,college_phone_number,status) values('"+college_id+"','"+college_name+"','"+username+"','"+password+"','"+college_email+"','"+college_Postal_Address+"','"+college_phone_number+"','"+status+"')";
st.executeUpdate(qry);
//con.close();
//response.sendRedirect("collegelogin.html");	
%>
<div style="position: absolute; width: 370px; height: 47px; z-index: 1; left: 500px; top: 500px" id="layer4">
<font color="#74CC39"><b><font face="Verdana" size="2">College Registered Successfully </font>    	
</b>    	</font>
</div>
<%
}
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
<jsp:include page="collegelogin.html"></jsp:include>
</body></html>