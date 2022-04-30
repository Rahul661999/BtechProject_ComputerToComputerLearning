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
        String fid,fname,qual,exp,skill;
        int i;
        %>
        <%
        try{
        String cid=(String)session.getAttribute("cid");
        fid=request.getParameter("fid");
        fname=request.getParameter("fname");
        qual=request.getParameter("qual");
        exp=request.getParameter("exp");
        skill=request.getParameter("skill");
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
        st=con.createStatement();
        /*rs=st.executeQuery("select fid.nextval from dual");
        if(rs.next())
        i=rs.getInt(1);
        fid="fac00"+i;*/
        
        pst = con.prepareStatement("insert into faculty values(?,?,?,?,?,?)");
        pst.setString(1,cid);
        pst.setString(2,fid);
        pst.setString(3,fname);
        pst.setString(4,qual);
        pst.setString(5,exp);
        pst.setString(6,skill);
        pst.execute();
        %>
        <div style="position: absolute; width: 556px; height: 22px; z-index: 2; left: 300px; top: 500px" id="layer2">
            <font size=4 color="#00FF00">
                <h2><font size="2" face="Verdana">Faculty added successfully</font></h2>
            </font>            
        </div>
    <%
    }
    catch(Exception e)
    {
    %>  
        <div style="position: absolute; width: 556px; height: 22px; z-index: 2; left: 123px; top: 308px" id="layer1">
           <font size="6" color="#FF0000"> <%
              out.print(e.getMessage());
            %></font><b><font size="2" color="#FF0000" face="Verdana">
            Error in Page
        </font>
        	</b>
        </div>        
    <%
    }
    %>  
        <jsp:include page="addfaculty.html"></jsp:include>
    </body>
</html>
