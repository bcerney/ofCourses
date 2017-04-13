<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />

<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
				<li>
					<a href="#">My Courses</a>
				</li>
				<c:url value="/courseCatalog" var="catalog"/>
				<li>
					<a href="${catalog}">Course Catalog</a>
				</li>
				<li></li>
			</ul>
		</div>
		<!-- dashSidebar -->


		<div id="dashMain" class="col-sm-9 col-md-10">
			<h1 class="page-header">My Courses</h1>
			<div id="exampleCourse" class="dashboard-course-div">
				<h2>Course Name</h2>
				<p>A description of the course.</p>
			</div>
			<div id= "courses">
			<c:forEach var="course" items="${studentsCourses}">
				<h3>${course.name}</h3>
				<p>${course.subject}</p>
				<p>${course.capacity}</p>
				<p>${course.description}</p>
				<p>${course.fee}</p>
				<p>${course.startDate}</p>
				<p>${course.endDate}</p>
				<p>${course.difficulty}</p>	
				<c:url var="courseDetailHref" value="/courseDetail">
					<c:param name ="courseId" value="${course.courseId}"/>
					</c:url>
				<a id="detailPageLink" href= "${courseDetailHref}">Get More Info!</a>	
			</c:forEach>
		</div>
		</div>
		<!-- dashMain -->

	</div>
	<!-- row -->

</div>
<!-- dashboardDiv -->





<c:import url="/WEB-INF/jsp/common/footer.jsp" />