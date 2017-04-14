<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />



	<div id="dashboardDiv" class="container-fluid">
		<div class="row">
			<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
				<ul class="nav sidebar-nav">
					<c:url value="/dashboard" var="dashboard"/>
					<li><a href="${dashboard}">Dashboard</a></li>
				</ul>
				<ul class="nav sidebar-nav">
					<c:url value="/dashboard/${course.courseId}/addModule" var="addModule"/>
					<li><a href="${addModule}">Add Module</a></li>
					<li>Add Lesson</li>
					<li>Add Resources</li>
				</ul>
				
			</div>
			<!-- dashSidebar -->

			<div id="dashMain" class="col-sm-9 col-md-10">
				<h1 class="page-header"><c:out value="${course.name}"/></h1>

							
				<div class="courseDetail">
					<c:url var="formAction" value="/courseDetail" />

					
						<h2>${course.name}</h2>
						<p>${course.subject}</p>
						<p>${course.capacity}</p>
						<p>${course.description}</p>
						<p>${course.fee}</p>
						<p>${course.startDate}</p>
						<p>${course.endDate}</p>
						<p>${course.difficulty}</p>	
					<h3>Available Modules</h3>
					
					<c:forEach var = "module" items = "${modules}" >
					<div class = "courseModule">
						<c:url var="moduleHref" value="/dashboard/${course.courseId}/${module.moduleId}"/>
				<a id="detailPageLink" href= "${moduleHref}">${module.name}</a> </div>
					
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











