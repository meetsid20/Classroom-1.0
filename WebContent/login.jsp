<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String email=request.getParameter("email");
String pwd=request.getParameter("pwd");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "sid91");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from credentials");
boolean status=false;
while(rs.next())
{
	if(rs.getString("email").equals(email)&&rs.getString("pwd").equals(pwd))
	{
		session.setAttribute("email",email);
		session.setAttribute("fname",rs.getString("fname"));
		session.setAttribute("lname",rs.getString("lname"));
		session.setAttribute("gender",rs.getString("gender"));
		session.setAttribute("member",rs.getString("member"));
		session.setAttribute("classid",rs.getString("classid"));
		session.setAttribute("message",null);
		
		status=true;
			
	}
}
if(!status)
{
	session.setAttribute("message","The entered Email or Password is incorrect!");
	response.sendRedirect("default.jsp");
}
else
{
	rs.close();
	rs=stmt.executeQuery("select email from presidents where classid=\""+session.getAttribute("classid")+"\";");
	rs.next();
	if(email.equals(rs.getString("email")))
	session.setAttribute("isPresident","1");
	else
	session.setAttribute("isPresident","0");	
	response.sendRedirect("bagpack.jsp");
}
	
	con.close();

stmt.close();

%>
</body>
</html>