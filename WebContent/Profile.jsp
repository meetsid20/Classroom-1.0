<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style>
body{
background:url("server/postback.jpg");
background-size:cover;
}
.profilecover{
background:url("img/cover.jpg");
background-position:fixed;
background-size:cover;
background-repeat:no-repeat;
}
.propic{
max-width:200px;
height:auto;
width:25%;
}
.panel-default{
border-color:rgb(26,26,26);
}
.panel-default > .panel-heading {
background-color:rgb(26,26,26);
color:white;
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
<li  class="active"><a href="Profile.jsp"><span class="glyphicon glyphicon-user"></span> Me</a></li>

<li ><a href="bagpack.jsp"><span class="glyphicon glyphicon-send"></span> Announcements</a></li>
<%if(session.getAttribute("isPresident").equals("1")) 
{%>
<li><a href="upload.html"><span class="glyphicon glyphicon-king"></span> President's DashBoard</a></li>
<%} %>
<li><a href="default.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
</ul>
</div>
</div>
</nav>
<br><br><br><br>
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">

<div class="panel-group" id="accordion">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
        About</a>
      </h4>
    </div>
    <div id="collapse1" class="panel-collapse collapse in">
      <div class="panel-body">
      <h2><%=session.getAttribute("fname")%> <%=session.getAttribute("lname")%></h2><%if(session.getAttribute("isPresident").equals("1")){ %><span><b>(Class President)</b></span><br><br><%} %>
      <%=session.getAttribute("email")%>
      <br><%=session.getAttribute("member")%>
      <br><br><br><b>Class : </b><%=session.getAttribute("classid")%><br><br>
    </div>
    </div>
  </div>
  </div>


</div>
</div>
</body>
</html>