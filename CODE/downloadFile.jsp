
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div
		style="position: absolute; width: 792px; height: 425px; z-index: 3; left: 100px; top: 229px"
		id="layer6">

		<div
			style="position: absolute; width: 283px; height: 55px; z-index: 1; left: 360px; top: -230px"
			id="layer1">
			<p align="center">
				<b> <font face="Trebuchet MS" size="6" color="#0CBEAC">Download
						Articles</font></b>
		</div>
		<!-- <div
			style="position: absolute; width: 600px; height: 400px; z-index: 4; left: 250px; top: -200px"
			id="layer8">
			<b><a href="studentpage1.html"> <font face="Verdana" size="1"
					color="#FFFFFF"><button type="button">Back</button></font></a></b>
		</div>

		<p>
	</div>  -->

	<div
		style="position: absolute; width: 600px; height: 400px; z-index: 4; left: 280px; top: -150px"
		id="layer9">
		<table border="0" width="100%" id="table1">
			<tr>
				<td><b><font face="Tahoma" color="#E4DB6B">File Name</font></b></td>
				<td><b><font face="Tahoma" color="#E4DB6B">Download</font></b></td>
			</tr>
			<%
File f1=new File("C:\\Files");
File []fn=f1.listFiles();
for(int i=0;i<fn.length;i++)
    {
    %>
			<tr>
				<td><%=fn[i].getName()%></td>
				<td><a href="downloadFile1.jsp?fn=<%=fn[i].getName()%>">Download</a></td>
			</tr>
			<%
    }
%>

		</table>
	</div>

</body>
</html>


