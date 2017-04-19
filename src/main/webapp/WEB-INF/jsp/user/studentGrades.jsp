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
		
			<div class = "assignments">
		<h2>${user.firstName} ${user.lastName}</h2>
		<h4>${course.name}</h4>
		
	<%-- 
		<div id = "nameColumn"><c:forEach var="assignment" items="${assignments}">
		Assignment: ${assignment.name}<br></c:forEach></div>
		<div id = "gradeColumn"><c:forEach var="grade" items="${studentGrades}">
		</c:forEach></div>
		 --%>


		<h3>Graded Assignments</h3>
		<c:forEach var="hw" items="${submissions}">
			<%-- <p>${hw.studentAssignment.score}</p>
			<p>${hw.assignment.name}</p> --%>
			<c:choose>
				<c:when test="${hw.studentAssignment.score != -1}">
				<p>Assignment: ${hw.assignment.name} </p> <br> 
				<p>Grade: ${hw.studentAssignment.score} </p><br>
				</c:when>
			</c:choose>
		</c:forEach>

		<h3>Submitted Assignments</h3>
		<c:forEach var="hw" items="${submissions}">
		<c:choose> 
		<c:when test="${hw.studentAssignment.submitted == true && hw.studentAssignment.score == -1}">

	 	<p> Assignment: ${hw.assignment.name}</p> <br>
		<p>Submission Text: ${hw.studentAssignment.submissionText}</p><br>
		<form method= "POST" action="">
		<p><label for= "assignmentGrade">Grade:</label></p>
		<input class = "form-control" type="text" name="assignmentGrade"/>
		<input type= "hidden" name= "assignmentId" value = "${hw.assignment.assignmentId}"/>
		<input class="btn btn-success" type="submit" value="Submit Grade"/>
		</form>
		
		</c:when>
		</c:choose>
		</c:forEach>
		
		<h3>Non-Submitted Assignments</h3>
		<c:forEach var = "hw" items= "${submissions}">
		<c:choose>
		<c:when test = "${hw.studentAssignment.score == -1}">
		<p>Assignment: ${hw.assignment.name} </p><br> <p> <strong>Due Date:</strong> ${hw.assignment.dueDate}</p><br>
		</c:when>
		</c:choose>
		</c:forEach>
</div>
</body>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
</html>
