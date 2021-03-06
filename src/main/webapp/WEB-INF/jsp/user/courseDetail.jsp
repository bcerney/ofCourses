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
					<!-- <p>PROGRESS (GRADE) HERE</p> -->
					<p>Instructor: <c:out value="${teacher.firstName}"/> <c:out value="${teacher.lastName}"/></p>
				</c:if>

				<p><strong>Subject: </strong><c:out value="${course.subject}"/></p>
				<p><strong>Level: </strong><c:out value="${course.difficulty}"/></p>
				<p class="viewMaxWidth"><c:out value="${course.description}"/></p>
				<p><strong>Start Date: </strong><c:out value="${course.startDate}"/></p>
				<p><strong>End Date: </strong><c:out value="${course.endDate}"/></p>

				<c:if test="${currentUser.userType == 'teacher'}">
 					<c:url var="formAction" value="/dashboard/${course.courseId}"/>
					<form method="POST" action="${formAction}">
					<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
						<c:choose>
							<c:when test="${course.active}">
								<input type="submit" class="btn btn-success" value="Close Enrollment" />
							</c:when>
							
							<c:otherwise>
								<input type="submit" class="btn btn-success" value="Launch Course" />
							</c:otherwise>
						</c:choose>
						
					</form>
				</c:if>

				<h3>Modules</h3>

				<c:forEach var="module" items="${modules}" varStatus="loop">
					<div class="courseModule">
						<c:url var="moduleHref"
							value="/dashboard/${course.courseId}/${module.moduleId}" /><h3>
						${loop.index+1}. <a class="link" href="${moduleHref}"><c:out value="${module.name}"/></a></h3>
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