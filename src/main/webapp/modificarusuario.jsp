<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ page import="com.joker.modelo.Usuario"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="STYLE/css/modificarusuario.css"></link>

</head>
<body>

<% Usuario u = (Usuario) request.getAttribute("user"); %>
 <header>
        <button class="home"><a   href="index.jsp">Home</a></button></b>
        <button class="logout"><a href="Logout">Logout</a></button>
        <nav class="encabezado">
            <div class="admin">ADMIN</div>
        </nav>
    
    </header>



	<div class="container">
  	<form class="formulario"action="/Joker/ServletModificarusuario" method="post">
			<br>


			<h2>Modificar usuario</h2>
			<div class="form2" >


				<label for="email" id="id1">Email</label><br> 
				<input type="email"
					id="email" name="email"
					placeholder="Email del usuario que desea modificar" required
					value = '<%= (u == null) ? "" : u.getEmail() %>'> 
					<i class="icon-user" ></i><br> 
					
				<label for="password" id="id1">Password</label><br>
				<input type="text" id="password" name="password"  required placeholder="Password ..."
				value = '<%= (u == null) ? "" : u.getPass() %>'
				> <br> <label
					for="nombre" id="id1">Nombre</label><br> 
					
				<input type="text"
					id="nombre" name="nombre" placeholder="Tu Nombre ..." required
					value = '<%= (u == null) ? "" : u.getNombre() %>'><br>

				<label for="apellidos" id="id1">Apellidos</label><br> 
				<input
					type="text" id="apellidos" name="apellidos"
					placeholder="Tus Apellidos ..." required value = '<%= (u == null) ? "" : u.getApellidos() %>'><br> <label
					for="edad" id="1">Edad</label><br> 
					
				<input type="text"
					id="edad" name="edad" placeholder="Tu edad ..." required value = '<%= (u == null) ? "" : u.getEdad() %>'><br>

				 <label for="rol" id="id1">
					Rol</label><br>
					 <input type="text" id="rol"
					name="rol" placeholder="Admin/invitado" required
					value = '<%= (u == null) ? "" : u.getRol() %>' > <br>


				<input type="submit" value="Enviar"><br>
				 <input type="reset" value="Borrar"><br>
			</div>
			</form>
			
	</div>
	</div>
	
</body>
</html>