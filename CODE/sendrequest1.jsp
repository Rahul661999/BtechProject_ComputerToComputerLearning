<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
        <%!
        Connection con;
        Statement st,st1;
        PreparedStatement pst;
        ResultSet rs,rs1;
        String reqid,stdid,stname,cname,reqfor,cid,resp,resdate;
        int i;
        %>
        <%
        try{
        stdid=(String)session.getAttribute("stdid");          
        stname=request.getParameter("stname");
        cname=request.getParameter("college");               
        reqfor=request.getParameter("reqfor");              
        resp="No Response";
        resdate="";        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");  
            st=con.createStatement();
            /*
            rs=st.executeQuery("select reqid.nextval from dual");
            if(rs.next())
            i=rs.getInt(1);
            reqid="req00"+i;
            */
            st1=con.createStatement();
            rs1=st1.executeQuery("select college_id from college where college_name='"+cname+"'"); 
            if(rs1.next())
                  cid=rs1.getString(1);
            //System.out.println(cid+cname+stdid+reqfor+stname);
        //st=con.createStatement();
        pst = con.prepareStatement("insert into request (cid,cname,stid,stname,reqfor,reqdate,response,resdate) values(?,?,?,?,?,now(),?,?)");
       	pst.setString(1,cid);
        pst.setString(2,cname);
        pst.setString(3,stdid);
        pst.setString(4,stname);
        pst.setString(5,reqfor);
        pst.setString(6,resp);
        pst.setString(7,resdate);
        pst.execute();
        %>
        <div style="position: absolute; width: 556px; height: 22px; z-index: 2; left: 290px; top: 460px" id="layer2">
            <font size=4 color="#00FF00">
                <h2><font size="2" face="Verdana">Your <%=cid+"  "+cname%> request has been sent successfully</font></h2>
            </font>  
        </div>
        <% 
        }
        catch(Exception e)
        {
        %>
        <div style="position: absolute; width: 556px; height: 29px; z-index: 2; left: 125px; top: 308px" id="layer1">
           <font size="6" color="#FF0000"> </font><b><font size="2" color="#FF0000" face="Verdana">
            Error in Page <%=e %>
        </font>
        	</b>
        </div>     
        <% 
        }
        %>
       <jsp:include page="sendrequest.jsp"></jsp:include>
    </body>
</html>
