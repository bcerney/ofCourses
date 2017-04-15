<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />



<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
				<c:url value="/dashboard/${course.courseId}/addModule"
					var="addModule" />
				<li><a href="${addModule}">Add Module</a></li>
				<%-- <c:url value="/dashboard/" --%>
				<li>Add Lesson</li>
				<li>Add Resources</li>
			</ul>
			<ul class="nav sidebar-nav">
				<c:url value="/dashboard" var="dashboard" />
				<li><a href="${dashboard}">Dashboard</a></li>
			</ul>
		</div>
		<!-- dashSidebar -->

		<div id="dashMain" class="col-sm-9 col-md-10">
			<div class="container-fluid">
				<h1 class="page-header">${course.name}- ${module.name} -
					${lesson.name}</h1>

				<div id="addAssignment" class="add-module-div">
					<h2>Add Assignment</h2>

					<c:url
						value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}/addAssignment"
						var="addAssignment" />
					<form method="POST" action=addAssignment}>

						<div id="assignmentName" class="form-group row">
							<label for="assignmentName" class="col-md-2 col-form-label">Name:
							</label>
							<div class="col-md-8">
								<input class="form-control" type="text" name="assignmentName"
									placeholder="Name" />
							</div>
						</div>

						<div id="assignmentDescription" class="form-group row">
							<label for="assignmentDescription" class="col-md-2 col-form-label">Description:
							</label>
							<div class="col-md-8">
								<input class="form-control" type="text"
									name="assignmentDescription" placeholder="Description" />
							</div>
						</div>
						
						<div id="assignmentMaxScore" class="form-group row">
							<label for="assignmentMaxScore" class="col-md-2 col-form-label">Max Score:
							</label>
							<div class="col-md-8">
								<input class="form-control" type="text"
									name="assignmentMaxScore" placeholder="Max Score" />
							</div>
						</div>
						
						<div id="assignDate" class="form-group row">
							<label for="assignDate" class="col-md-2 col-form-label">Assign Date: </label>
							<div class="col-md-8">
								<input class="form-control" type="date" name="assignDate"
									placeholder="mm/dd/yyyy" />
							</div>
						</div>
						
						<div id="dueDate" class="form-group row">
							<label for="dueDate" class="col-md-2 col-form-label">Due Date: </label>
							<div class="col-md-8">
								<input class="form-control" type="date" name="dueDate"
									placeholder="mm/dd/yyyy" />
							</div>
						</div>

						<input class="formSubmitButton" type="submit" value="Add Resource" />

					</form>
				</div>
				<!-- #addLesson -->
			</div>
			<!-- .container-fluid -->
		</div>
		<!-- dashMain -->
	</div>
	<!-- row -->
</div>
<!-- dashboardDiv -->

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
