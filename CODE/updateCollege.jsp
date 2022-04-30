<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="javascript" src="JS/form_valid.js"></script>
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
	width: 400px;
	height: 400px;
	align-items: center;
	padding: 50px;
	text-align: center;
}

textarea {
  resize: none;
  width: 100%;
	padding: 5px 10px;
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
                   <form action="updateCollege1.jsp" method="post" > 

            
            <%!
            Connection con;
            Statement st;
            PreparedStatement pst;
            ResultSet rs;
            String cid,cname,uname,pwd,addr,phn,email;
            int i;
            %>

                <%
                String cid=(String)session.getAttribute("cid");
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
                st=con.createStatement();
                rs=st.executeQuery("select * from college where college_id='"+cid+"'");
                if(rs.next())
                {
                cname=rs.getString(2);
                uname=rs.getString(3);
                pwd=rs.getString(4);
                email=rs.getString(5);
                addr=rs.getString(6);
                phn=rs.getString(7);
                %>
                <div>
			<font face="Trebuchet MS" size="6" color="#0CBEAC">Update
				College</font></b>
		</div>
		
                <table border="0" width="101%" id="table1">
                        <tr>
                            <td width="183"><b>
							<font face="Verdana" size="2">
							College Name</font></b></td>
                            <td>
							<input type="text" name="cname" size="28" tabindex="1" value="<%=cname%>" readonly></td>
                        </tr>
                        <tr>
                            <td width="183"><b>
							<font face="Verdana" size="2">
							User Name</font></b></td>
                            <td>
							<input type="text" name="uname" size="28" tabindex="1" value="<%=uname%>" disabled></td>
                        </tr>
                        <tr>
                            <td width="183"><b>
							<font face="Verdana" size="2" >Password</font></b></td>
                            <td>
							<input type="password" name="pwd" size="28" tabindex="2" value="<%=pwd%>"></td>
                        </tr>
                        <tr>
                            <td width="183"><b>
							<font face="Verdana" size="2" >Email</font></b></td>
                            <td>
							<input type="email" name="email" size="28" tabindex="2" value="<%=email%>"></td>
                        </tr>
                        
                        <tr>
                            <td width="183" height="26"><b>
							<font face="Verdana" size="2" >College Postal Address</font></b></td>
                            <td height="26">
                            <textarea rows="3" name="addr" cols="23" tabindex="3" value="<%=addr%>"><%=addr%></textarea></td>
                        </tr>
                        <tr>
                            <td width="183"><b>
							<font face="Verdana" size="2" >
							College Phone Number</font></b></td>
                            <td>
							<input type="text" name="phn" size="29" tabindex="4" value="<%=phn%>"></td>
                        </tr>
                        </table>
                <% }  %>
            </div>
                
            <div style="position: absolute; width: 185px; height: 800px; z-index: 3; left: 550px; top: 500px" id="layer3">
                <table border="0" width="100%" id="table2">
                    <tr>
                        <td>
                        <input type="submit" value="Update" name="submit" tabindex="2">                       
                        <input type="hidden" value="<%=cid%>" name="cid">
<input type="hidden" value="<%=cname%>" name="cname">
                        </td>
                    </tr>
                </table>
            </div>  
                
            	<p>&nbsp;</div>
        
    </body>
</html>
