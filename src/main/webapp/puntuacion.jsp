<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TU PUNTUACIÓN</title>
<link rel="stylesheet" href="STYLE/css/puntuacion.css"></link>
</head>
<body>
	<div class="lhome">
	<a class="home" href="usuarios.jsp">Home</a>
	</div>
	<div class="lranking">
	<a class="ranking" href="ranking.jsp">Ranking</a>
	</div>
	

	<% int puntuacion = (int) request.getAttribute("puntuacion");
	String tiempo = (String) request.getAttribute("tiempo");%>
	<div class="cuadro">
	<h1 class="puntuación">Tu puntuación ha sido: <%=puntuacion %></h1>
	<h1 class="tiempo">Has tardado: <%=tiempo %></h1>
<!-- 	<h1 class="puntuación">Tu puntuación ha sido: 7</h1> -->
<!-- 	<h1 class="tiempo">Has tardado: 08:00:06</h1> -->
	</div>

</body>
</html>