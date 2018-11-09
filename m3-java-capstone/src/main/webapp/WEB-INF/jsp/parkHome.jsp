<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp"/>

<section>
	<c:forEach var="park" items="${parks}">
		<div id="parkimg">
			<c:url var="parkURL" value="/parkDetails"/>
			<a href="${parkURL}?parkCode=${park.parkCode}">
				<img src="img/parks/${park.parkCode}.jpg">
			</a>
		</div>
		<div id="parkinfo">
			<p>${park.parkName}</p>
			<p>${park.parkState}</p>
			<p>${park.parkDescription}</p>
		</div>
		<hr>
	</c:forEach>
</section>


<c:import url="/WEB-INF/jsp/common/footer.jsp"/>