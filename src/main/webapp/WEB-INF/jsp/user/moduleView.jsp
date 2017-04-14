<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	THIS WILL BE THE MODULE VIEW PAGE
	<c:url value="/dashboard/${course.courseId}/${module.moduleId}/addLesson" var="addLesson"/>
	<a href="${addLesson}">Add Lesson</a>


</body>
</html>