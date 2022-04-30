<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <style>
body {
	border-style: solid;
	border-width: 5px;
	border-color: lightblue;
	margin: 50px;
	margin-left: auto;
	margin-right: auto;
	display: flex;
	justify-content: center;
	width: 340px;
	height: 300px;
	align-items: center;
	padding: 50px;
	text-align: center;
}

textarea {
  resize: none;
  width: 100%;
	padding: 10px 20px;
	margin: 8px 0;
	box-sizing: border-box;
}


.button {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

input[type=text] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
}

input[type=email] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
}

input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
}

a:active {
	color: #4CAF50;
}
</style>

    
    <body>     
        <form action="sendrequest1.jsp" method="post">
            <div style="position: absolute; width: 792px; height: 425px; z-index: 3; left: 150px; top: 90px" id="layer6">
                
                <div style="position: absolute; width: 239px; height: 100px; z-index: 1; left: 320px; top: 10px" id="layer1">
                    <p align="center"><b>
                        <font face="Trebuchet MS" size="6" color="#0CBEAC">Send 
                Request</font></b></div>
                
                <!-- <div style="position: absolute; width: 57px; height: 26px; z-index: 4; left: 731px; top: 4px" id="layer8">
                    <b><a href="stdLogin.jsp">
                <font face="Verdana" size="1" color="#FFFFFF">Back</font></a></b></div>  -->
        <%!
        Connection con;
        Statement st,st1;
        PreparedStatement pst;
        ResultSet rs,rs1;
        String stname,college,stdid;
        %>
        <%
            stdid=(String)session.getAttribute("stdid");
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            st=con.createStatement();
            rs=st.executeQuery("select * from student where student_id='"+stdid+"'");  
            while(rs.next())
                { 
                   stname=rs.getString(4);
                   college=rs.getString(9);
        %>
                <div style="position: absolute; width: 294px; height: 144px; z-index: 5; left: 263px; top: 100px" id="layer9">
                    <table border="0" width="100%" id="table1">
                        <tr>
                            <td width="43%"><b>
                            <font face="Verdana" size="2" >Name</font></b></td>
                            <td colspan="2">
                            <input type="text" name="stname" size="20" tabindex="1" value="<%=stname%>" disabled></td>
                        </tr>
                        <tr>
                            <td width="43%"><b>
                                    <font face="Verdana" size="2" >
                            College</font></b></td>
                            <td colspan="2">
                            <input type="text" name="cname" size="20" tabindex="2" value="<%=college%>" disabled></td>
                        </tr>
                        <tr>
                            <td width="43%"><b>
                                    <font face="Verdana" size="2">
                            Request For</font></b></td>
                            <td colspan="2">
                            <textarea rows="2" name="reqfor" cols="20"></textarea></td>
                        </tr>
                        <tr>
                            <td width="43%">&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                        </tr>  
                        <tr>
                            <td width="43%">&nbsp;</td>
                            <td width="24%">
                            <input type="submit" value="Submit" name="B1" tabindex="4"></td>
                            <td width="28%">
                            <input type="reset" value="Reset" name="B2" tabindex="5">
                            <input type="hidden" name="stname" value="<%=stname%>">
                            <input type="hidden" name="college" value="<%=college%>"></td>
                        </tr>
                    </table>
                </div>       
           <% 
                }
           %>
            <p>&nbsp;</div>
        </form>
    </body>
</html>
