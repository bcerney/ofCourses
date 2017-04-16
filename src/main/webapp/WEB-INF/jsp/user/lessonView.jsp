<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />


	<div id="dashboardDiv" class="container-fluid">
		<div class="row">
			<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
				<ul class="nav sidebar-nav">
					<c:url value="/dashboard" var="dashboard"/>
					<li><a href="${dashboard}">Dashboard</a></li>
					<c:url value="/dashboard/${course.courseId}/${module.moduleId}"
					var="addModule" />
					<li><a href="${addModule}">Back to Module</a></li>
					
					<c:if test="${currentUser.userType == 'teacher'}">
					<li>
					<c:url var="addResourceHref" value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}/addResource"/>
					<a id="detailPageLink" href= "${addResourceHref}">Add Resource</a>							
					</li>
					<li>
					<c:url var="addAssignmentHref" value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}/addAssignment"/>
					<a id="detailPageLink" href= "${addAssignmentHref}">Add Assignment</a>							
					</li>
					</c:if>	
				</ul>
			

			</div>
			<!-- dashSidebar -->

			<div id="dashMain" class="col-sm-9 col-md-10">
				<h1 class="page-header">LESSON: <c:out value="${lesson.name}"/></h1>

				<h4><c:out value="${lesson.description}"/></h4>
				
				<h2 class="page-header">Resources</h2>
				<c:forEach var="resource" items="${allResources}">
					<div class="lessonResource">

<!--					<c:url var="resourceHref" value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}"/>   -->
<!--					<h2><a href="${lessonHref}">${loop.index+1}. ${lesson.name}</a></h2>   -->
					
					<a href="${resource.url}"><h3>${resource.title}</h3></a>				
					<p>${resource.description}</p>
					<%-- <p>${resource.url}</p> --%>
					</div>
				</c:forEach>

				<h2 class="page-header">Assignments</h2>

				<c:forEach var="assignment" items="${allAssignments}" varStatus="loop">
					<div class="lessonAssignment">
						
				<c:url var="resourceHref" value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}"/>
					<h3>${loop.index+1}: ${assignment.name}</h3>					
					<p>${assignment.description}</p>
					<p>Due: ${assignment.dueDate}</p>
					<p>Total Points: ${assignment.maxScore}</p>
	
					<c:choose>

						<c:when test="${1 == 2}"> <!-- already been submitted -->
						Assignment was submitted on:
						</c:when>

						<c:otherwise> <!-- not yet submitted -->
						
 							<c:choose>
								<c:when test="${1 == 1}">
									Assignment is Past Due!
								</c:when>
								
								<c:when test="${1 == 1}">
									Assignment is Due Today!	
								</c:when>
								
								<c:when test="${1 == 1}">
									Assignment is Due Tomorrow!	
								</c:when>
								
								<c:otherwise>
									Assignment is Due in # Days								
								</c:otherwise>
							</c:choose>
							
							<c:url
								value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}"
								var="submitAssignment" />
							<form method="POST" action="${submitAssignment}">
							
								<div id="assignmentSubmission" class="form-group row">
<!--									<label for="assignmentSubmission" class="col-md-2 col-form-label">Your Response: </label>   -->
									<div class="col-md-8">
										<input class="form-control" type="text" name="assignmentSubmission"
											placeholder="Write Your Response Here" />
									</div>
								</div>
								
<!-- 								<div id="assignmentFeedback" class="form-group row">
									<label for="assignmentFeedback" class="col-md-2 col-form-label">Feedback: </label>
									<div class="col-md-8">
										<input class="form-control" type="text" name="assignmentFeedback"
										placeholder="Provide Feedback Here" />
									</div>
								</div> -->
								
								<input class="formSubmitButton" type="submit" value="Submit Assignment ${loop.index+1}" />
							</form>
						
						</c:otherwise>





					</c:choose>
									

					
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











