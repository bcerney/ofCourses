<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />

	<div id="dashboardDiv" class="container-fluid">
		<div class="row">
			<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
				<ul class="nav sidebar-nav">
					<c:url value="/dashboard" var="dashboard"/>
					<li><a class="link" href="${dashboard}">Dashboard</a></li>
					<c:url value="/dashboard/${course.courseId}/${module.moduleId}"
					var="addModule" />
					<li><a class="link" href="${addModule}">Back to Module</a></li>
					
					<c:if test="${currentUser.userType == 'teacher'}">
					<li>
					<c:url var="addResourceHref" value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}/addResource"/>
					<a class="link" href= "${addResourceHref}">Add Resource</a>							
					</li>
					<li>
					<c:url var="addAssignmentHref" value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}/addAssignment"/>
					<a class="link" href= "${addAssignmentHref}">Add Assignment</a>							
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
					
					
				<c:choose>
					<c:when test="${fn:containsIgnoreCase(resource.url, 'youtube')}">									
						<iframe width="640" height="360" src="${resource.embeddedUrl}" allowfullscreen="allowfullscreen" mozallowfullscreen="mozallowfullscreen"></iframe> 
					</c:when> 
								
					<c:otherwise>
						<h3><a class="link" href="${resource.url}" target="_blank">${resource.title}</a></h3>
					</c:otherwise>
					
				</c:choose>
				
					<p><c:out value="${resource.description}"/></p>
					<br>
				
					</div>
				</c:forEach>

				<h2 class="page-header">Assignments</h2>

				<c:forEach var="assignment" items="${allAssignments}" varStatus="loop">
					<div id="${assignment.assignmentId}" class="lessonAssignment">
						
				<c:url var="resourceHref" value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}"/>
					<h3>${loop.index+1}: <c:out value="${assignment.name}"/></h3>					
					<p><c:out value="${assignment.description}"/></p>
					<p>Total Points: <c:out value="${assignment.maxScore}"/></p>

 				<c:if test="${currentUser.userType == 'student'}">
 				
 				<c:choose>
				
					<c:when test="${studentAssignments[loop.index].submitted}">
						<p><em>Assignment submitted on <c:out value="${studentAssignments[loop.index].submissionDate}"/>.</em></p>
						<p><strong> YOUR RESPONSE BELOW:</strong><p>
						<p><c:out value="${studentAssignments[loop.index].submissionText}"/></p>
					</c:when>

										
					<c:otherwise>
										
					 	<c:choose>
							<c:when test="${assignment.daysLeft == -1}">
									Assignment is Past Due!
							</c:when>
								
							<c:when test="${assignment.daysLeft == 0}">
									Assignment is Due Today!	
							</c:when>
								
							<c:when test="${assignment.daysLeft == 1}">
									Assignment is Due Tomorrow!	
							</c:when>
								
							<c:when test="${assignment.daysLeft > 1 && assignment.daysLeft < 7}">
									Assignment is Due in <c:out value="${assignment.daysLeft}"/> Days	
							</c:when>
								
 							<c:otherwise>
									Assignment is Due On <c:out value="${assignment.dueDate}"/>							
							</c:otherwise>
							
						</c:choose> 
					
						<c:url
								value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}"
								var="submitAssignment" />
							<form method="POST" action="${submitAssignment}">
							<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
							
								<div id="assignmentSubmission" class="form-group row">
<!--  								<label for="assignmentSubmission" class="col-md-2 col-form-label">Your Response: </label>   -->
									<div class="col-md-8">
										<input type="hidden" name="assignmentId" value="${assignment.assignmentId}"/>
										<textarea cols="6" rows="5" class="form-control" name="submissionText"
											placeholder="Write Your Response Here" 
											maxlength="5000" > </textarea>
									</div>
								</div>

								<input class="btn btn-success" type="file" name="file-upload" size="10000000" /><br/>
								
<!-- 								<div>
								<form action="UploadServlet" method="post" enctype="multipart/form-data">
								<input type="file" name="file" size="50" /><br/>
								<input type="submit" value="Upload File" />
								</form>
								</div> -->
								
								<input class="btn btn-success" type="submit" value="Submit Assignment ${loop.index+1}"/><br><br>
								
								
<!-- 								<div id="assignmentFeedback" class="form-group row">
									<label for="assignmentFeedback" class="col-md-2 col-form-label">Feedback: </label>
									<div class="col-md-8">
										<input class="form-control" type="text" name="assignmentFeedback"
										placeholder="Provide Feedback Here" />
									</div>
								</div> -->
								
							</form>
					
					
					</c:otherwise>

				</c:choose>
				</c:if>				

					
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











