<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />

<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
				<c:url value="/dashboard" var="dashboard" />
				<li><a class="link" href="${dashboard}">Dashboard</a></li>
				<%-- 				<c:url value="/user/courseCatalog" var="catalog"/>
				<li>
					<a href="${catalog}">Course Catalog</a>
				</li> --%>
				<li></li>
			</ul>
		</div>
		<!-- dashSidebar -->


		<div id="dashMain" class="col-sm-9 col-md-10">
			<h1 class="page-header">Course Catalog</h1>
			<!-- <div id="exampleCourse" class="dashboard-course-div">
				
			</div> -->
			<div id="courses">
				<h2>Launched Courses  <span class="glyphicon glyphicon-plane"></span></h2>
				<c:forEach var="course" items="${allCourses}">

					<c:if test="${currentUser.userType == 'student'}">

						<c:if test="${course.active}">

							<h3>
								<c:out value="${course.name}" />
							</h3>
							<p>
								<strong>Instructor: </strong>
								<c:out value="${course.teacherFullName}" />
							</p>
							<p>
								<strong>Subject: </strong>
								<c:out value="${course.subject}" />
							</p>
							<p>
								<strong>Level: </strong>
								<c:out value="${course.difficulty}" />
							</p>
							<p>
								<strong>Capacity: </strong>
								<c:out value="${course.capacity}" />
							</p>
							<p class="viewMaxWidth">
								<c:out value="${course.description}" />
							</p>
							<p>
								<strong>Start Date: </strong>
								<c:out value="${course.startDate}" />
							</p>
							<p>
								<strong>End Date: </strong>
								<c:out value="${course.endDate}" />
							</p>
							<p>
								<strong>Cost: </strong>$
								<c:out value="${course.fee}" />
							</p>
							<c:url var="courseDetailHref"
								value="dashboard/${course.courseId}" />


							<c:url var="formAction" value="/courseCatalog">
								<c:param name="courseId" value="${course.courseId}" />
							</c:url>
							<form method="POST" action="${formAction}">
								<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
								<input type="submit" class="btn btn-success" value="Enroll Now" />
							</form>
						</c:if>


					</c:if>
					</c:forEach>
					

					<h2>Upcoming Courses <span class="glyphicon glyphicon-time"></span></h2>
				<c:forEach var="course" items="${allCourses}">

					<c:if test="${currentUser.userType == 'student'}">

						<c:if test="${!course.active}">

							<h3>
								<c:out value="${course.name}" />
							</h3>
							<p>
								<strong>Instructor: </strong>
								<c:out value="${course.teacherFullName}" />
							</p>
							<p>
								<strong>Subject: </strong>
								<c:out value="${course.subject}" />
							</p>
							<p>
								<strong>Level: </strong>
								<c:out value="${course.difficulty}" />
							</p>
							<p>
								<strong>Capacity: </strong>
								<c:out value="${course.capacity}" />
							</p>
							<p class="viewMaxWidth">
								<c:out value="${course.description}" />
							</p>
							<p>
								<strong>Start Date: </strong>
								<c:out value="${course.startDate}" />
							</p>
							<p>
								<strong>End Date: </strong>
								<c:out value="${course.endDate}" />
							</p>
							<p>
								<strong>Cost: </strong>$
								<c:out value="${course.fee}" />
							</p>
							<c:url var="courseDetailHref"
								value="dashboard/${course.courseId}" />


							
						</c:if>


					</c:if>

					<%-- <c:if test="${currentUser.userType == 'student'}">
 					<c:choose>
						<c:when test="${course.active}">
		 					<c:url var="formAction" value="/courseCatalog">
								<c:param name="courseId" value="${course.courseId}" />
							</c:url>
							<form method="POST" action="${formAction}">
							<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
								<input type="submit" class="btn btn-success" value="Enroll Now" />
							</form>
						</c:when>
						
						<c:otherwise>
							<p>COMING SOON!!!</p>
						</c:otherwise>
					
					</c:choose>
					
				</c:if> --%>

				</c:forEach>
			</div>
		</div>
		<!-- dashMain -->

	</div>
	<!-- row -->

</div>
<!-- dashboardDiv -->





<c:import url="/WEB-INF/jsp/common/footer.jsp" />