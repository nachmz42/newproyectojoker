<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminar Usuario</title>
<link rel="stylesheet" href="STYLE/css/eliminarusuario.css"></link>
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
  	<form class="formulario" action="/Joker/ServletEliminarusuario" method="post"><br>
  <h1>Eliminar Usuario</h1>
  	
  	<div class="form2">
    
    
    <label for="email" id="id1">Email</label><br>
    <input type="email" id="email" name="email" placeholder="Email del usuario a eliminar"  required>
     <i class="icon-user"></i><br>
    
    
    <label for="password" id="id1" >Password</label><br>
    <input type="text" id="password" name="password" placeholder="Password ..."  required>  <br>
  
   
    <input type="submit" value="Enviar"><br>
    <input type="reset" value="Borrar"><br>
   </div>
  </form>
   
</div>
</div>

</body>
</html>