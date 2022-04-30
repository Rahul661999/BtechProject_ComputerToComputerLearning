<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>        
            <%!
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            String stdid,fname,feedback;
            %>
            <%
            stdid=(String)session.getAttribute("stdid");
	        fname=(String)session.getAttribute("fname");
            feedback=request.getParameter("feedback");
            //out.println("stdid : "+stdid);
            //out.println("fname : "+fname);
            //out.println("feedback : "+feedback);
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            pst=con.prepareStatement("insert into studfeedback values(?,?,?)");
            pst.setString(1,stdid);
            pst.setString(2,fname);
            pst.setString(3,feedback);
            pst.execute();
            %>
        <div style="position: absolute; width: 556px; height: 22px; z-index: 2; left: 300px; top: 400px" id="layer2">
            <font size=4 color="#00FF00">
                <h2><font size="2" face="Verdana">Feedback Submitted successfully</font></h2>
            </font>  
        </div>
            <jsp:include page="sendFeedback.html"></jsp:include>
    </body>
</html>
