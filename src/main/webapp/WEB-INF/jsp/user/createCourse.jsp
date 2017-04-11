<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Course</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, userscalable=no">
<c:url value="/css/student.css" var="cssHref" />
<link rel="stylesheet" href="${cssHref}">
<!-- <link rel="stylesheet" type="text/css" href="/../css/student.css"> -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
				<li>My Courses</li>
				<li>Course Catalog</li>
				<li></li>
			</ul>
		</div>
		<!-- dashSidebar -->

		<div id="dashMain" class="col-sm-9 col-md-10">
			<h1 class="page-header">My Courses</h1>
			<div id="exampleCourse" class="dashboard-course-div"></div>



			<div class="createCourse">
				<c:url var="formAction" value="/createCourse" />
				<form method="POST" action="${formAction}">
					<h2>Create Course</h2>
					<br>
					<div>
						<label for="courseName">Name</label> <input type="text"
							name="courseName" placeholder="Name" />
					</div>

					<div class="courseDescription">
						<label for="courseDescription">Course Description</label> <input
							type="text" name="courseDescription"
							placeholder="Description" />
					</div>

					<div class="courseDifficulty">
						<label for="courseDifficulty">Course Difficulty</label> <input
							type="text" name="courseDifficulty"
							placeholder="Difficulty" />
					</div>

					<div class="courseCost">
						<label for="courseCost">Course Cost</label> <input type="text"
							name="courseCost" placeholder="Cost" />
					</div>

					<input class="formSubmitButton" type="submit" value="Submit!" />


				</form>

			</div>

		</div>
		<!-- dashMain -->
	</div>
	<!-- row -->
</div>
<!-- dashboardDiv -->
</body>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
</html>











