<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />



	<div id="dashboardDiv" class="container-fluid">
		<div class="row">
			<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
				<ul class="nav sidebar-nav">
					<li>My Courses</li>
					<li>Course Catalog</li>
					<li>Add Module</li>
					<li>Add Lesson</li>
					<li>Resources</li>
				</ul>
			</div>
			<!-- dashSidebar -->

			<div id="dashMain" class="col-sm-9 col-md-10">
				<h1 class="page-header">My Courses</h1>
				<div id="exampleCourse" class="dashboard-course-div"></div>



				<div class="courseDetail">
					<c:url var="formAction" value="/courseDetail" />
						
						<h2>Course Name</h2>
						<br>
						<div>
							<label for="courseModule">Course Module 1</label> <input
								type="text" name="courseModule" placeholder="Course Module" />
						</div>

						<div class="courseModule">
							<label for="courseModule">Course Module 2</label> <input
								type="text" name="courseModule" placeholder="Course Module" />
						</div>

						<div class="courseModule">
							<label for="courseModule">Course Module 3</label> <input
								type="text" name="courseModule" placeholder="Course Module" />
						</div>


				</div>

			</div>
			<!-- dashMain -->
		</div>
		<!-- row -->
	</div>
	<!-- dashboardDiv -->
</body>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
</html>











