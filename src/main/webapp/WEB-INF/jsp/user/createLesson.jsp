<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<title>eLearning Portal</title>
</head>
<body><div class="createLesson">
	<c:url var="formAction" value="/createLesson" />
	<form method="POST" action="${formAction}">
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