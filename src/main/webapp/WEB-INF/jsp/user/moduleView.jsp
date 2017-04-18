<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />


	<div id="dashboardDiv" class="container-fluid">
		<div class="row">
			<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
				<ul class="nav sidebar-nav">
					<c:url value="/dashboard" var="dashboard"/>
					<li><a class="link" href="${dashboard}">Dashboard</a></li>
					<c:url value="/dashboard/${course.courseId}"
					var="addModule" />
					<li><a class="link" href="${addModule}">Back to Course</a></li>
					
					<c:if test="${currentUser.userType == 'teacher'}">
					<li>
					<c:url var="addLessonHref" value="/dashboard/${course.courseId}/${module.moduleId}/addLesson"/>
					<a class="link" href= "${addLessonHref}">Add Lesson</a>							
					</li>
					</c:if>
					
					
					
				</ul>
				
				
				
			</div>
			<!-- dashSidebar -->

			<div id="dashMain" class="col-sm-9 col-md-10">
				<h1 class="page-header">MODULE: <c:out value="${module.name}"/></h1>
				
				<c:forEach var="lesson" items="${allLessons}" varStatus="loop">
					<div class="moduleLesson">
						
					<c:url var="lessonHref" value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}"/>
					<h2><a href="${lessonHref}">${loop.index+1}. ${lesson.name}</a></h2>
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











