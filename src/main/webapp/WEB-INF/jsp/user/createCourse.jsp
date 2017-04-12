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
			<div class="container-fluid">
				<h1 class="page-header">My Courses</h1>

				<div id="createCourse" class="create-course-div">
					<c:url var="formAction" value="/user/createCourse" />
					<form method="POST" action="${formAction}">
						<h2>Create Course</h2>

						<div id="courseName" class="form-group row">
							<label for="courseName" class="col-md-2 col-form-label">Name</label>
							<div class="col-md-8">
								<input class="form-control" type="text" name="courseName"
									placeholder="Name" />
							</div>
						</div>
						
						<div id="subject" class="form-group row">
							<label for="subject" class="col-md-2 col-form-label">Subject</label>
							<div class="col-md-8">
								<input class="form-control" type="text" name="subject"
									placeholder="Subject" />
							</div>
						</div>

						<div id="courseCapacity" class="form-group row">
							<label for="courseCapacity" class="col-md-2 col-form-label">Capacity</label>
							<div class="col-md-8">
								<input class="form-control" type="text" name="courseCapacity"
									placeholder="Capacity" />
							</div>
						</div>

						<div id="courseDescription" class="form-group">
							<label for="courseDescription">Course Description</label> <input
								type="text" name="courseDescription" placeholder="Description" />
						</div>

						<div id="courseDifficulty" class="form-group">
							<label for="courseDifficulty">Course Difficulty</label> <select name= "courseDifficulty"
								class="custom-select">
								<option selected>Choose Difficulty</option>
								<option value="Beginner">Beginner</option>
								<option value="Intermediate">Intermediate</option>
								<option value="Advanced">Advanced</option>
							</select>

							<!-- <input
							type="text" name="courseDifficulty" placeholder="Difficulty" /> -->
						</div>

						<div class="courseFee" class="form-group">
							<label for="courseFee">Course Fee</label> <input type="text"
								name="courseFee" placeholder="Course Fee" />
						</div>
						
						<div id="startDate" class="form-group row">
							<label for="startDate" class="col-md-2 col-form-label">Start Date (mm/dd/yyyy)</label>
							<div class="col-md-8">
								<input class="form-control" type="date" name="startDate"
									placeholder="Start Date" />
							</div>
						</div>
						
						<div id="endDate" class="form-group row">
							<label for="endDate" class="col-md-2 col-form-label">End Date (mm/dd/yyyy)</label>
							<div class="col-md-8">
								<input class="form-control" type="date" name="endDate"
									placeholder="End Date" />
							</div>
						</div>

						<input class="formSubmitButton" type="submit" value="Submit!" />


					</form>

				</div>
				<!-- createCourse -->
			</div>
			<!-- .container-fluid -->
		</div>
		<!-- dashMain -->
	</div>
	<!-- row -->
</div>
<!-- dashboardDiv -->
</body>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
</html>











