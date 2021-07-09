<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="STYLE/css/añadiruuario.css"></link>
</head>
<body class="wrapper">

    <header>
        <button class="home"><a   href="index.jsp">Home</a></button></b>
        <button class="logout"><a href="Logout">Logout</a></button>
        <nav class="encabezado">
            <div class="admin">ADMIN</div>
        </nav>
    
    </header>

	<div class="container">
  	<form class="formulario" action="/Joker/ServletAltausuario" method="post">
        <h1>Alta usuario</h1>
  	<div class="form2" >
    <label for="nombre" id="id1">Nombre</label><br>
    <input type="text" id="nombre" name="nombre" placeholder="Nombre ..."  required><br>
   
    <label for="apellidos" id="id1">Apellidos</label><br>
    <input type="text" id="apellidos" name="apellidos" placeholder="Apellidos ..." required><br>
   

    <label for="edad" id="id1">Edad</label><br>
    <input type="text" id="edad" name="edad" placeholder="Edad ..."  required  ><br>
    
    
    <label for="email" id="id1">Email</label><br>
    <input type="email" id="email" name="email" placeholder="Email ..."  required>
     <i class="icon-user"></i><br>
    
    
    <label for="password" id="id1" >Password</label><br>
    <input type="text" id="password" name="password" placeholder="Password ..."  required>  <br>
  
    <label for="rol" id="id1" >Rol</label><br>
    <input type="text" id="rol" name="rol" placeholder="Admin/invitado"  required  >  <br>
   
  
    <input type="submit" value="Enviar"><br>
    <input type="reset" value="Borrar"><br>
   </div>
  </form>
</div>


</body>
</html>
