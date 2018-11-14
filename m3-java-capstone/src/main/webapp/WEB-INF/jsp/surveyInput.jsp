<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp"/>

<h1>National Park Survey</h1>

<!-- survey requires input on all fields and alerts if an invalid email is entered -->
<form action="surveyInput" method="POST">
	<c:if test="${not empty errorMessages}">
		<c:forEach var="message" items="${errorMessages}">
			<div class="alert" role="alert">
				${message}
			</div>
		</c:forEach>
	</c:if>
	<div class="survey-form">
		<label for="parkCode">Favorite National Park: </label>
			<select id="parkCode" name="parkCode">
				<c:forEach var="park" items="${parks}">
					<option value="${park.parkCode}">${park.parkName}</option>
				</c:forEach>
			</select>
	</div>
	<div class="survey-form">
		<label for="email">Email address: </label>
			<input name="email" type="text" id="email" required/>
	</div>
	<div class="survey-form">
		<label for="state">State of Residence: </label>
			<select id="state" name="state">
				<option value="Alabama">Alabama</option>
				<option value="Alaska">Alaska</option>
				<option value="Arizona">Arizona</option>
				<option value="Arkansas">Arkansas</option>
				<option value="California">California</option>
				<option value="Colorado">Colorado</option>
				<option value="Connecticut">Connecticut</option>
				<option value="Delaware">Delaware</option>
				<option value="District Of Columbia">District Of Columbia</option>
				<option value="Florida">Florida</option>
				<option value="Georgia">Georgia</option>
				<option value="Hawaii">Hawaii</option>
				<option value="Idaho">Idaho</option>
				<option value="Illinois">Illinois</option>
				<option value="Indiana">Indiana</option>
				<option value="Iowa">Iowa</option>
				<option value="Kansas">Kansas</option>
				<option value="Kentucky">Kentucky</option>
				<option value="Louisiana">Louisiana</option>
				<option value="Maine">Maine</option>
				<option value="Maryland">Maryland</option>
				<option value="Massachusetts">Massachusetts</option>
				<option value="Michigan">Michigan</option>
				<option value="Minnesota">Minnesota</option>
				<option value="Mississippi">Mississippi</option>
				<option value="Missouri">Missouri</option>
				<option value="Montana">Montana</option>
				<option value="Nebraska">Nebraska</option>
				<option value="Nevada">Nevada</option>
				<option value="New Hampshire">New Hampshire</option>
				<option value="New Jersey">New Jersey</option>
				<option value="New Mexico">New Mexico</option>
				<option value="New York">New York</option>
				<option value="North Carolina">North Carolina</option>
				<option value="North Dakota">North Dakota</option>
				<option value="Ohio">Ohio</option>
				<option value="Oklahoma">Oklahoma</option>
				<option value="Oregon">Oregon</option>
				<option value="Pennsylvania">Pennsylvania</option>
				<option value="Rhode Island">Rhode Island</option>
				<option value="South Carolina">South Carolina</option>
				<option value="South Dakota">South Dakota</option>
				<option value="Tennessee">Tennessee</option>
				<option value="Texas">Texas</option>
				<option value="Utah">Utah</option>
				<option value="Vermont">Vermont</option>
				<option value="Virginia">Virginia</option>
				<option value="Washington">Washington</option>
				<option value="West Virginia">West Virginia</option>
				<option value="Wisconsin">Wisconsin</option>
				<option value="Wyoming">Wyoming</option>
			</select>
	</div>
	<div class="survey-form">
		<label for="activityLevel">Physical Activity Level: </label>
			<input type="radio" name="activityLevel" id="activityLevel" value="inactive" required> Inactive&emsp;
			<input type="radio" name="activityLevel" id="activityLevel" value="sedentary"> Sedentary&emsp;
			<input type="radio" name="activityLevel" id="activityLevel" value="active"> Active&emsp;
			<input type="radio" name="activityLevel" id="activityLevel" value="extremelyactive"> Extremely Active
	</div>
	<div class="survey-form"><span id="submit-form">
		<input type="submit" value="Submit"/></span>
	</div>
</form>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>