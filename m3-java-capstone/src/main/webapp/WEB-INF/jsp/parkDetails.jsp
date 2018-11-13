<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp"/>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<section>
	<div id="park-details-img">
		<img src="img/parks/${parkDetails.parkCode}.jpg">
	</div>
	
	<div id="park-details-info">
		<table id="park-details-table">
			<tr>
				<td>Park Name: </td>
				<td>${parkDetails.parkName}</td>
			</tr>
			<tr>
				<td>State: </td>
				<td>${parkDetails.parkState}</td>
			</tr>
			<tr>
				<td>Acreage: </td>
				<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${parkDetails.acreage}" /></td>
			</tr>
			<tr>
				<td>Elevation: </td>
				<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${parkDetails.elevation}" /> ft</td>
			</tr>
			<tr>
				<td>Miles of Trail: </td>
				<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${parkDetails.milesOfTrail}" /></td>
			</tr>
			<tr>
				<td>Number of Campsites: </td>
				<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${parkDetails.numberOfCampsites}" /></td>
			</tr>
			<tr>
				<td>Climate: </td>
				<td>${parkDetails.climate}</td>
			</tr>
			<tr>
				<td>Year Founded: </td>
				<td>${parkDetails.yearFounded}</td>
			</tr>
			<tr>
				<td>Annual Visitor Count: </td>
				<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${parkDetails.annualVisitorCount}" /></td>
			</tr>
			<tr>
				<td>Inspirational Quote: </td>
				<td>"${parkDetails.inspirationalQuote}"</td>
			</tr>
			<tr>
				<td>Quote Source: </td>
				<td>${parkDetails.inspirationalQuoteSource}</td>
			</tr>
			<tr>
				<td>Description: </td>
				<td>${parkDetails.parkDescription}</td>
			</tr>
			<tr>
				<td>Entry Fee: </td>
				<td>$${parkDetails.entryFee}</td>
			</tr>
			<tr>
				<td>Number of Species: </td>
				<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${parkDetails.numberOfSpecies}" /></td>
			</tr>
		</table>
	</div>
	
	<hr id="line">
	
</section>

<c:import url="/weather?${parkCode}.jsp"/>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>