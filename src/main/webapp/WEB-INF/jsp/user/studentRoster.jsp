<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />

<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
				<c:url value="/dashboard" var="dashboard" />
				<li><a class="link" href="${dashboard}">Dashboard</a></li>
				<c:url value="/courseCatalog" var="catalog" />
				<li><a class="link" href="${catalog}">Course Catalog</a></li>
				<c:url value="/dashboard/createCourse" var="createCourse" />
				<li><a class="link" href="${createCourse}">Create Course</a></li>
			</ul>
		</div>

		<div id="dashMain" class="col-sm-7 col-md-9">

			<h1 class="page-header">
				Roster |
				<c:out value="${course.name}" />
			</h1>

			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>Student Name</th>
							<th>Assignments</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="student" items="${roster}">

							<tr>
								<td><c:out value="${student.firstName} ${student.lastName}"/></td>
								<c:url var="studentHref" value="/dashboard/${course.courseId}/roster/${student.userId}" />
								<td><a class="btn btn-success" href="${studentHref}">See Assignments</a></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
		
		<div class="col-sm-2 col-md-1">
		</div>
	</div>
</div>
</body>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
</html>
