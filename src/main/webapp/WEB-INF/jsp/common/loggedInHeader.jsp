<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body>
	<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				
				<div class="navbar-header">
					<c:url value="/home" var="home"/>
					<a class="navbar-brand" href="${home}">eLearning Portal</a>
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#portal-navbar-collapse" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div> <!-- .navbar-header -->
				
				<div class="collapse navbar-collapse" id="te-navbar-collapse">	
					<ul class="nav navbar-nav">
						
						<c:url value="/logout" var="logout"/>
						<li><a href="${logout}">Log Out</a></li>
						
					</ul>
				</div> <!-- .navbar-collpase -->
			
			</div> <!-- .container-fluid -->
		</nav>

