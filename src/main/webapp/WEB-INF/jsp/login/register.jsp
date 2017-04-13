<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:import url="/WEB-INF/jsp/common/header.jsp" />
<script type="text/javascript">
	$(document).ready(function () {
		
		$("form").validate({
			
			rules : {
				userType : {
					required : true
				},
				firstName : {
					required : true
				},
				lastName : {
					required : true
				},
				email : {
					required : true
				},
				password : {
					required : true,
					notIdentical : true,
					minlength : 10,
					maxlenght : 128,
					strongpassword: true
				},
				confirmPassword : {
					required  : true,
					equalTo : "#password"
				}
			},
			messages : {
				confirmPassword : {
					equalTo: "Passwords do not match"
				}
			},
			errorClass: "error"
		});
	});
	
	$.validator.addMethod("strongpassword", function(value, index){
		return value.match(/[A-Z]/) && value.match(/[a-z]/) && value.match(/\d/);}, 
		"Please enter a strong password including one capital, one lower case, and one number");
	
	$.validator.addMethod("notIdentical", function(value, index) {
		return !value.match(/(.)\1{2}/);},
		"Password can not have more than 2 identical characters in a row.");
</script>

<div class="container-fluid">
	<div class="row">
		<c:url var="formAction" value="#" />
		<form method="POST" action="${formAction}">
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
			<div class="col-sm-4"></div>
			<div class="form-group">
				<label class="radio-inline"><input type="radio"
					name="userType" value="student">Student</label> <label class="radio-inline"><input
					type="radio" name="userType" value="teacher">Teacher</label>
			</div>
			<div class="form-group">
				<label for="firstName">First Name: </label> <input type="text"
					id="firstName" name="firstName" placeholder="First Name"
					class="form-control" />
			</div>
			<div class="form-group">
				<label for="lastName">Last Name: </label> <input type="text"
					id="lastName" name="lastName" placeholder="Last Name"
					class="form-control" />
			</div>
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
			<div class="form-group">
				<label for="confirmPassword">Confirm Password: </label> <input
					type="password" id="confirmPassword" name="confirmPassword"
					placeholder="Re-type Password" class="form-control" />
			</div>
			<button type="submit" class="btn btn-default">Create Account</button>

			<div class="col-sm-4"></div>
		</form>
	</div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />