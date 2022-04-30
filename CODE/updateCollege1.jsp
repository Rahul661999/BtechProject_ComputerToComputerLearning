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
        String cid,cname,uname,pwd,addr,phn,email;
        %>
        <%
        cid=request.getParameter("cid");
        cname=request.getParameter("cname");
        uname=request.getParameter("uname");
        pwd=request.getParameter("pwd");
        email=request.getParameter("email");
        addr=request.getParameter("addr");
        phn=request.getParameter("phn");
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
        st=con.createStatement();
        pst=con.prepareStatement("update college set password=?,college_email=?,college_Postal_address=?,college_phone_number=? where college_id=?");
        pst.setString(1,pwd);
        pst.setString(2,email);
        pst.setString(3,addr);
        pst.setString(4,phn);
        pst.setString(5,cid);
        pst.execute();
        %>
        <jsp:include page="updateCollege.jsp"></jsp:include>
  
<div style="position: absolute; width: 370px; height: 47px; z-index: 1; left: 380px; top: 530px" id="layer4">
              <font color="#74CC39"><b><font face="Verdana" size="2"><%=cname%> Details are Updated Successfully       	
              </font>    	
              </b>    	</font>
          </div>
    </body>
</html>
