<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />



<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
				<c:url value="/dashboard" var="dashboard" />
				<li><a class="link" href="${dashboard}">Dashboard</a></li>

				<c:if test="${currentUser.userType == 'teacher'}">
					<c:url value="/dashboard/${course.courseId}/addModule"
						var="addModule" />
					<li><a class="link" href="${addModule}">Add Module</a></li>
					<c:url value="/dashboard/${course.courseId}/roster" var="roster" />
					<li><a class="link" href="${roster}">View Student Roster</a></li>
				</c:if>

			</ul>

		</div>
		<!-- dashSidebar -->

		<div id="dashMain" class="col-sm-9 col-md-10">
			<h1 class="page-header">
				<c:out value="${course.name}" />
			</h1>


			<div class="courseDetail">
				<c:url var="formAction" value="/courseDetail" />

				<c:if test="${currentUser.userType == 'student'}">
					<p>PROGRESS (GRADE) HERE</p>
					<p>Instructor: ${teacher.firstName} ${teacher.lastName}</p>
				</c:if>

				<p>Subject: ${course.subject}</p>
				<p>Level: ${course.difficulty}</p>
				<p>${course.description}</p>
				<p>Start Date: ${course.startDate}</p>
				<p>End Date: ${course.endDate}</p>
				<h3>Modules</h3>

				<c:forEach var="module" items="${modules}" varStatus="loop">
					<div class="courseModule">
						<c:url var="moduleHref"
							value="/dashboard/${course.courseId}/${module.moduleId}" />
						${loop.index+1}. <a class="link" href="${moduleHref}">${module.name}</a>
					</div>

				</c:forEach>



			</div>
			<!-- dashMain -->
		</div>
		<!-- row -->
	</div>
	<!-- dashboardDiv -->
	</body>
	<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</html>