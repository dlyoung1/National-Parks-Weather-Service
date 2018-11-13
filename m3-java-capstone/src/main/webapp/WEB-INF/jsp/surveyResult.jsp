<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp"/>

<h1>Favorite Parks</h1>

<c:forEach var="results" items="${surveys}" varStatus="loop">
	<div style="display:inline-block">
		<img src="img/parks/${results.parkCode.toLowerCase()}.jpg"/>
	</div>
	<div style="display:inline-block">
		<h2>
			${parks[loop.index].parkName}
		</h2>
		<h3>Total votes: ${results.count}</h3>
	</div><br><hr>
</c:forEach>


<c:import url="/WEB-INF/jsp/common/footer.jsp"/>