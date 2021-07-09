<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="STYLE/css/usuario.css"></link>
</head>
<%HttpSession sesion= request.getSession(); %>
<body class="wrapper">

    <header>
        <button class="home"><a   href="index.jsp">Home</a></button></b>
        <button class="logout"><a href="Logout">Logout</a></button>
        <nav >

<%  if(sesion.getAttribute("img")!=null){ %>
<div class="admin"><img class= "fotoPerfil" src="imagen"> </div>
<%} else{ %>
        <div class="admin"><%= sesion.getAttribute("nombre")%> <%= sesion.getAttribute("apellidos") %></div>
        <%}%>
        </nav>
    
    </header>
    
   
       

    <div class= "container">
        <div class="left"><a href="categorias.jsp">CATEGORÍAS</a></div>
        <div class="right"><a href="random.jsp">RANDOM QUIZ</a></div>
        <div class="left"><a  href="ranking.jsp">RANKING</a></div>
        <div class="right"><a  href="sugerencias.jsp">SUGERENCIAS</a></div>
    </div>

    <div class="footer"><a href="#">BACK TO TOP</a></div>

</html>