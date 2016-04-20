<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "sid91");
Statement s=con.createStatement();
ResultSet r;
String email=request.getParameter("email");
String pwd=request.getParameter("pwd");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String gender=request.getParameter("gender");
String password2=request.getParameter("confirmpwd");
String member=request.getParameter("member");
String classid=request.getParameter("classid");
if(email.equals("")||fname.equals("")||lname.equals("")||pwd.equals(""))
{
	session.setAttribute("message","All details are required!");
	response.sendRedirect("signupform.jsp");
}
else if(!pwd.equals(password2))
{
	session.setAttribute("message","Passwords didn't match!");
	response.sendRedirect("signupform.jsp");
}
else{
boolean flag=true;
r=s.executeQuery("select* from credentials;");
while(r.next())
{
	if(r.getString("email").equals(email))
	{
		flag=false;
		session.setAttribute("message","Account with entered email already exists!");
		response.sendRedirect("signupform.jsp");
	}
}

if (flag)
{
	r.close();
	String query="insert into credentials values( \""+email+"\", \""+pwd+"\", \""+fname+"\", \""+lname+"\", \""+gender+"\",\""+member+"\",\""+classid+"\" );";
	s.executeUpdate(query);
	session.setAttribute("email", email);
	session.setAttribute("fname",fname);
	session.setAttribute("lname",lname);
	session.setAttribute("gender",gender);
	session.setAttribute("member",member);
	session.setAttribute("classid",classid);
	r=s.executeQuery("select email from presidents where classid=\""+session.getAttribute("classid")+"\";");
	r.next();
	if(email.equals(r.getString("email")))
	session.setAttribute("isPresident","1");
	else
	session.setAttribute("isPresident","0");	
	response.sendRedirect("bagpack.jsp");
}
}
%>
</body>
</html>