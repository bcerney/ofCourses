<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ofCourses: The Obvious Place to Learn</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, userscalable=no">
<!-- <link rel="stylesheet" type="text/css" href="/../css/student.css"> -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/home.css" />
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
	

</head>

<body>
	<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#te-navbar-collapse" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand">ofCourses: The Obvious Place to Learn</a>
				</div> <!-- .navbar-header -->
				
				<div id="te-navbar-collapse" class="collapse navbar-collapse">	
					<ul class="nav navbar-nav navbar-right">
						<c:url value="/login" var="login"/>
						<li><a id="loginButton" href="${login}">Log In</a></li>
						<c:url value="/register" var="register"/>
						<li><a id="signUpButton" href="${register}">Sign Up</a></li>
					</ul>
				</div> <!-- .navbar-collpase -->
			
			</div> <!-- .container-fluid -->
		</nav>

