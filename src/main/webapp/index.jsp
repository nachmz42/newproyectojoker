<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Joker</title>
<link rel="stylesheet" href="STYLE/css/welcomepage.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
<header>

    
   
  <input type="checkbox" id="ham-menu">
  <label for="ham-menu">
    <div class="hide-des">
      <span class="menu-line"></span>
      <span class="menu-line"></span>
      <span class="menu-line"></span>
      <span class="menu-line"></span>
      <span class="menu-line"></span>
      <span class="menu-line"></span>
    </div>
  </label>

  <div class="full-page-green"></div>
  <div class="ham-menu">
    <ul class="centre-text bold-text">
        <li class="dropdown">
            <button class="dropbtn">Juegos</button>
                <div class="dropdown-content">
                    <a href="categorias.jsp">Categorias</a> 
                    <% HttpSession sesion = request.getSession();
					if(sesion.getAttribute("login")!=null){ 
					if(sesion.getAttribute("login").equals("on")){ %>
                    <a href="random.jsp">Random Quiz</a>
                    <% } else{%>
                    <a href="login.jsp">Random Quiz</a>
                    <%} } else{ %>
                    <a href="login.jsp">Random Quiz</a>
                    <%}%>
                    <a href="ranking.jsp">Ranking</a>
                </div>
        </li>
      <li id="home"><a href="index.jsp">Home</a>
         
      </li>
      <li id="aboutus"><a href="aboutus.jsp">About Us</a></li>
      <li id="login"><a href="login.jsp">Login</a></li>
      <li id="registro"><a href="registro.jsp">Registro</a></li>
    </ul>
  </div>
        
         
   <div class="cubo">
        <div class="cara" id="superior"></div>
        <div class="cara" id="frente"></div>
        <div class="cara" id="derecha"></div>
        <div class="cara" id="izquierda"></div>
        <div class="cara" id="atras"></div>
        <div class="cara" id="inferior"></div>
    </div>

	
  
        <h1 class="games">
            <span>G</span>
            <span>A</span>
            <span>M</span>
            <span>E</span>
            <span>S</span>
           
          </h1>
       
    
	
	<div class="footer">
	 <h2 id="SMT">Our Social Media</h2>
		<div class="redes">    
		    <a href="#" class="fa fa-facebook"></a>
		    <a href="#" class="fa fa-twitter"></a>
		    <a href="#" class="fa fa-instagram"></a>
		    <a href="#" class="fa fa-pinterest"></a>
		 </div>
	</div>
  
  
  
</body>
</html>