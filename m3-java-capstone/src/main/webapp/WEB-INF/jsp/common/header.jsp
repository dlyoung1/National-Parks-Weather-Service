<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css"></link>
<title>National Park Geek - 
<c:if test="${param.subTitle != null}"> - <c:out value="${param.subTitle}"/></c:if>
</title>
</head>

<body>
	<header>
		<img id="logo" src="img/logo.png">
			
		<nav class="headerlinks">
			<ol>
				<c:url var="parkURL" value="/"/>
				<li class="links"><a href="${parkURL}">Home </a></li>
				<c:url var="surveyURL" value="/survey"/>
				<li class="links"><a href="${surveyURL}">Survey</a></li>
			</ol>
		</nav>
	</header>

<div class="container">