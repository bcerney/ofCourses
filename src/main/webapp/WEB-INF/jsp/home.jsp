<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>eLearning Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, userscalable=no">
   <%--  <c:url value="/css/solarsystemgeek.css" var="cssHref" />
    <link rel="stylesheet" href="${cssHref}"> --%>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
	<body>
    <header>

    	<c:url value="/img/background_v1.jpg" var="landingHero" />
        
        		<img src="${landingHero}" alt="Welcome to eLearning" />
        
        
    </body>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />

