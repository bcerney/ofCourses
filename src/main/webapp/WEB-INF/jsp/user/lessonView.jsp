<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />


	<div id="dashboardDiv" class="container-fluid">
		<div class="row">
			<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
				<ul class="nav sidebar-nav">
					<c:url value="/dashboard" var="dashboard"/>
					<li><a href="${dashboard}">Dashboard</a></li>



					
					<c:if test="${currentUser.userType == 'teacher'}">
					<li>
					<c:url var="addLessonHref" value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}/addAssignment"/>
					<a id="detailPageLink" href= "${addLessonHref}">Add Resource</a>							
					</li>
					<li>
					<c:url var="addLessonHref" value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}/addAssignment"/>
					<a id="detailPageLink" href= "${addLessonHref}">Add Assignment</a>							
					</li>
					</c:if>	
				</ul>
			

			</div>
			<!-- dashSidebar -->

			<div id="dashMain" class="col-sm-9 col-md-10">
				<h1 class="page-header"><c:out value="${lesson.name}"/></h1>

				<h1 class="page-header"><c:out value="${lesson.description}"/></h1>
				
				<c:url value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}/addResource" var="addResource"/>
				<a href="${addResource}" class="btn btn-primary">Add Resource</a>
				<c:url value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}/addAssignment" var="addAssignment"/>
				<a href="${addAssignment}" class="btn btn-primary">Add Assignment</a>

				
				<c:forEach var="resource" items="${allResources}" varStatus="loop">
					<div class="lessonResource">
						
<!--					<c:url var="resourceHref" value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}"/>   -->
<!--						<h2><a href="${lessonHref}">${loop.index+1}. ${lesson.name}</a></h2>   -->
					<p>${resource.title}</p>					
					<p>${resource.url}</p>
					<p>${resource.description}</p>
					<p>${resource.description}</p>
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











