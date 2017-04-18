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
				
			</ul>
		</div>
</div>
</div>		
		<c:forEach var="student" items="${roster}">

		<div class = "studentRoster"> <ul>
			<c:url var="studentHref" value="/dashboard/${course.courseId}/roster/${student.userId}"/>
		<li><a class="link" href= "${studentHref}">${student.firstName} ${student.lastName}</a></li>
		</ul>
		</div>
		</c:forEach>


</body>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
</html>
