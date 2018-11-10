<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<section>
	
	<div id="forecast">
		<h3>5 Day Forecast for ${parkDetails.parkName}</h3>
		<table>
			<tr>
			<jsp:useBean id="now" class="java.util.Date"/>
				<th><fmt:formatDate value="${now}" pattern="MMM dd"/></th>
				<c:set var="month" value="${fn:substring(now, 4, 7)}"/>
				<c:set var="day" value="${fn:substring(now, 8, 10)}"/>
				<c:set var="newDay" value="${Integer.parseInt(day)}"/>
				<th>${month} ${newDay + 1}</th>
				<th>${month} ${newDay + 2}</th>
				<th>${month} ${newDay + 3}</th>
				<th>${month} ${newDay + 4}</th>
			</tr>
			<tr>
				<c:forEach var="forecast" items="${forecast}">
					<td>
					<c:choose>
						<c:when test="${forecast.forecast == 'partly cloudy'}">
							<img width=100px src="img/weather/partlyCloudy.png">
						</c:when>
						<c:when test="${forecast.forecast == 'thunderstorms'}">
							<img width=100px src="img/weather/thunderstorms.png">
						</c:when>
						<c:when test="${forecast.forecast == 'sunny'}">
							<img width=100px src="img/weather/sunny.png">
						</c:when>
						<c:when test="${forecast.forecast == 'rain'}">
							<img width=100px src="img/weather/rain.png">
						</c:when>
						<c:when test="${forecast.forecast == 'snow'}">
							<img width=100px src="img/weather/snow.png">
						</c:when>
						<c:when test="${forecast.forecast == 'cloudy'}">
							<img width=100px src="img/weather/cloudy.png">
						</c:when>
					</c:choose>
					</td>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="forecast" items="${forecast}">
					<td>High: ${forecast.highTemp}</td>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="forecast" items="${forecast}">
					<td>Low: ${forecast.lowTemp}</td>
				</c:forEach>
			</tr>
		</table>
	</div>

</section>