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
<title>Insert title here</title>
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
<a href="#" class="navbar-brand"><B>Cl <span class="glyphicon glyphicon-education"></span> ssroom</B></B></a>
</div>
<div class="collapse navbar-collapse" id="NBAR">
<ul class="nav navbar-nav navbar-right">
<li><a href="default.jsp"><span class="glyphicon glyphicon-log-in"></span> Log In</a></li>
</ul>
</div>
</div>
</nav>
<br><br><br><br><br><br>
<div class="row">
<div class="col-sm-4"></div>
<div class="panel panel-default col-sm-4">
<div class="panel-heading">Registration Form</div>
<div class="panel-body">
<form action="signup.jsp" method="post">
<%
if(session.getAttribute("message")!=null)
{
%>
<div class="form-group">
	 <div class="alert alert-warning">
   <%=session.getAttribute("message")%>
</div>
</div>
<%} session.removeAttribute("message");%>
<div class="row">
<div class="form-group col-sm-6">
<label for="fname"> First Name : </label>
<input type="text" class="form-control" name="fname">
</div>
<div class="form-group col-sm-6">
<label for="lname"> Last Name : </label>
<input type="text" class="form-control" name="lname">
</div>
</div>
<div class="row">
<div class="form-group col-sm-6">
    <label for="email">E-mail:</label>
    <input type="email" class="form-control" name="email">
</div>
<div class="form-group col-sm-6">
  <label for="gender">Gender:</label>
  <select class="form-control" name="gender">
    <option value="Male">Male</option>
    <option value="Female">Female</option>
    <option value="Other">Other</option>
    <option value="*">Refuse to Answer</option>
  </select>
</div>
</div>
<div class="row">
<div class="form-group col-sm-6">
    <label for="member">Contact Number: </label>
	<input class="form-control" type="text" name="member"> 
</div>
<div class="col-sm-6 form-group">
<label for="classid">Class : </label>
<select class="form-control" name="classid">
<option value="6">VI</option>
<option value="7">VII</option>
<option value="8">VIII</option>
<option value="9">IX</option>
<option value="10">X</option>
<option value="11">XI</option>
<option value="12">XII</option>
</select>
</div>
</div>
<div class="row">
<div class="form-group col-sm-6">
<label for="pwd">Password: </label>
<input type="password" class="form-control" name="pwd">
</div>
<div class="form-group col-sm-6">
<label for="confirmpwd">Confirm Password: </label>
<input type="password" class="form-control" name="confirmpwd">
</div>
</div>
<input class="btn btn-primary col-sm-12 btn-large" type="submit" value="Submit">
</form>
</div>
</div>
</div>
</body>
</html>