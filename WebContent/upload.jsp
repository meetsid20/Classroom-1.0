<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE=HTML>
<html>
<head>
<title>
Upload
</title>
</head>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "sid91");
	Statement stmt=con.createStatement();
    String filelist="";
	File file ;
   String filePath = "C:\\Users\\Sid\\workspace\\Istudent\\WebContent\\server";
      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setRepository(new File("C:\\Users\\Sid\\workspace\\Istudent\\WebContent\\temp"));
      ServletFileUpload upload = new ServletFileUpload(factory);
      try{ 
         List<FileItem> fileItems = upload.parseRequest(request);
         Iterator<FileItem> i = fileItems.iterator();
         Date d=new Date();
         int count=0;
         String datestr=String.valueOf(d.getTime());
       	while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            count++;
            String fileName = fi.getName();
           	if(!fileName.equals(""))
           	{
         	file = new File( filePath + "\\"+datestr+"-"+String.valueOf(count) + fileName.substring(fileName.lastIndexOf("."))) ;
            filelist+=datestr+"-"+String.valueOf(count)+fileName.substring(fileName.lastIndexOf("."))+" ";
         	fi.write( file ) ;
           	}
         	out.println("Uploaded Filename: " + filePath + 
            fileName + "<br><br><br>");
            }
            else if(fi.isFormField())
            {
            	request.setAttribute(fi.getFieldName(), fi.getString());
            }
         }
    	String s="insert into posts values( \""+session.getAttribute("classid")+"\",\""+request.getAttribute("subject")+"\",\""+request.getAttribute("description")+"\",\""+d.toString()+"\",\""+filelist+"\");";   
      	stmt.executeUpdate(s);
      	stmt.close();
      	con.close();
      	
      	response.sendRedirect("bagpack.jsp");
      }catch(Exception ex) {
         out.println(ex);
      }
%>
</body>
</html>