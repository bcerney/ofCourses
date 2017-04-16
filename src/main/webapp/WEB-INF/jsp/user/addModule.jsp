<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />



<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
				<c:url value="/dashboard" var="dashboard" />
				<li><a href="${dashboard}">Dashboard</a></li>
				<c:url value="/dashboard/${course.courseId}"
				var="addModule" />
				<li><a href="${addModule}">Back to Course</a></li>
			</ul>
		</div>
		<!-- dashSidebar -->

		<div id="dashMain" class="col-sm-9 col-md-10">
			<div class="container-fluid">
				<h1 class="page-header">Add Module</h1>

				<div id="addModule" class="add-module-div">
					<c:url value="/dashboard/${course.courseId}/addModule"
						var="addModule" />
					<form method="POST" action=${addModule}>
						<div id="moduleName" class="form-group row">
							<label for="moduleName" class="col-md-2 col-form-label">Module
								Name: </label>
							<div class="col-md-8">
								<input class="form-control" type="text" name="moduleName"
									placeholder="Module Name" />
							</div>
						</div>
						<div id="moduleName" class="form-group row">
							<label for="moduleDescription" class="col-md-2 col-form-label">Module
								Description: </label>
							<div class="col-md-8">
								<input class="form-control" type="text" name="moduleDescription"
									placeholder="Module Description" />
							</div>
						</div>
						<input class="formSubmitButton" type="submit" value="Add Module" />
					</form>
				</div>
				<!-- #addModule -->
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