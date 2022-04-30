<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script language="javascript">    
        function ismaxlength(obj)
        {
                var mlength=obj.getAttribute? parseInt(obj.getAttribute("maxlength")) : ""
                if (obj.getAttribute && obj.value.length>mlength)
                obj.value=obj.value.substring(0,mlength)
        }
    </script>
    </head>
    <body>        
     <form action="sendfeedback1.jsp" method=post name=c2c>
            <div style="position: absolute; width: 792px; height: 425px; z-index: 3; left: 115px; top: 229px" id="layer6">
                
                <div style="position: absolute; width: 239px; height: 55px; z-index: 1; left: 271px; top: 28px" id="layer1">
                    <p align="center"><b>
					<font face="Trebuchet MS" size="6" color="#0CBEAC">Send 
					Feedback</font></b></div>
                <%
                String str;
                String utype=(String)session.getAttribute("utype");
                if(utype.equals("std"))
                    str="stdLogin.jsp";
                else
                    str="collegeLogin.jsp";                
                %>
            	<div style="position: absolute; width: 57px; height: 26px; z-index: 4; left: 731px; top: 4px" id="layer8">
					<b><a href="<%=str%>">
					<font face="Verdana" size="1" color="#FFFFFF">Back</font></a></b></div>
                
            <div style="position: absolute; width: 683px; height: 173px; z-index: 4; left: 42px; top: 108px" id="layer9">
                <font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<font color="#E4DB6B">Please Submit your feed back (maximum length :
				</font> 
                <font face="Times New Roman" color="#E4DB6B">450</font><font color="#E4DB6B"> characters only) 
				</font> </font>
                <table border="0" id="table1" width="629">
                    <tr>
                        <td><font color="#0CBEAC"><b><font face="Trebuchet MS">Feed Back</font><font size="4">
                        :</font></b></font></td>
                        <td><textarea rows="7" name="feedback" cols="56" onkeyup="return ismaxlength(this)" onBlur="return ismaxlength(this)" maxlength="450"></textarea></td>
                    </tr>
                <tr>
                        <td>&nbsp;</td>
                        <td><input type="submit" value="Submit Feedback" name="B1">&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="Reset" name="B2"></td>
                    </tr>
                </table>
                <p>&nbsp;</p>
            <p><br></div>
                
            	<p>&nbsp;</div>
        </form>
    </body>
</html>
