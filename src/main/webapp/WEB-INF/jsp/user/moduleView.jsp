<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />


	<div id="dashboardDiv" class="container-fluid">
		<div class="row">
			<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
				<ul class="nav sidebar-nav">
					<c:url value="/dashboard" var="dashboard"/>
					<li><a href="${dashboard}">My Courses</a></li>
				</ul>
			</div>
			<!-- dashSidebar -->

			<div id="dashMain" class="col-sm-9 col-md-10">
				<h1 class="page-header"><c:out value="${module.name}"/></h1>

					<c:url var="addLessonHref" value="/dashboard/${course.courseId}/${module.moduleId}/addLesson"/>
					<a id="detailPageLink" href= "${addLessonHref}">Add Lesson</a>							
				
				<c:forEach var="lesson" items="${allLessons}">
					<div class="moduleLesson">
						<h2>${lesson.name}</h2>
						<p>${lesson.description}</p>
					</div>
					
				</c:forEach>
				
			</div>
			<!-- dashMain -->
		</div>
		<!-- row -->
	</div>
	<!-- dashboardDiv -->
</body>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
</html>











