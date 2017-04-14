<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eLearning Portal</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, userscalable=no">
	<!-- <link rel="stylesheet" type="text/css" href="/../css/student.css"> -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<c:url var="loggedInCssUrl" value="/css/loggedIn.css"/>
	<link rel="stylesheet" href="${loggedInCssUrl}" />
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				
				<div class="navbar-header">
					<%-- <c:url value="#" var="home"/> --%>
					<a class="navbar-brand" 
					<%-- href="${home}" --%>
					>
					eLearning Portal</a>
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#portal-navbar-collapse" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div> <!-- .navbar-header -->
				
				<div class="collapse navbar-collapse" id="te-navbar-collapse">	
					<ul class="nav navbar-nav">
						
						<c:url value="/" var="logout"/>
						<li><a href="${logout}">Log Out</a></li>
						
					</ul>
				</div> <!-- .navbar-collpase -->
			
			</div> <!-- .container-fluid -->
		</nav>

