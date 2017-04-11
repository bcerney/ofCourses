<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eLearning Portal | Log In</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, userscalable=no">
<!-- <link rel="stylesheet" type="text/css" href="/../css/student.css"> -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>


<c:import url="/WEB-INF/jsp/common/header.jsp" />
<script type="text/javascript">

</script>

<div class="container-fluid">
	<div class="row">
		<c:url var="formAction" value="#" />
		<form method="POST" action="${formAction}">

			<div class="col-sm-4"></div>
			
			<div class="form-group">
				<label for="email">Email Address: </label> <input type="text"
					id="email" name="email" placeholder="user@email.com"
					class="form-control" />
			</div>
			<div class="form-group">
				<label for="password">Password: </label> <input type="password"
					id="password" name="password" placeholder="Password"
					class="form-control" />
			</div>
			<!-- TODO: option to change password -->
			<button type="submit" class="btn btn-default">Log In</button>

			<div class="col-sm-4"></div>
		</form>
	</div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />