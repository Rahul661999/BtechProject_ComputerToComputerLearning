<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
             
        <form action="sendresponse1.jsp" method="post">
            <div style="position: absolute; width: 792px; height: 425px; z-index: 3; left: 115px; top: 229px" id="layer6">
                <div style="position: absolute; width: 239px; height: 55px; z-index: 1; left: 271px; top: 28px" id="layer1">
                    <p align="center"><b>
                <font face="Trebuchet MS" size="6" color="#0CBEAC">Response</font></b></div>
                
                <!-- <div style="position: absolute; width: 57px; height: 26px; z-index: 4; left: 731px; top: 4px" id="layer8">
                    <b><a href="viewRequest.jsp">
                <font face="Verdana" size="1" color="#FFFFFF">Back</font></a></b></div>  -->
                
                <div style="position: absolute; width: 306px; height: 136px; z-index: 5; left: 266px; top: 122px" id="layer9">
                    <table border="3" width="100%" id="table1" bordercolor="#808080">
                <%!
                Connection con;
                Statement st,st1;
                PreparedStatement pst;
                ResultSet rs,rs1;
                String cid,stname,reqfor,reqdate,reqid;
                %>
                <%
                cid=(String)session.getAttribute("cid");
                reqid=request.getParameter("reqid");
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");  
                st1=con.createStatement();
                rs1=st1.executeQuery("select * from request where cid='"+cid+"' and reqid='"+reqid+"'");  
                if(rs1.next())
                {
                stname=rs1.getString(4);      
                reqfor=rs1.getString(5);
                reqdate=rs1.getString(6);
                 %>
                        <tr>
                            <td width="114"><b>
                            <font face="Verdana" size="2" color="black">Name</font></b></td>
                            <td colspan="2"><b>
							<font face="Verdana" size="2" color="black"><%=stname%></font></b></td>
                        </tr>
                        <tr>
                            <td width="114"><b>
                                    <font face="Verdana" size="2" color="black">
                            Request For</font></b></td>
                            <td colspan="2"><b>
							<font face="Verdana" size="2" color="black"><%=reqfor%></font></b></td>
                        </tr>
                        <tr>
                            <td width="114"><b>
                                    <font face="Verdana" size="2" color="black">
                            Requested Date</font></b></td>
                            <td colspan="2"><b>
							<font face="Verdana" size="2" color="black"><%=reqdate%></font></b></td>
                        </tr>
                        <tr>
                            <td width="114"><b>
                                    <font face="Verdana" size="2" color="black">
                            Response</font></b></td>
                            <td colspan="2">
                            <textarea rows="2" name="resp" cols="20" ></textarea></td>
                        </tr>
                        <tr>
                            <td width="114">&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <!-- <td width="114">&nbsp;</td>  -->
                            <td><input type="submit" value="Submit" name="B1"></td>
                            <td><input type="reset" value="Reset" name="B2">
                            <input type="hidden" value="<%=reqid%>" name="reqid">
                            </td>
                        </tr>
                <% 
                }
                %>
                    </table>
                </div>
            <p>&nbsp;</div>
        </form>
    </body>
</html>
