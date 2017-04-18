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
		
		<h3>${user.firstName} ${user.lastName}</h3>
		<h4>${course.name}</h4>
		
	<%-- 
		<div id = "nameColumn"><c:forEach var="assignment" items="${assignments}">
		Assignment: ${assignment.name}<br></c:forEach></div>
		<div id = "gradeColumn"><c:forEach var="grade" items="${studentGrades}">
		</c:forEach></div>
		 --%>


		<h2>Graded Assignments</h2>
		<c:forEach var="hw" items="${submissions}">
			<%-- <p>${hw.studentAssignment.score}</p>
			<p>${hw.assignment.name}</p> --%>
			<c:choose>
				<c:when test="${hw.studentAssignment.score != -1}">
				Assignment: ${hw.assignment.name} Grade: ${hw.studentAssignment.score}<br>
				</c:when>
			</c:choose>
		</c:forEach>

		<h2>Submitted Assignments</h2>
		<c:forEach var="hw" items="${submissions}">
		<c:choose> 
		<c:when test="${hw.studentAssignment.submitted == true && hw.studentAssignment.score == -1}">

	 	Assignment: ${hw.assignment.name}<br>
		Submission Text: ${hw.studentAssignment.submissionText}<br>
		<form method= "POST" action="">
		<label for= "assignmentGrade">Grade:</label>
		<input class = "form-control" type="text" name="assignmentGrade"/>
		<input type= "hidden" name= "assignmentId" value = "${hw.assignment.assignmentId}"/>
		<input class="formSubmitButton" type="submit" value="Submit Grade"/>
		</form>
		
		</c:when>
		</c:choose>
		</c:forEach>
		
		<h2>Non-Submitted Assignments</h2>
		<c:forEach var = "hw" items= "${submissions}">
		<c:choose>
		<c:when test = "${hw.studentAssignment.score == -1}">
		Assignment: ${hw.assignment.name} <strong>Due Date:</strong> ${hw.assignment.dueDate}<br>
		</c:when>
		</c:choose>
		</c:forEach>

</body>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
</html>
