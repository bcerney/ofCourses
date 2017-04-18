<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/loggedInHeader.jsp" />

<div class="createLesson">
	<c:url var="formAction" value="/createLesson" />
	<form method="POST" action="${formAction}">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
	<h2>Create Lesson</h2>
	<br>
		<div>
			<label for="courseModule">Course Module</label> <input type="text"
				name="courseModule" placeholder="Course Module" />
		</div>

		<div class="courseLesson">
			<label for="courseLesson">Course Lesson</label> <input type="text"
				name="courseLesson" placeholder="Course Lesson"/>
		</div>

		<div class="courseHomework">
			<label for="courseHomework">Course Homework</label> <input type="text"
				name="courseHomework" placeholder="Course Homework"/>
		</div>

		<input class="formSubmitButton" type="submit" value="Submit!" />


	</form>




</div>

</body>
</html>