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
				<li><a class="link" href="#incompleteAssignments">Incomplete Assignments</a></li>
				<li><a class="link" href="#submittedAssignments">Submitted Assignments</a></li>
				<li><a class="link" href="#gradedAssignments">Graded Assignments</a></li>
			</ul>
		</div>
		<!-- dashSidebar -->


		<div id="dashMain" class="col-sm-9 col-md-10">
			<h1 class="">
				Your Assignments for 
				<br>
				<c:out value="${course.name}"/>
			</h1>
			
			<h2>Current Grade: 
				<c:choose>
					<c:when test="${currentGrade == -1 }">
						n/a
					</c:when>
					<c:otherwise>
						<c:out value="${currentGrade}"/>
					</c:otherwise>
				</c:choose>
			</h2>

			<div id="assignments">
				<div id="incompleteAssignments">
					<h2 class="page-header">Incomplete Assignments</h2>
					<c:forEach var="submission" items="${submissions}">
						<c:if
							test="${!submission.studentAssignment.submitted}">
						<div class="incomplete-assignment-div">
							<h3><c:out value="${submission.assignment.name}"/></h3>
							
							<c:url value="/dashboard/${courseId}/${submission.lesson.moduleId}/${submission.lesson.lessonId}" var="lessonHref"/>
							<p><strong>Lesson: </strong><a href="${lessonHref}"><c:out value="${submission.lesson.name}"/></a></p>
							<p><c:out value="${submission.assignment.description}"/></p>
							<p><strong>Max Score: </strong><c:out value="${submission.assignment.maxScore}"/></p>
							<p><strong>Due Date: </strong><c:out value="${submission.assignment.dueDate}"/></p>
							
							<c:url value="/dashboard/${courseId}/${submission.lesson.moduleId}/${submission.lesson.lessonId}#${submission.assignment.assignmentId}" var="assignmentsHref"/>
							<a href="${assignmentsHref}" class="btn btn-success">Go To Assignment</a>
							

						</div>
						</c:if>
						<!-- TODO: have this navigate to student view of course -->
					</c:forEach>
				</div>
				<!-- #incompleteAssignments -->


				<div id="submittedAssignments">
					<h2 class="page-header">Submitted Assignments</h2>
					<c:forEach var="submission" items="${submissions}">
						<c:if
							test="${(submission.studentAssignment.submitted) && (submission.studentAssignment.score == -1)}">

							<h4><c:out value="${submission.assignment.name}"/></h4>
							<c:url value="/dashboard/${courseId}/${submission.lesson.moduleId}/${submission.lesson.lessonId}" var="lessonHref"/>
							<p><strong>Lesson: </strong><a href="${lessonHref}"><c:out value="${submission.lesson.name}"/></a></p>
							<p><strong>Submission: </strong><c:out value="${submission.studentAssignment.submissionText}"/></p>
							<p><strong>Submitted on: </strong><c:out value="${submission.studentAssignment.submissionDate}"/></p>
							

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
				<!-- #submittedAssignments -->

				<div id="gradedAssignments">
					<h2 class="page-header">Graded Assignments</h2>
					<c:forEach var="submission" items="${submissions}">
						<c:if
							test="${(submission.studentAssignment.submitted) && (submission.studentAssignment.score > -1)}">

							<h4><c:out value="${submission.assignment.name}"/></h4>
							<c:url value="/dashboard/${courseId}/${submission.lesson.moduleId}/${submission.lesson.lessonId}" var="lessonHref"/>
							<p><strong>Lesson: </strong><a href="${lessonHref}"><c:out value="${submission.lesson.name}"/></a></p>
							<p><strong>Submission: </strong><c:out value="${submission.studentAssignment.submissionText}"/></p>
							<p><strong>Submitted on: </strong><c:out value="${submission.studentAssignment.submissionDate}"/></p>
							<p><strong>Score: </strong><c:out value="${submission.studentAssignment.score}/${submission.assignment.maxScore}"/></p>
							

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