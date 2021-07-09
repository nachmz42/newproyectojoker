<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Categorias</title>
<link rel="stylesheet" href="STYLE/css/categorias.css">

</head>
<body>

	<header>
		<nav>
			<a href="usuarios.jsp">Home</a>
			 <a href="ranking.jsp">Ranking</a>
			  <a href="Logout">Exit </a>
		</nav>

		<h1>CATEGORIAS</h1>
	</header>


	<div class="container">
		<div class="box">
		<% HttpSession sesion = request.getSession();
		if(sesion.getAttribute("login")!=null){ 
		if(sesion.getAttribute("login").equals("on")){ %>
			<a href="culturaGeneral.jsp"><img src="STYLE/imagenes/cultgeneral.jpg"></a> <span>Cultura General</span>
			<% } else{%>
			<a href="login.jsp"><img src="STYLE/imagenes/cultgeneral.jpg"></a> <span>Cultura General</span>
			<%} } else{ %>
				<a href="login.jsp"><img src="STYLE/imagenes/cultgeneral.jpg"></a> <span>Cultura General</span>
			<%}%>
			
		</div>
		<div class="box">
		<% 
		if(sesion.getAttribute("login")!=null){ 
		if(sesion.getAttribute("login").equals("on")){ %>
			<a href="mates.jsp"><img src="STYLE/imagenes/mates.jpg"></a> <span>Special Maths</span>
			<% } else{%>
			<a href="login.jsp"><img src="STYLE/imagenes/mates.jpg"></a> <span>Special Maths</span>
			<%} } else{ %>
			<a href="login.jsp"><img src="STYLE/imagenes/mates.jpg"></a> <span>Special Maths</span>
			<%}%>
		</div>
		<div class="box">
		<% 
		if(sesion.getAttribute("login")!=null){ 
		if(sesion.getAttribute("login").equals("on")){ %>
			<a href="programacion.jsp"><img src="STYLE/imagenes/programacion.jpg"></a> <span>Programación</span>
			<% } else{%>
			<a href="login.jsp"><img src="STYLE/imagenes/programacion.jpg"></a> <span>Programación</span>
			<%} } else{ %>
			<a href="login.jsp"><img src="STYLE/imagenes/programacion.jpg"></a> <span>Programación</span>
			<%}%>
		</div>
	</div>

	<div class="footer">
		<a href="">Back to top</a>
	</div>


</body>
</html>