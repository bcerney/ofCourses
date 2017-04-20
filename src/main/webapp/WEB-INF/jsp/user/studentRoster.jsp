<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />

<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
				<c:url value="/dashboard" var="dashboard" />
				<li><a class="link" href="${dashboard}">Dashboard</a></li>
				<c:url value="/courseCatalog" var="catalog" />
				<li><a class="link" href="${catalog}">Course Catalog</a></li>
				<c:url value="/dashboard/createCourse" var="createCourse" />
				<li><a class="link" href="${createCourse}">Create Course</a></li>
			</ul>
		</div>

		<div id="dashMain" class="col-sm-9 col-md-10">

			<c:forEach var="student" items="${roster}">

				<ul>
					<c:url var="studentHref"
						value="/dashboard/${course.courseId}/roster/${student.userId}" />
					<li><a class="link" href="${studentHref}"><c:out value="${student.firstName}"/>
							<c:out value="${student.lastName}"/></a></li>
				</ul>

			</c:forEach>

		</div>
	</div>
</div>
</body>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
</html>
