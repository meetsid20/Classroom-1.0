<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.Random"%>
 
<!DOCTYPE html>
<html lang="en">
<head>
  <title>BootstraP</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
  		body{
  		background-color:black;
  		}
  		.one{
  			background: url("server/postback.jpg");
  			background-position:center;
 			
  			color:white;
  			margin: 0;
  			min-height: 50%px;
  		}
  </style>

</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
<div class="container-fluid">
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#NBAR">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span> 
</button>
<a href="#" class="navbar-brand"><B>Cl <span class="glyphicon glyphicon-education"></span> ssroom</B></a>
</div>
<div class="collapse navbar-collapse" id="NBAR">
<ul class="nav navbar-nav navbar-right">
<li><a href="Profile.jsp"><span class="glyphicon glyphicon-user"></span> Me</a></li>

<li  class="active"><a href="bagpack.jsp"><span class="glyphicon glyphicon-send"></span> Announcements</a></li>
<%if(session.getAttribute("isPresident").equals("1")) 
{%>
<li><a href="upload.html"><span class="glyphicon glyphicon-king"></span> President's DashBoard</a></li>
<%} %>
<li><a href="default.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
</ul>
</div>
</div>
</nav>
<br><br>


  <div  class="jumbotron one">
  	<div class="row">
  		<div class="col-xs-2"></div>
  		<div class="col-xs-9"><h1>Hi,<%=session.getAttribute("fname")%></h1></div>
	</div>
	<div class="row">
		<div class="col-xs-2"></div>
  		<div class="col-xs-9"><p>Don't miss out these updates :)</p><br><br></div>
	</div>

  </div>
  
<%Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "sid91");
Statement s=con.createStatement(ResultSet.TYPE_FORWARD_ONLY,
        ResultSet.CONCUR_READ_ONLY);
ResultSet r;
r=s.executeQuery("select* from posts where classid=\""+session.getAttribute("classid")+"\";");
Random rand=new Random();
int flag=rand.nextInt(5)+1;
%>
  
  

  
 <%
String colors[]={"#004D40","#B71C1C","#880E4F","#827717","#3E2723","#1A237E"};
int count=0;
if(r.next())
{
	
r.last();
do
{
	count++;
	String filelist=r.getString("filelist");
	String files[]=filelist.split(" ");
	String[] images=new String[100];
	String[] attachments=new String[100];
	int i,j=0,k=0;
	for(i=0;i<files.length&&!filelist.equals("");i++)
	{
		if(files[i].substring(files[i].indexOf(".")).equals(".jpg")||files[i].substring(files[i].indexOf(".")).equals(".jpeg")||files[i].substring(files[i].indexOf(".")).equals(".bmp")||files[i].substring(files[i].indexOf(".")).equals(".gif")||files[i].substring(files[i].indexOf(".")).equals(".png"))
		{
			images[j]=files[i];
			j++;
		}
		else
		{
			attachments[k]=files[i];
			k++;
		}
	}
	
	%>
<div  class="jumbotron" style="background-color:<%=colors[(flag+count)%6]%>;margin:0;color:white;">
  	<div class="row">
  		<div class="col-xs-2"></div>
  		<div class="col-xs-9"><h1><%=r.getString("subject")%></h1><hr></div>
	</div>
	<br><br>
	<div class="row">
  		<div class="col-xs-2"></div>
  		<div class="col-xs-9"><%=r.getString("description")%></div>
	</div>
	<br><br><br><br>
	<div class="row">
		<div class="col-xs-2"></div>
  		<div class="col-xs-9" style="">
  		<%if(j!=0)
  			{%>
  		<h6><b>Images :-</b></h6><br>
  		<%} %>
  		<%
  			for(i=0;i<j;i++)
  			{
  		%>
  			<a href="server\<%=images[i]%>" target="_blank"><img src="server\<%=images[i]%>" class="img-thumbnail img-responsive" style="height:auto;;width:auto;display:inline;max-width:100px;max-height:100px;"></a>
  		<%} %>
  		</div>
	</div>
	<br><br>
	
	<div class="row">
		<div class="col-xs-2"></div>
  		<div class="col-xs-9">
  		<%if(k!=0)
  			{%>
  		<h6><b>Attachments :-</b></h6>
  		<%} %>
  		<%
  			for(i=0;i<k;i++)
  			{
  		%>
  		<a class="btn btn-default" href="server\<%=attachments[i]%>">File-<%=i+1%></a> 
  		<%} %>
  		</div>
	</div>

	<div class="row">
		<div class="col-xs-2"></div>
  		<div class="col-xs-9"><br><br><br><span style="float:right"><%=r.getString("time")%></span></div>
	</div>
  </div>
<%
}while(r.previous());
}
else
{
%>
 <div  class="jumbotron">
  	<div class="row">
  		<div class="col-xs-2"></div>
  		<div class="col-xs-9"><h4>Nothing to Show!</h4></div>
	</div>
</div>
<%} %> 
  
</body>
</html>
