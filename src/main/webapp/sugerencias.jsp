<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="STYLE/css/sugerencias.css"></link>
<body>
<header>
		<nav>
			<button class="home"><a href="usuarios.jsp" style="text-decoration:none; color:black" >Home</a></button>
			  <button class="logout"><a href="Logout" style="text-decoration:none; color:black">Exit</a></button>
		</nav>

		
	</header>

    <form class="form" action="/Joker/ServletSugerencia" method="post">


          <div class="container">
        <div class="pageTitle title">Sugerencias</div>
        <div class="secondaryTitle title">Bienvenido al formulario de sugerencias</div>
         <textarea class="message formEntry" placeholder="Escriba aqui su sugerencia..." required></textarea>
         <button class="submit formEntry" onclick="thanks()">Submit</button>
        </div>
    </form>


</body>
</html>