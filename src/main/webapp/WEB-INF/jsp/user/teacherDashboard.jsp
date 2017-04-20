
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />

<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
			<c:url value="/dashboard" var="dashboard"/>
				<li><a class="link" href="${dashboard}">Dashboard</a></li>
				<c:url value="/courseCatalog" var="catalog"/>
				<li>
					<a class="link" href="${catalog}">Course Catalog</a>
				</li>
				<c:url value="/dashboard/createCourse" var="createCourse" />
				<li><a class="link" href="${createCourse}">Create Course</a></li>
				<li></li>
			</ul>
		</div>
		<!-- dashSidebar -->


		<div id="dashMain" class="col-sm-9 col-md-10">

			<h1 class="page-header">
				Your Courses
			</h1>

			<div id="courses">
				<c:forEach var="course" items="${teacherCourses}">
					<c:url value="/dashboard/${course.courseId}" var="courseDetailHref">
					</c:url>

<%-- 					<p>Subject: ${course.subject}</p>
					<p>Level: ${course.difficulty}</p>
					<p>Capacity: ${course.capacity}</p>
					<p>${course.description}</p>
					<p>Start Date: ${course.startDate}</p>
					<p>End Date: ${course.endDate}</p>
					<p>Cost: $${course.fee}</p> --%>
					
<%--  					<c:url var="formAction" value="/dashboard/${course.courseId}"/>
					<form method="POST" action="${formAction}">
						<c:choose>
							<c:when test="${course.active}">
								<input type="submit" class="btn btn-success" value="Close Course" />
							</c:when>
							
							<c:otherwise>
								<input type="submit" class="btn btn-success" value="Launch Course" />
							</c:otherwise>
						</c:choose>
						
					</form> --%>

				<h3><a class="link" href= "${courseDetailHref}"><c:out value="${course.name}"/></a></h3>

					
				</c:forEach>
			</div>
		</div>
		<!-- dashMain -->

	</div>
	<!-- row -->

</div>
<!-- dashboardDiv -->





<c:import url="/WEB-INF/jsp/common/footer.jsp" />