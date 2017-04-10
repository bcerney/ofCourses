<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>eLearning Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, userscalable=no">
   <%--  <c:url value="/css/solarsystemgeek.css" var="cssHref" />
    <link rel="stylesheet" href="${cssHref}"> --%>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body>
	<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				
				<div class="navbar-header">
					<a class="navbar-brand" href='#'>eLearning Portal</a>
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#portal-navbar-collapse" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div> <!-- .navbar-header -->
				
				<div class="collapse navbar-collapse" id="te-navbar-collapse">	
					<ul class="nav navbar-nav">
						<li><a href="#">Teachers</a></li>
						<li><a href="#">Students</a></li>
						<li><a href="#">Log In</a></li>
						<li><a href="#">Sign Up</a></li>
					</ul>
				</div> <!-- .navbar-collpase -->
			
			</div> <!-- .container-fluid -->
		</nav>

</body>
</html>