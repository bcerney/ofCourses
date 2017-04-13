<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
		<div class="welcomeImg">
    	<c:url value="/img/background_v1.jpg" var="landingHero" />
        
        		<img src="${landingHero}" alt="Welcome to eLearning" />
        </div>
        


<c:import url="/WEB-INF/jsp/common/footer.jsp" />

