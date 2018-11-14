<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>

<!-- ------------------------------------------------------ -->

<section>
<table style="table-layout: auto; width: 100%;">


    

	<c:forEach var="park" items="${parks}">
	<tr>
	<td>
		<div id="parkimg">
			<c:url var="parkURL" value="/parkDetails"/>
			<a href="${parkURL}?parkCode=${park.parkCode}"><img src="img/parks/${park.parkCode}.jpg"></a>
			
			<div id="quotes">
				<p style="margin: 0; padding: 0;">${park.inspirationalQuote}</p>
				<p style="margin: 0; padding: 0; text-align: right">-${park.inspirationalQuoteSource}</p>
			</div>
			
		</div>
		
		</td>
		<td class="parkText">
		
 		<!-- <div id="parkinfo"> -->
			<hr>
			${park.parkName}
			<br>
			<c:set var="test" value="${forecastHome}" />
			<span>${test.highTemp}</span>
		
			<hr>
			
			<%-- ${park.parkState} --%>
			
			<br>
			${park.parkDescription}
			
			<%-- <span style="word-wrap: break-word; width: 600px;">${park.parkName}</span>
			<span style="word-wrap: break-word; width: 600px;">${park.parkState}</span>
			<span style="word-wrap: break-word; width: 600px;">${park.parkDescription}</span> --%>
			
		<!-- </div>  -->
		</td>
		</tr>
		
	</c:forEach>

</table>
</section>

<!-- ------------------------------------------------------ -->
<!-- ORIGINAL -->
<!-- ------------------------------------------------------ -->
<%-- <section>
	<c:forEach var="park" items="${parks}">
	
		<div id="parkimg">
			<c:url var="parkURL" value="/parkDetails"/>
			<a href="${parkURL}?parkCode=${park.parkCode}"><img src="img/parks/${park.parkCode}.jpg"></a>
			
			<div id="quotes">
				<p style="margin: 0; padding: 0;">${park.inspirationalQuote}</p>
				<p style="margin: 0; padding: 0; text-align: right">-${park.inspirationalQuoteSource}</p>
			</div>
			
		</div>
		
		
		
 		<div id="parkinfo">
			
			
			<p>${park.parkName}</p>
			<p>${park.parkState}</p>
			<p>${park.parkDescription}</p>
			
		</div> 
		<hr>
	</c:forEach>
</section> --%>









<!-- ------------------------------------------------------ -->

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>