<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Dashboard</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, userscalable=no">
	<c:url value="/css/student.css" var="cssHref" /> 
<link rel="stylesheet"
	href="${cssHref}">
<!-- <link rel="stylesheet" type="text/css" href="/../css/student.css"> -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />

<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
				<li>My Courses</li>
				<li>Course Catalog</li>
				<c:url value="/user/createCourse" var="createCourse"/>
				<li><a href="${createCourse}">Create Course</a></li>
				<li></li>
			</ul>
		</div>
		<!-- dashSidebar -->

		
		<div id="dashMain" class="col-sm-9 col-md-10">
			<p><c:out value="${user.firstName}"/></p>
			<h1 class="page-header">My Courses</h1>
			<div id="exampleCourse" class="dashboard-course-div">
			
			</div>
		<div id= "courses">
			<c:forEach var="course" items="${userCourses}">
				<h3>${course.name}</h3>
				<p>${course.subject}</p>
				<p>${course.capacity}</p>
				<p>${course.description}</p>
				<p>${course.fee}</p>
				<p>${course.startDate}</p>
				<p>${course.endDate}</p>
				<p>${course.difficulty}</p>	
			</c:forEach>
		</div>
		</div>
		<!-- dashMain -->

	</div>
	<!-- row -->

</div>
<!-- dashboardDiv -->





<c:import url="/WEB-INF/jsp/common/footer.jsp" />