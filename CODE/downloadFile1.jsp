
<%@ page import="java.sql.*"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.BufferedInputStream"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.IOException"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%

   // you  can get your base and parent from the database
   String base="e1";
   String parent="e2";   
   String filename=request.getParameter("fn");
// you can  write http://localhost
   String filepath="C:/Files/";

BufferedInputStream buf=null;
   ServletOutputStream myOut=null;

try{

    myOut = response.getOutputStream( );
     File myfile = new File(filepath+filename);
     
     response.addHeader("Content-Disposition","attachment; filename="+filename );

     response.setContentLength( (int) myfile.length( ) );
     
     FileInputStream input = new FileInputStream(myfile);
     buf = new BufferedInputStream(input);
     int readBytes = 0;

     //read from the file; write to the ServletOutputStream
     while((readBytes = buf.read( )) != -1)
       myOut.write(readBytes);

} catch (IOException ioe){
     
        throw new ServletException(ioe.getMessage( ));
         
     } finally {
         
     //close the input/output streams
         if (myOut != null)
             myOut.close( );
          if (buf != null)
          buf.close( );
         
     }
%>

</body>
</html>


