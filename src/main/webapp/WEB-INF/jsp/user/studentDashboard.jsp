<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />

<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
				<c:url value="/dashboard" var="dashboard"/>
				<li>
					<a href="${dashboard}">Dashboard</a>
				</li>
				<%-- <c:url value="/dashboard/progress" var="progress"/>
				<li>
					<a href="${progress}">Course Progress</a>
				</li> --%>
				<c:url value="/courseCatalog" var="catalog"/>
				<li>
					<a href="${catalog}">Course Catalog</a>
				</li>
			</ul>
		</div>
		<!-- dashSidebar -->


		<div id="dashMain" class="col-sm-9 col-md-10">
			<h1 class="page-header">
				<c:out value="${currentUser.firstName}"/>'s Courses
			</h1>

			<div id= "courses">
			<c:forEach var="course" items="${studentsCourses}">
				<c:url var="courseDetailHref" value="/dashboard/${course.courseId}"/>
				<h3><a id="detailPageLink" href= "${courseDetailHref}">${course.name}</a></h3>
  				<c:url value="/dashboard/${course.courseId}/${currentUser.userId}/progress" var="currentProgress"/>
  				<p><a href="${currentProgress}">Current Progress</a></p>
				<%--	<p>Subject: ${course.subject}</p>
					<p>Level: ${course.difficulty}</p>
					<p>${course.description}</p>
					<p>Start Date: ${course.startDate}</p>
					<p>End Date: ${course.endDate}</p> --%>


					<!-- TODO: have this navigate to student view of course -->
			</c:forEach>
		</div>
		</div>
		<!-- dashMain -->

	</div>
	<!-- row -->

</div>
<!-- dashboardDiv -->





<c:import url="/WEB-INF/jsp/common/footer.jsp" />