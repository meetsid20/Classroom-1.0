<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
background-image:url("server/defaultback.jpg");
background-position:fixed;
background-size:cover;
background-repeat:no-repeat;
background-color:black;
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
<li><a href="signupform.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
</ul>
</div>
</div>
</nav>
<br><br><br><br><br><br><br><br>
<div class="row">
<div class="col-xs-1"></div>
<div class="panel panel-default col-sm-3 col-xs-10">
<div class="panel-heading">Login</div>
<div class="panel-body">
<form action="login.jsp" method="get">
  <%if(session.getAttribute("message")!=null)
	  {%>
	 <div class="form-group">
	 <div class="alert alert-warning">
   <%=session.getAttribute("message")%>
</div>
<%} session.invalidate();%>
	 </div>
  <div class="form-group">
    <label for="email">E-mail:</label>
    <input type="text" class="form-control" name="email">
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" name="pwd">
  </div>
  <input class="btn btn-primary col-sm-12 form-control" type="submit" value="Submit">
  <br><br>
  </form>
</div>
</div>
</div>
</body>
</html>