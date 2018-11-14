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
				<hr>
				${park.parkName}
				<br>	
				<hr>
				<br>
				${park.parkDescription}
			</td>
		</tr>
	</c:forEach>

</table>
</section>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>