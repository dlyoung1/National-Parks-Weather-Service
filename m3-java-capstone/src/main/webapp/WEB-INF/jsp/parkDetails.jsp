<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp"/>


	<section>
	
	<div id="park-details-img">
		<img src="img/parks/${parkDetails.parkCode}.jpg">
	</div>
	
	<div id="park-details-info">
		Park Name: ${parkDetails.parkName}<br>
		State: ${parkDetails.parkState}<br>
		Acreage: ${parkDetails.acreage}<br>
		Elevation: ${parkDetails.elevation}<br>
		Miles of Trail: ${parkDetails.milesOfTrail}<br>
		Number of Campsites: ${parkDetails.numberOfCampsites}<br>
		Climate: ${parkDetails.climate}<br>
		Year Founded: ${parkDetails.yearFounded}<br>
		Annual Visitor Count: ${parkDetails.annualVisitorCount}<br>
		Inspirational Quote: "${parkDetails.inspirationalQuote}"<br>
		- ${parkDetails.inspirationalQuoteSource}<br>
		Description: ${parkDetails.parkDescription}<br>
		Entry Fee: ${parkDetails.entryFee}<br>
		Number of Species: ${parkDetails.numberOfSpecies}<br>
		
	</div>
	
	</section>



<c:import url="/WEB-INF/jsp/common/footer.jsp"/>