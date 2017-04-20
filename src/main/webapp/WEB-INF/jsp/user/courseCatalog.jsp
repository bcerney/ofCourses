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
				<c:forEach var="course" items="${allCourses}">
					<h3><c:out value = "${course.name}"/></h3>
					<p>Instructor: <c:out value = "${course.teacherFullName}"/></p>
					<p>Subject: <c:out value = "${course.subject}"/></p>
					<p>Level: <c:out value = "${course.difficulty}"/></p>
					<p>Capacity: <c:out value = "${course.capacity}"/></p>
					<p><c:out value = "${course.description}"/></p>
					<p>Start Date: <c:out value = "${course.startDate}"/></p>
					<p>End Date: <c:out value = "${course.endDate}"/></p>
					<p>Cost: $<c:out value = "${course.fee}"/></p>					
				 <c:url var="courseDetailHref" value="dashboard/${course.courseId}"/>
								
				<c:if test="${currentUser.userType == 'student'}">
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
					
				</c:if>
				
				</c:forEach>
			</div>
		</div>
		<!-- dashMain -->

	</div>
	<!-- row -->

</div>
<!-- dashboardDiv -->





<c:import url="/WEB-INF/jsp/common/footer.jsp" />