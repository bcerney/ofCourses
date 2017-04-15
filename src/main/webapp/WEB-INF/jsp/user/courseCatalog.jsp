<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />

<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
				<c:url value="/dashboard" var="dashboard" />
				<li><a href="${dashboard}">Dashboard</a></li>
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
					<h3>${course.name}</h3>
					<p>Subject: ${course.subject}</p>
					<p>Level: ${course.difficulty}</p>
					<p>Capacity: ${course.capacity}</p>
					<p>${course.description}</p>
					<p>Start Date: ${course.startDate}</p>
					<p>End Date: ${course.endDate}</p>
					<p>Cost: $${course.fee}</p>
				 <c:url var="courseDetailHref" value="dashboard/${course.courseId}">
					<c:param name ="courseId" value="${course.courseId}"/>
					</c:url>
				<a id="detailPageLink" href= "${courseDetailHref}">Get More Info!</a> 	

						
					<c:url var="formAction" value="/courseCatalog">
						<c:param name="courseId" value="${course.courseId}" />
					</c:url>
					<form method="POST" action="${formAction}">
						<input type="submit" value="Enroll Today!" />
					</form>
					
				</c:forEach>
			</div>
		</div>
		<!-- dashMain -->

	</div>
	<!-- row -->

</div>
<!-- dashboardDiv -->





<c:import url="/WEB-INF/jsp/common/footer.jsp" />