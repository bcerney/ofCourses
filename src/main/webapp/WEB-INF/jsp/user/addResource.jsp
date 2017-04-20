<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />
<script type="text/javascript">
	$(document).ready(function () {
		
		$("form").validate({
			
			rules : {
				resourceTitle : {
					required : true
				},
				resourceDescription : {
					required : true
				}
			},
			errorClass: "error"
		});
	});

</script>


<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar-div">
			<ul class="nav sidebar-nav">
				<c:url value="/dashboard" var="dashboard" />
				<li><a class="link" href="${dashboard}">Dashboard</a></li>
				<c:url value="/dashboard/${course.courseId}/${module.moduleId}"
					var="addModule" />
				<li><a class="link" href="${addModule}">Back to Module</a></li>					
			</ul>
		</div>
		<!-- dashSidebar -->

		<div id="dashMain" class="col-sm-9 col-md-10">
			<div class="container-fluid">
				<h1 class="page-header"><c:out value="${course.name} - ${module.name} -
					${lesson.name}"/> </h1>

				<div id="addResource" class="add-module-div">
					<h2>Add Resource</h2>

					<c:url
						value="/dashboard/${course.courseId}/${module.moduleId}/${lesson.lessonId}/addResource"
						var="addResource" />
					<form method="POST" action=addResource>
					<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />

						<div id="resourceTitle" class="form-group row">
							<label for="resourceTitle" class="col-md-2 col-form-label">Title:
							</label>
							<div class="col-md-8">
								<input class="form-control" type="text" name="resourceTitle"
									placeholder="Title" />
							</div>
						</div>

						<div id="resourceDescription" class="form-group row">
							<label for="resourceDescription" class="col-md-2 col-form-label">Description:
							</label>
							<div class="col-md-8">
								<textarea cols="6" rows="5" class="form-control" 
									name="resourceDescription" placeholder="Description" > </textarea>
							</div>
						</div>
						
						<div id="resourceUrl" class="form-group row">
							<label for="resourceUrl" class="col-md-2 col-form-label">URL:
							</label>
							<div class="col-md-8">
								<input class="form-control" type="text"
									name="resourceUrl" placeholder="URL" />
							</div>
						</div>
						
						<p><strong>NOTE: </strong><em>When uploading <strong>video</strong> URLs, currently our site only supports links from YouTube.</em></p>

						<input class="btn btn-success" type="submit" value="Add Resource" />

					</form>
				</div>
				<!-- #addLesson -->
			</div>
			<!-- .container-fluid -->
		</div>
		<!-- dashMain -->
	</div>
	<!-- row -->
</div>
<!-- dashboardDiv -->

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
