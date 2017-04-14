<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />


	<div id="dashboardDiv" class="container-fluid">
		<div class="row">
			<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
				<ul class="nav sidebar-nav">
					<c:url value="/dashboard" var="dashboard"/>
					<li><a href="${dashboard}">Dashboard</a></li>
				</ul>
			</div>
			<!-- dashSidebar -->

			<div id="dashMain" class="col-sm-9 col-md-10">
				<h1 class="page-header"><c:out value="${module.name}"/></h1>

				<c:if test="${currentUser.userType == 'teacher'}">
					<c:url var="addLessonHref" value="/dashboard/${course.courseId}/${module.moduleId}/addLesson"/>
					<a id="detailPageLink" href= "${addLessonHref}"><button type="submit" class="btn btn-default">Add Lesson</button></a>							
					
				</c:if>
				
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











