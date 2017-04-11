<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, userscalable=no">
    <%-- <c:url value="../../css/student.css" var="cssHref" /> --%>
    <link rel="stylesheet" href="<c:url value="/src/main/webapp/css/student.css"/>">
    <!-- <link rel="stylesheet" type="text/css" href="/../css/student.css"> -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div id="dashboardDiv" class="container-fluid">
	<div class="row">
		<div id="dashSidebar" class="col-sm-3 col-md-2 sidebar">
			<ul class="nav sidebar-nav">
				<li>My Courses</li>
				<li>Course Catalog</li>
				<li></li>
			</ul>
		</div> <!-- dashSidebar -->
	
	</div> <!-- row -->

</div> <!-- dashboardDiv -->



<c:import url="/WEB-INF/jsp/common/footer.jsp" />