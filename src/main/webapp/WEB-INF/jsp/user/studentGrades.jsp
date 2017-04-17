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
		
	
		<div id = "nameColumn"><c:forEach var="assignment" items="${assignments}">
		Assignment: ${assignment.name}<br></c:forEach></div>
		<div id = "gradeColumn"><c:forEach var="grade" items="${studentGrades}">
		<c:choose>
		<c:when test="${grade.score == -1}"> Assignment Not Completed<br></c:when>
		<c:otherwise>Grade: ${grade.score}<br></c:otherwise></c:choose></c:forEach></div>
		

</body>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
</html>
