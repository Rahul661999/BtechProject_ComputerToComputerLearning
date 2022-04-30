<%@ page import="java.sql.*" %>
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
        String stdid,fname,lname,uname,pwd,phn,email,addr,coll;

        %>
        <%
        //stdid=request.getParameter("stdid");
        String stdid=(String)session.getAttribute("stdid");
        fname=request.getParameter("fname");
        lname=request.getParameter("lname");
        uname=request.getParameter("uname");
        pwd=request.getParameter("pwd");
        phn=request.getParameter("phn");
        email=request.getParameter("email");
        addr=request.getParameter("addr");
        coll=request.getParameter("coll");
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
        st=con.createStatement();
        pst=con.prepareStatement("update student set password=?,mobile=?,email=?,address=?,college=? where student_id=?");
        pst.setString(1,pwd);
        pst.setString(2,phn);
        pst.setString(3,email);
        pst.setString(4,addr);
        pst.setString(5,coll);
        pst.setString(6,stdid);
        pst.execute();
        %>
<jsp:include page="updateStud.jsp"></jsp:include>        
<div style="position: absolute; width: 370px; height: 47px; z-index: 1; left: 350px; top: 10px" id="layer4">
              <font color="#74CC39"><b><font face="Verdana" size="2"><%=fname%> Details are Updated Successfully       	
              </font>    	
              </b>    	</font>
          </div>
    </body>
</html>
