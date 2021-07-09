<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>
<%@ page import = "com.joker.services.Conexion" %>
<%@ page import = "com.joker.modelo.Pregunta" %>
<%@ page import = "com.joker.modelo.PreguntaDAO" %>
<%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ranking</title>
</head>
<link rel="stylesheet" href="STYLE/css/ranking.css"></link>

<body class="wrapper">

    <header>
        <button class="home"><a   href="index.jsp">Home</a></button></b>
        <button class="logout"><a href="Logout">Logout</a></button>
        <nav class="encabezado">
            <div class="admin">ADMIN</div>
        </nav>
    
    </header>
    <div class="container">
<%
Connection con = Conexion.getInstance().getConnection();
String sql="Select * from ranking where  categoria = 'Cultura General'  order by puntuacion desc , tiempo desc" ;
Statement st = con.createStatement();
ResultSet rscult = st.executeQuery(sql);
int ic = 1;
%>

<table>
<caption>Cultura General</caption>
	<tr>
		<td>Nombre</td>
		<td>Apellidos</td>
		<td>Puntuación</td>
		<td>Tiempo</td>
	</tr>
	<% while(rscult.next() && ic <=5) {%>
	<tr>
		<td><%= rscult.getString("nombre") %></td>
		<td><%= rscult.getString("apellidos") %></td>
		<td><%= rscult.getString("puntuacion") %></td>
		<td><%= rscult.getString("tiempo") %></td>
	
	</tr>
	<% ic++; }%>
</table>
<br>
<%
sql="Select * from ranking where categoria = 'Matemáticas' order by puntuacion desc , tiempo asc" ;
ResultSet rsmaths = st.executeQuery(sql);
int im = 1;
%>
<table>
<caption>Matemáticas</caption>
	<tr>
		<td>Nombre</td>
		<td>Apellidos</td>
		<td>Puntuación</td>
		<td>Tiempo</td>
	</tr>
	<% while(rsmaths.next() && im <=5) {%>
	<tr>
		<td><%= rsmaths.getString("nombre") %></td>
		<td><%= rsmaths.getString("apellidos") %></td>
		<td><%= rsmaths.getString("puntuacion") %></td>
		<td><%= rsmaths.getString("tiempo") %></td>
	
	</tr>
	<% im++; }%>
</table>
<br>
<%
sql="Select * from ranking where categoria = 'Programación' order by puntuacion desc , tiempo asc" ;
ResultSet rsprog = st.executeQuery(sql);
int ip = 1;
%>
<table>
<caption> Programación</caption>
	<tr>
		<td>Nombre</td>
		<td>Apellidos</td>
		<td>Puntuación</td>
		<td>Tiempo</td>
	</tr>
	<% while(rsprog.next() && ip <=5) {%>
	<tr>
		<td><%= rsprog.getString("nombre") %></td>
		<td><%= rsprog.getString("apellidos") %></td>
		<td><%= rsprog.getString("puntuacion") %></td>
		<td><%= rsprog.getString("tiempo") %></td>
	
	</tr>
	<% ip++; }%>
</table>
<br>

<%
sql="Select * from ranking where categoria = 'Random' order by puntuacion desc , tiempo asc";
ResultSet rsrand = st.executeQuery(sql);
int ir = 1;
%>

<table>
<caption>Random</caption>
	<tr>
		<td>Nombre</td>
		<td>Apellidos</td>
		<td>Puntuación</td>
		<td>Tiempo</td>
	</tr>
	<% while(rsrand.next() && ir <=3) {%>
	<tr>
		<td><%= rsrand.getString("nombre") %></td>
		<td><%= rsrand.getString("apellidos") %></td>
		<td><%= rsrand.getString("puntuacion") %></td>
		<td><%= rsrand.getString("tiempo") %></td>
	
	</tr>
	<% ir++; }%>
</table>

</div>

</body>
</html>