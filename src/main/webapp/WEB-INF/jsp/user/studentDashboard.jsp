<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />

<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
				<c:url value="/dashboard" var="dashboard"/>
				<li>
					<a class="link" href="${dashboard}">Dashboard</a>
				</li>
				<%-- <c:url value="/dashboard/progress" var="progress"/>
				<li>
					<a href="${progress}">Course Progress</a>
				</li> --%>
				<c:url value="/courseCatalog" var="catalog"/>
				<li>
					<a class="link" href="${catalog}">Course Catalog</a>
				</li>
			</ul>
		</div>
		<!-- dashSidebar -->


		<div id="dashMain" class="col-sm-9 col-md-10">
			<h1 class="page-header">
				Your Courses
			</h1>

			<div id= "courses">
			<c:forEach var="course" items="${studentsCourses}">
				<c:url var="courseDetailHref" value="/dashboard/${course.courseId}"/>
				<h3><a class="link" href= "${courseDetailHref}"><c:out value="${course.name}"/></a></h3>
  				<c:url value="/dashboard/${course.courseId}/${currentUser.userId}/progress" var="currentProgress"/>
  				<p><a class="btn btn-success" href="${currentProgress}">Current Progress</a></p>

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