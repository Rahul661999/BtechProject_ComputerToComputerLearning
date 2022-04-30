<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%!
	private DriverManager DriverManger1;
    private Connection con;
    private Statement st;
    ResultSet rs;
    String uid,pwd;
%>
	<% 
String driver = "com.mysql.jdbc.Driver";
String uid=request.getParameter("uid");
String pwd=request.getParameter("pwd");
try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
	Statement st=con.createStatement();
    session.setAttribute("uid",uid);
    rs=st.executeQuery("select * from student where username='"+uid+"'and password='"+pwd+"'");
    if(rs.next())
    {
        String stdid=rs.getString(1);
        String fname=rs.getString(2);
        String lname=rs.getString(3);
        String college=rs.getString(9);
        session.setAttribute("stdid",stdid);
        session.setAttribute("fname",fname);
        session.setAttribute("lname",lname);
        session.setAttribute("college",college);
		response.sendRedirect("studentpage1.html");
    }
    else
	{
		//request.setAttribute("errorMsg","Invalid login Credentials!");
		//out.println("ID or password is incorrect!"+"<a href='stlogin.html'>Retry</a>");
		response.sendRedirect("studenterror.jsp");
		

	//response.sendRedirect("stlogin.html");
	}


con.close();
}
catch(Exception e)
{
	//response.sendRedirect("error.jsp");
	out.println(e);
}
%>
</body>
</html>