<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />

	<div id="dashboardDiv" class="container-fluid">
		<div class="row">
			<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
				<ul class="nav sidebar-nav">
					<c:url value="/dashboard" var="dashboard"/>
					<li><a id="dashboardLink" href="${dashboard}">Dashboard</a></li>
					<c:url value="/dashboard/${course.courseId}/${module.moduleId}"
					var="addModule" />
					<li><a href="${addModule}">Back to Module</a></li>
					
					<c:if test="${currentUser.userType == 'teacher'}">
					<li>
					<c:url var="addResourceHref" value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}/addResource"/>
					<a id="addResourceLink" href= "${addResourceHref}">Add Resource</a>							
					</li>
					<li>
					<c:url var="addAssignmentHref" value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}/addAssignment"/>
					<a id="addAssignmentLink" href= "${addAssignmentHref}">Add Assignment</a>							
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
					
					<h3>${resource.title}</h3>
									
					<p>${resource.description}</p>
					
					<iframe width="420" height="315" src="${resource.embeddedUrl}"></iframe> 
					<a href="${resource.url}" target="_blank">Direct Link</a>
					</div>
				</c:forEach>

				<h2 class="page-header">Assignments</h2>

				<c:forEach var="assignment" items="${allAssignments}" varStatus="loop">
					<div id="${assignment.assignmentId}" class="lessonAssignment">
						
				<c:url var="resourceHref" value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}"/>
					<h3>${loop.index+1}: ${assignment.name}</h3>					
					<p>${assignment.description}</p>
					<p>Total Points: ${assignment.maxScore}</p>

 				<c:if test="${currentUser.userType == 'student'}">
 				
 				<c:choose>
				
					<c:when test="${studentAssignments[loop.index].submitted}">
						Assignment submitted on ${studentAssignments[loop.index].submissionDate}
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
									Assignment is Due in ${assignment.daysLeft} Days	
							</c:when>
								
 							<c:otherwise>
									Assignment is Due On ${assignment.dueDate}							
							</c:otherwise>
							
						</c:choose> 
					
						<c:url
								value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}"
								var="submitAssignment" />
							<form method="POST" action="${submitAssignment}">
							
								<div id="assignmentSubmission" class="form-group row">
<!--  								<label for="assignmentSubmission" class="col-md-2 col-form-label">Your Response: </label>   -->
									<div class="col-md-8">
										<input type="hidden" name="assignmentId" value="${assignment.assignmentId}"/>
										<input class="form-control" type="text" name="submissionText"
											placeholder="Write Your Response Here" 
											maxlength="5000" style="height: 100px"/>
									</div>
								</div>

								<input type="file" name="file" size="50" /><br/>
								
<!-- 								<div>
								<form action="UploadServlet" method="post" enctype="multipart/form-data">
								<input type="file" name="file" size="50" /><br/>
								<input type="submit" value="Upload File" />
								</form>
								</div> -->
								
								<input class="formSubmitButton" type="submit" value="Submit Assignment ${loop.index+1}"/><br><br>
								
								
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











