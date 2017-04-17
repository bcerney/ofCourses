<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />

<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
			<c:url value="/dashboard" var="dashboard"/>
					<li><a href="${dashboard}">Dashboard</a></li>
				<c:url value="/courseCatalog" var="catalog"/>
				<li>
					<a href="${catalog}">Course Catalog</a>
				</li>
				<c:url value="/dashboard/createCourse" var="createCourse" />
				<li><a href="${createCourse}">Create Course</a></li>
				<li></li>
			</ul>
		</div>
		
		<h3>${user.firstName} ${user.lastName}</h3>
		<h4>${course.name}</h4>
		
	<%-- 
		<div id = "nameColumn"><c:forEach var="assignment" items="${assignments}">
		Assignment: ${assignment.name}<br></c:forEach></div>
		<div id = "gradeColumn"><c:forEach var="grade" items="${studentGrades}">
		</c:forEach></div>
		 --%>
		
		<c:forEach var="assignment" items="${submissions}">
		Assignment: ${assignment.assignment.name} Grade: <c:choose>
		<c:when test="${assignment.studentAssignment.score == -1}">Not Completed<br></c:when>
		<c:otherwise>Grade: ${assignment.studentAssignment.score}<br></c:otherwise></c:choose><br></c:forEach>

</body>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
</html>
