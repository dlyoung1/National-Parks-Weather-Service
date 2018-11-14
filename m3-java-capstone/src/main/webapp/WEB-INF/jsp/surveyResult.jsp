<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp"/>

<h1>Favorite Parks</h1>

<div class="survey-button">
	<c:url var="surveyInput" value="/surveyInput"/>
	<a href="${surveyInput}"><button>Vote for your favorite Park!</button></a>
</div>

<!-- surveyResult loops through survey_response DB for the image file name and vote count. Also obtains park name from park DB -->
<c:forEach var="results" items="${surveys}" varStatus="loop">
	<div class="result-div">
		<c:url var="parkURL" value="/parkDetails"/>
		<a href="${parkURL}?parkCode=${results.parkCode}">
			<img src="img/parks/${results.parkCode.toLowerCase()}.jpg"/>
		</a>
	</div>
	
	<div class="result-div">
		<h3 id="name">
			<a href="${parkURL}?parkCode=${results.parkCode}">
			${parks[loop.index].parkName}
			</a>
		</h3>
		<h3>Total votes: <span id="count">${results.count}</span></h3>
	</div>
	<hr>
</c:forEach>
<br>
<c:set var="totalCount" value="${0}"/>
<c:forEach var="results" items="${surveys}">
	<c:set var="totalCount" value="${results.count + totalCount}"/>
</c:forEach>

<div id="favorite-bar"><h4>Visual Comparison</h4>
	<c:forEach var="results" items="${surveys}" varStatus="loop">
		<div id="name">
			<a href="${parkURL}?parkCode=${results.parkCode}">
				${parks[loop.index].parkName}: ${results.count} votes
			</a>
		</div>
			<div id="count-bar-container">
				<span style="width:${results.count/totalCount*100}%" id="count-bar"></span>
			</div>
	</c:forEach>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp"/>