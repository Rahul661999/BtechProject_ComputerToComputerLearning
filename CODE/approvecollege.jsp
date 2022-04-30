
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script language="JavaScript">
        function confirmApprove(delUrl) 
        {
          if (confirm("Are you sure you want to approve"))
          {
            document.location = delUrl;
          }
        }
        </script>

</head>
<body>

	<div
		style="position: absolute; width: 792px; height: 425px; z-index: 3; left: 115px; top: 229px"
		id="layer6">

		<div
			style="position: absolute; width: 310px; height: 55px; z-index: 1; left: 360px; top: -180px"
			id="layer1">
			<p align="center">
				<b> <font face="Trebuchet MS" size="6" color="#0CBEAC">Approve
						College</font></b>
		</div>

		<div
			style="position: absolute; width: 57px; height: 26px; z-index: 4; left: 731px; top: 4px"
			id="layer8">
			<!-- <a href="adminLogin.jsp"><b>
					<font face="Verdana" size="1" color="#000000">Back</font></b></a></div>  -->

			<%!
            Connection con;
            Statement st;
            PreparedStatement pst;
            ResultSet rs;
            String cid,cname,status;
            %>
			<%  
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            st=con.createStatement();
            rs=st.executeQuery("select * from college where status='Not Approved'");
            %>
			<div
				style="position: absolute; width: 300px; height: 50px; z-index: 1; left: -480px; top: -100px"
				id="layer9">
				<table width="599" border="1" bordercolor="#D8D8D8" id="table1">
					<tr>
						<td width="101" align="center"><b><font face="Verdana"
								size="2">College ID</font></b></td>
						<td width="391" align="center"><b><font face="Verdana"
								size="2">College Name</font></b></td>
						<td align="center"><b> <font face="Verdana" size="2">Status</font></b></td>
					</tr>
					<%
            while(rs.next())
            {
                cid=rs.getString(1);
                cname=rs.getString(2);
                status=rs.getString(8);            
            %>
					<tr>
						<td width="101" align="center"><font face="Verdana" size="2"><%= rs.getString(1) %></font></td>
						<td width="391" align="center"><font face="Verdana" size="2"><%= rs.getString(2) %></font></td>
						<td align="center"><a href="javascript:confirmApprove('approvecollege1.jsp?cid=<%=cid%>')">
								<font face="Verdana" size="2"><button>Approve</button> </font>
						</a></td>
					</tr>
					<%
            }
            %>
				</table>

				&nbsp;
			</div>
			<p>&nbsp;
		</div>
</body>
</html>


