<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />



<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
				<c:url value="/dashboard" var="dashboard" />
				<li><a href="${dashboard}">Dashboard</a></li>
<%-- 				<c:url value="/dashboard/${course.courseId}/addModule"
					var="addModule" />
				<li><a href="${addModule}">Add Module</a></li> --%>
			</ul>
		</div>
		<!-- dashSidebar -->

		<div id="dashMain" class="col-sm-9 col-md-10">
			<div class="container-fluid">
				<h1 class="page-header">${course.name}- ${module.name}</h1>

				<div id="addLesson" class="add-module-div">
					<h2>Add Lesson</h2>
					
					<c:url
						value="/dashboard/${course.courseId}/${module.moduleId}/addLesson"
						var="addLesson" />
					<form method="POST" action=${addLesson}>
					
						<div id="lessonName" class="form-group row">
							<label for="lessonName" class="col-md-2 col-form-label">Lesson
								Name: </label>
							<div class="col-md-8">
								<input class="form-control" type="text" name="lessonName"
									placeholder="Lesson Name" />
							</div>
						</div>
						
						<div id="lessonDescription" class="form-group row">
							<label for="lessonDescription" class="col-md-2 col-form-label">Lesson
								Description: </label>
							<div class="col-md-8">
								<input class="form-control" type="text" name="lessonDescription"
									placeholder="Lesson Description" />
							</div>
						</div>
						
						<input class="formSubmitButton" type="submit" value="Add Lesson" />
						
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
</body>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
</html>