<!DOCTYPE html>
<%@ page import="com.joker.modelo.Pregunta"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Modificar pregunta</title>
<link rel="stylesheet" href="STYLE/css/modpreg.css"></link>
</head>
<body>
	<div class="encabezado">
	<div class="home"><a style="text-decoration:none; color:black" href="admin.jsp">Home</a></div>
	<div class="logout"><a style="text-decoration:none; color:black" href="Logout">Logout</a></div>
	<div class="admin">AD</div>
	</div>
		<div class= "cuerpo">
	<div class= "testbox">
	<% Pregunta p = (Pregunta) request.getAttribute("pregunta"); %>



	<form action="AMDPreg" method="post">Modificación pregunta 
		<input type="text" name="pregunta" placeholder="Pregunta..." value = '<%= (p == null) ? "" : p.getPregunta() %>'><br>
		<label>Respuesta 1</label>
		<input type="text" name="rs1" placeholder="Respuesta 1..." value = '<%= (p == null) ? "" : p.getRs1() %>'><br>
		<label>Respuesta 2</label>
		<input type="text" name="rs2" placeholder="Respuesta 2..." value = '<%= (p == null) ? "" : p.getRs2() %>'><br>
		<label>Respuesta 3</label>
		<input type="text" name="rs3" placeholder="Respuesta 3..." value = '<%= (p == null) ? "" : p.getRs3() %>'><br>
		<label>Respuesta 4</label>
		<input type="text" name="rs4" placeholder="Respuesta 4..."value = '<%= (p == null) ? "" : p.getRs4() %>'><br>
		<label>Respuesta Correcta</label>
		<input type="text" name="rsc" placeholder="Respuesta Correcta..." value = '<%= (p == null) ? "" : p.getRsc() %>'><br>
		<input type="hidden" name = "op" value="m">
		<input type="hidden" name = "id" value= <%= request.getAttribute("id") %>>
		<input type="hidden" name = "categoria" value= <%= request.getAttribute("categoria") %>>
		<input type="submit" value="Enviar">
		<input type="reset" value="Borrar"><br>
	</form>
	</div>
	</div>
</body>
</html>