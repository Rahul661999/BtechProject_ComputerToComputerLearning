
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%!
            Connection con;
            Statement st;
            PreparedStatement pst;
            ResultSet rs;
            String cid;
            %>
	<%  
            cid=request.getParameter("cid");
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            st=con.createStatement();
            st.executeUpdate("update college set status='Approved' where college_id='"+cid+"'");
            %>
	<jsp:include page="approvecollege.jsp"></jsp:include>
	<div
		style="position: absolute; width: 556px; height: 20px; z-index: 2; left: 400px; top: 10px"
		id="layer2">
		<font size=4 color="#00FF00">
			<h2>
				<font size="2" face="Verdana">Status Approved for <%=cid%></font>
			</h2>
		</font>
	</div>
</body>
</html>

