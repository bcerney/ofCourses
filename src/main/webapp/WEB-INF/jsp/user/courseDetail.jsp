<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />



	<div id="dashboardDiv" class="container-fluid">
		<div class="row">
			<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
				<ul class="nav sidebar-nav">
					<c:url value="/dashboard/${course.courseId}/addModule" var="addModule"/>
					<li><a href="${addModule}">Add Module</a></li>
					<li>Add Lesson</li>
					<li>Add Resources</li>
				</ul>
				<ul class="nav sidebar-nav">
					<c:url value="/dashboard" var="dashboard"/>
					<li><a href="${dashboard}">My Courses</a></li>
				</ul>
			</div>
			<!-- dashSidebar -->

			<div id="dashMain" class="col-sm-9 col-md-10">
				<h1 class="page-header"><c:out value="${course.name}"/></h1>

				<%-- <div class="courseDetail">
					<c:url var="formAction" value="/courseDetail" />

					
						<h2>${course.name}</h2>

						<div>
							<label for="courseModule">Course Module 1</label> <input
								type="text" name="courseModule" placeholder="Course Module" />
						</div>

						<div class="courseModule">
							<label for="courseModule">Course Module 2</label> <input
								type="text" name="courseModule" placeholder="Course Module" />
						</div>

						<div class="courseModule">
							<label for="courseModule">Course Module 3</label> <input
								type="text" name="courseModule" placeholder="Course Module" />
						</div>


				</div> --%>

			</div>
			<!-- dashMain -->
		</div>
		<!-- row -->
	</div>
	<!-- dashboardDiv -->
</body>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
</html>











