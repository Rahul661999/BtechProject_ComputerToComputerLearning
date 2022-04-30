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
%>
	<% 
String driver = "com.mysql.jdbc.Driver";
String u=request.getParameter("uid");
String p=request.getParameter("pwd");
try{

	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from admin");
	String uid,pwd;
	int flag=0;
	while(rs.next())
	{
		uid=rs.getString(1);
		pwd=rs.getString(2);
		if(u.equals(uid)&&p.equals(pwd))
				{
				//out.println("welcome:"+u);
				response.sendRedirect("adminpage1.html");
				flag=1;
				break;
				}
	}
	if(flag==0)
	{
		//request.setAttribute("errorMsg","Invalid login Credentials!");
		//out.println("ID or password is incorrect!"+"<a href='stlogin.html'>Retry</a>");
		response.sendRedirect("adminerror.jsp");
		

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