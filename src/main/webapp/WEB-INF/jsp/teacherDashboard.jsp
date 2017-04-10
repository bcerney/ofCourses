<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<title>eLearning Portal</title>
</head>
<body>
<div id="createCourse">
<c:url var="createCourseURL" value="/CreateCourse">
					</c:url> <a href="#">Create Course</a>
</div>

<div id="manageCourse">
<c:url var="manageCourseURL" value="/ManageCourse">
					</c:url> <a href="#">Manage Course</a>

</div>
</body>
</html>