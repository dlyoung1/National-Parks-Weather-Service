<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<section>
	
	<div id="forecast">
		<h3>5 Day Forecast for ${parkDetails.parkName}</h3>
		
		<!-- SENDS SESSION DATA TO CONTROLLER FOR TEMPERATURE CONVERSION. -->
		<c:url var="convertTemp" value="/parkSession"/>
		<a href="${convertTemp}"><button>Convert to ${calcScale}</button></a><br><br>
		
		<table>
			<tr>
				<jsp:useBean id="now" class="java.util.Date"/>
				<c:set var="oneDay" value="86400000" />
				
    				<c:set target="${now}" property="time" value="${now.getTime()}"/><th><fmt:formatDate value="${now}" pattern="MMM dd"/></th>
				<c:set target="${now}" property="time" value="${now.getTime() + oneDay}"/><th><fmt:formatDate value="${now}" pattern="MMM dd"/></th>
				<c:set target="${now}" property="time" value="${now.getTime() + oneDay}"/><th><fmt:formatDate value="${now}" pattern="MMM dd"/></th>
				<c:set target="${now}" property="time" value="${now.getTime() + oneDay}"/><th><fmt:formatDate value="${now}" pattern="MMM dd"/></th>
				<c:set target="${now}" property="time" value="${now.getTime() + oneDay}"/><th><fmt:formatDate value="${now}" pattern="MMM dd"/></th>
			</tr>
			
			
			
			
			
			
			<!-- PLACE IMAGES -->
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
			
			
			
			
			
			
			
			
			
			<!-- HIGH & LOW TEMPERATURE -->
			<tr>
				<c:forEach var="forecast" items="${forecast}">
					<td>High: ${forecast.highTemp} °${displayScale}</td>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="forecast" items="${forecast}">
					<td>Low: ${forecast.lowTemp} °${displayScale}</td>
				</c:forEach>
			</tr>
			
			<!-- WEATHER ADVISORIES -->
			<tr>
				<c:forEach var="forecast" items="${forecast}">
					<c:choose>
						<c:when test="${forecast.forecast == 'partly cloudy'}"><td>partly cloudy</td></c:when>
						<c:when test="${forecast.forecast == 'thunderstorms'}"><td>Avoid hiking on exposed ridges. Leave your golf clubs at home.</td></c:when>
						<c:when test="${forecast.forecast == 'sunny'}"><td>Bring your shades!</td></c:when>
						<c:when test="${forecast.forecast == 'rain'}"><td>Be sure to pack galoshes and a raft.</td></c:when>
						<c:when test="${forecast.forecast == 'snow'}"><td>Be sure to pack snow shoes and plenty of rations. You don't want to end up like the Donner Party.</td></c:when>
						<c:when test="${forecast.forecast == 'cloudy'}"><td>cloudy</td></c:when>
					</c:choose>
				</c:forEach>
			</tr>
			
			<!-- TEMPERATURE ADVISORIES -->
			<tr>
				<c:choose>
					<c:when test="${displayScale == 'F'}">
						<c:forEach var="forecast" items="${forecast}">	
							<c:set var="advice" value="" />
							<c:if test="${forecast.highTemp > 75}"><c:set var="advice" value="Bring extra water. " /></c:if>
							<c:if test="${(forecast.highTemp - forecast.lowTemp) > 20}"><c:set var="advice" value="${advice}  Breathable layers are advised. " /></c:if>
							<c:if test="${forecast.lowTemp < 20}"><c:set var="advice" value="${advice}  Watch for signs of frostbite." /></c:if>
							<td>${advice}</td>
						</c:forEach>
					</c:when>
					<c:when test="${displayScale == 'C'}">
						<c:forEach var="forecast" items="${forecast}">	
							<c:set var="advice" value="" />
							<c:if test="${forecast.highTemp > 24}"><c:set var="advice" value="Bring extra water. " /></c:if>
							<c:if test="${(forecast.highTemp - forecast.lowTemp) > 11}"><c:set var="advice" value="${advice}  Breathable layers are advised. " /></c:if>
							<c:if test="${forecast.lowTemp < -6}"><c:set var="advice" value="${advice}  Watch for signs of frostbite." /></c:if>
							<td>${advice}</td>
						</c:forEach>
						</c:when>
				</c:choose>
			</tr>			
			
		</table>
	</div>

</section>