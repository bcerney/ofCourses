<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />

<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
			<c:url value="/dashboard" var="dashboard"/>
					<li><a id="dashboardLink" href="${dashboard}">Dashboard</a></li>
				<c:url value="/courseCatalog" var="catalog"/>
				<li>
					<a href="${catalog}">Course Catalog</a>
				</li>
				<c:url value="/dashboard/createCourse" var="createCourse" />
				<li><a href="${createCourse}">Create Course</a></li>
				<li></li>
			</ul>
		</div>
		
		<c:forEach var="student" items="${roster}">

		<div class = "studentRoster"> 
			<c:url var="studentHref" value="/dashboard/${course.courseId}/roster/${student.userId}"/>
		<a id="studentPageLink" href= "${studentHref}">${student.firstName} ${student.lastName}</a></div>
		
		</c:forEach>


</body>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
</html>
