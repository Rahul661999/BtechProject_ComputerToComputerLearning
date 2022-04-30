<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>        
            <div style="position: absolute; width: 792px; height: 425px; z-index: 3; left: 115px; top: 10px" id="layer6">
                
                <div style="position: absolute; width: 328px; height: 55px; z-index: 1; left: 218px; top: 10px" id="layer1">
                    <p align="center"><b>
					<font face="Trebuchet MS" size="6" color="#0CBEAC">Students 
					Requests</font></b></div>
                
            	<!-- <div style="position: absolute; width: 57px; height: 26px; z-index: 4; left: 731px; top: 4px" id="layer8">
					<b><a href="collegeLogin.jsp">
					<font face="Verdana" size="1" color="#FFFFFF">Back</font></a></b></div>  -->
     
                <div style="position: absolute; width: 723px; height: 100px; z-index: 5; left: 35px; top: 100px" id="layer9">
                        <table border="2" width="100%" bordercolor="#808080" id="table1"> 
                                <tr>
                                        <td align="center"><b>
                                        <font face="Verdana" size="2" color="#E4DB6B">
                                        College</font></b></td>
                                        <td align="center"><b>
                                        <font face="Verdana" size="2" color="#E4DB6B">
                                        Student</font></b></td>
                                        <td align="center" width="218"><b>
                                        <font face="Verdana" size="2" color="#E4DB6B">
                                        Request For</font></b></td>
                                        <td align="center" width="121"><b>
                                        <font face="Verdana" size="2" color="#E4DB6B">
                                        Requested Date</font></b></td>
                                        <td align="center"><b>
                                        <font face="Verdana" size="2" color="#E4DB6B">Action</font></b></td>
                                </tr>           
     <%!
            Connection con;
            Statement st;
            ResultSet rs;
            String cid,college,stname,reqfor,reqdate,reqid;
            int i=0;
     %>
     <%
            cid=(String)session.getAttribute("cid");
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            st=con.createStatement();
            rs=st.executeQuery("select * from request where cid='"+cid+"' and response='No Response'");  
            while(rs.next())
            {                
                college=rs.getString(2);
                stname=rs.getString(4);
                reqfor=rs.getString(5);
                reqdate=rs.getString(6);
                reqid=rs.getString(9);
                i++;
     %>
                                <tr>
                                        <td align="center"><b><font face="Verdana" size="2" color="black"><%=college%></font></b></td>
                                        <td align="center"><b><font face="Verdana" size="2" color="black"><%=stname%></font></b></td>
                                        <td align="center" width="218"><b><font face="Verdana" size="2" color="black"><%=reqfor%></font></b></td>
                                        <td align="center" width="218"><b><font face="Verdana" size="2" color="black"><%=reqdate%></font></b></td>
                                        <td align="center" width="121"><b><font face="Verdana" size="2" color="black">
										<a href="sendresponse.jsp?reqid=<%=reqid%>">
										<font color="black">Send Response</font></a></font></b></td>
                                </tr>
      <% 
                }
      %>
                </table>
          </div>
      <%
                if(i==0)
                    {
      %>                   
        <div style="position: absolute; width: 219px; height: 22px; z-index: 2; left: 298px; top: 120px" id="layer2">
            <font size=4 color="#00FF00">
                <h2><font size="2" face="Verdana">There are no requests</font></h2>
            </font>  
        </div>      
        <% 
                        }
        %>
            	<p>&nbsp;</div>        
    </body>
</html>
