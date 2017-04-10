<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<title>eLearning Portal</title>
</head>
<body><div class="courseDetail">
	<c:url var="formAction" value="/courseDetail" />
	<form method="POST" action="${formAction}">
	<h2>Course Details</h2>
	<br>
		<div>
			<label for="courseName">Name</label> <input type="text"
				name="courseName" placeholder="Course Name" />
		</div>

		<div class="courseDescription">
			<label for="courseDescription">Course Description</label> <input type="text"
				name="courseDescription" placeholder="Course Description"/>
		</div>

		<div class="courseDifficulty">
			<label for="courseDifficulty">Course Difficulty</label> <input type="text"
				name="courseDifficulty" placeholder="Course Difficulty"/>
		</div>
		
		<div class="courseCost">
			<label for="courseCost">Course Cost</label> <input type="text"
				name="courseCost" placeholder="Course Cost"/>
		</div>

		<input class="formSubmitButton" type="submit" value="Submit!" />


	</form>




</div>

</body>
</html>