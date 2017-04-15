<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />


<script type="text/javascript">
	$(document).ready(function () {
		
		$("form").validate({
			
			rules : {
				courseName : {
					required : true
				},
				subject : {
					required : true
				},
				courseCapacity : {
					required : true
				},
				courseDescription : {
					required : true
				},
				courseDifficulty : {
					required : true
				},
				courseFee : {
					required : true
				},
				startDate : {
					required : true
				},
				endDate : {
					required : true
				},
				
					
				},
				
			
			errorClass: "error"
		});
	});
	
	
</script>

<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
				<c:url value="/dashboard" var="dashboard"/>
					<li><a href="${dashboard}">Dashboard</a></li>
				<c:url value="/courseCatalog" var="catalog"/>
				<li>
					<a href="${catalog}">Course Catalog</a>
				</li>
				<li></li>
			</ul>
		</div>
		<!-- dashSidebar -->

		<div id="dashMain" class="col-sm-9 col-md-10">
			<div class="container-fluid">
				<h1 class="page-header">My Courses</h1>

				<div id="createCourse" class="create-course-div">
					<c:url var="formAction" value="/dashboard/createCourse" />
					<form method="POST" action="${formAction}">
					<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
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

						<div id="courseDescription" class="form-group row">
							<label for="courseDescription" class="col-md-2 col-form-label">Description</label> 
							<div class="col-md-8"><input
								class="form-control" type="text" name="courseDescription" placeholder="Description" />
						</div>
						</div>
						<div id="courseDifficulty" class="form-group">
							<label for="courseDifficulty">Difficulty</label> <select name= "courseDifficulty"
								class="custom-select">
								<option selected>Choose Difficulty</option>
								<option value="Beginner">Beginner</option>
								<option value="Intermediate">Intermediate</option>
								<option value="Advanced">Advanced</option>
							</select>

							<!-- <input
							type="text" name="courseDifficulty" placeholder="Difficulty" /> -->
						</div>

						<div id="courseFee" class="form-group row">
							<label for="courseFee" class="col-md-2 col-form-label">Fee</label> 
							<div class="col-md-8"><input class="form-control" type="text"
								name="courseFee" placeholder="Course Fee" />
						</div>
						</div>
						
						<div id="startDate" class="form-group row">
							<label for="startDate" class="col-md-2 col-form-label">Start Date</label>
							<div class="col-md-8">
								<input class="form-control" type="date" name="startDate"
									placeholder="Start Date" />
							</div>
						</div>
						
						<div id="endDate" class="form-group row">
							<label for="endDate" class="col-md-2 col-form-label">End Date</label>
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











