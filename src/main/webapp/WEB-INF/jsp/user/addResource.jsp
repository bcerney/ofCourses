<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />



<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
				<c:url value="/dashboard" var="dashboard" />
				<li><a href="${dashboard}">Dashboard</a></li>
				<c:url value="/dashboard/${course.courseId}/${module.moduleId}"
					var="addModule" />
				<li><a href="${addModule}">Back to Module</a></li>					
			</ul>
		</div>
		<!-- dashSidebar -->

		<div id="dashMain" class="col-sm-9 col-md-10">
			<div class="container-fluid">
				<h1 class="page-header">${course.name}- ${module.name} -
					${lesson.name}</h1>

				<div id="addResource" class="add-module-div">
					<h2>Add Resource</h2>

					<c:url
						value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}/addResource"
						var="addResource" />
					<form method="POST" action=addResource>

						<div id="resourceTitle" class="form-group row">
							<label for="resourceTitle" class="col-md-2 col-form-label">Title:
							</label>
							<div class="col-md-8">
								<input class="form-control" type="text" name="resourceTitle"
									placeholder="Title" />
							</div>
						</div>

						<div id="resourceDescription" class="form-group row">
							<label for="resourceDescription" class="col-md-2 col-form-label">Description:
							</label>
							<div class="col-md-8">
								<input class="form-control" type="text"
									name="resourceDescription" placeholder="Description" />
							</div>
						</div>
						
						<div id="resourceUrl" class="form-group row">
							<label for="resourceUrl" class="col-md-2 col-form-label">URL:
							</label>
							<div class="col-md-8">
								<input class="form-control" type="text"
									name="resourceUrl" placeholder="URL" />
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
