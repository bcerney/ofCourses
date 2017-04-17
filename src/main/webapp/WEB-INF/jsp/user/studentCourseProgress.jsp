<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />

<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
				<c:url value="/dashboard" var="dashboard" />
				<li><a href="${dashboard}">Dashboard</a></li>
				<%-- <c:url value="/dashboard/progress" var="progress"/>
				<li>
					<a href="${progress}">Course Progress</a>
				</li> --%>
				<c:url value="/courseCatalog" var="catalog" />
				<li><a href="${catalog}">Course Catalog</a></li>
			</ul>
		</div>
		<!-- dashSidebar -->


		<div id="dashMain" class="col-sm-9 col-md-10">
			<h1 class="page-header">
				<c:out value="${currentUser.firstName}" />'s Assignments
			</h1>

			<div id="assignments">
				<div id="gradedAssignments">
				<h2>Graded Assignments</h2>
				<c:forEach var="submission" items="${submissions}">
					<c:if test="${submission.studentAssignment.isSubmitted && submission.studentAssignment.score > 0}">
					
					<p>${submission.assignment.name}</p>
					<p>${submission.lesson.name}</p>
					<p>${submission.studentAssignment.score}</p>

					<%--  					<p>PROGRESS (GRADE) HERE</p>
					<p>Subject: ${course.subject}</p>
					<p>Level: ${course.difficulty}</p>
					<p>${course.description}</p>
					<p>Start Date: ${course.startDate}</p>
					<p>End Date: ${course.endDate}</p> --%>

					</c:if>
					<!-- TODO: have this navigate to student view of course -->
				</c:forEach>
				</div>
				<!-- #gradedAssignments -->
			</div>
			<!-- #assignments -->
		</div>
		<!-- dashMain -->

	</div>
	<!-- row -->

</div>
<!-- dashboardDiv -->





<c:import url="/WEB-INF/jsp/common/footer.jsp" />