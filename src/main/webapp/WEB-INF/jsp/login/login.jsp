<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:import url="/WEB-INF/jsp/common/header.jsp" />
<script type="text/javascript">
	
</script>

<div class="container-fluid">

	<div class="row">
		<c:url var="formAction" value="/login" />
		<form method="POST" action="${formAction}">
			<%-- <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" /> --%>
		
			<div class="col-sm-6">
			<div class="form-group">
				<label for="email">Email Address: </label> <input type="text"
					id="email" name="email" placeholder="user@email.com"
					class="form-control" />
			</div>
			<div class="form-group">
				<label for="password">Password: </label> <input type="password"
					id="password" name="password" placeholder="Password"
					class="form-control" />
			
			<!-- TODO: option to change password -->
			</div>
			<button type="submit" class="btn btn-success">Log In</button>
		</div>
		</form>
		<div class="col-sm-6"></div>
	</div>
</div>




<c:import url="/WEB-INF/jsp/common/footer.jsp" />