
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

			<p>Welcome, <c:out value="${currentUser.firstName}"/></p>
			<h1 class="page-header">
				Your Courses
			</h1>

			<div id="courses">
				<c:forEach var="course" items="${teacherCourses}">
				<h3>${course.name}</h3>
<%-- 					<p>Subject: ${course.subject}</p>
					<p>Level: ${course.difficulty}</p>
					<p>Capacity: ${course.capacity}</p>
					<p>${course.description}</p>
					<p>Start Date: ${course.startDate}</p>
					<p>End Date: ${course.endDate}</p>
					<p>Cost: $${course.fee}</p> --%>
					
					<c:url value="/dashboard/${course.courseId}" var="courseDetail">
						<%-- <c:param name="courseId" value="${course.courseId}"/> --%>
					</c:url>
					<a id="courseDetailBtn" class="btn btn-primary" href="${courseDetail}">Go To Course</a>
				</c:forEach>
			</div>
		</div>
		<!-- dashMain -->

	</div>
	<!-- row -->

</div>
<!-- dashboardDiv -->





<c:import url="/WEB-INF/jsp/common/footer.jsp" />