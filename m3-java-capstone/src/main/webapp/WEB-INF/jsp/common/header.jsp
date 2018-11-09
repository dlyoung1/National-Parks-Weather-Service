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

<div id="headerimg">
	<img id="logo" src="img/logo.png">
</div>

<div id="headerlinks">
	<nav>
		<a href="parkHome">Home | </a>
		<a href="survey">Survey</a>
	</nav>
</div>

<div class="container">