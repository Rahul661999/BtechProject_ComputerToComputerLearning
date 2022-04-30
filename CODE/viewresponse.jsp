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
					<b><a href="stdLogin.jsp">
					<font face="Verdana" size="1" color="#FFFFFF">Back</font></a></b></div>  -->
     <%!
            Connection con;
            Statement st;
            ResultSet rs;
            String cid,college,stname,reqfor,reqdate,resp,respdate,stdid;
     %>
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
                                        <font face="Verdana" size="2" color="#E4DB6B">Response</font></b></td><td align="center"><b>
                                        <font face="Verdana" size="2" color="#E4DB6B">Response Date</font></b></td>
                                </tr>
     <%
            stdid=(String)session.getAttribute("stdid");
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            st=con.createStatement();
            rs=st.executeQuery("select * from request where stid='"+stdid+"'");  
            while(rs.next())
            {
                college=rs.getString(2);
                stname=rs.getString(4);
                reqfor=rs.getString(5);
                reqdate=rs.getString(6);
                resp=rs.getString(7);
                respdate=rs.getString(8);
     %>

                        <tr>
                                <td align="center"><b><font face="Verdana" size="2" ><%=college%></font></b></td>
                                <td align="center"><b><font face="Verdana" size="2" ><%=stname%></font></b></td>
                                <td align="center" width="218"><b><font face="Verdana" size="2" ><%=reqfor%></font></b></td>
                                <td align="center" width="218"><b><font face="Verdana" size="2" ><%=reqdate%></font></b></td>
                                <td align="center" width="218"><b><font face="Verdana" size="2" ><%=resp%></font></b></td>
                                <td align="center" width="218"><b><font face="Verdana" size="2" ><%=respdate%></font></b></td>
                        </tr>
               
      <% 
                }
      %>
            </table>
        </div> 	<p>&nbsp;</div>
        
    </body>
</html>
