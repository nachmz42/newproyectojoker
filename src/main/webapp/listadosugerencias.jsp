<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@ page import="com.joker.services.Conexion"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="STYLE/css/tabla.css"></link>
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
	<table>
		<caption>
			<b> Lista de sugerencias </b>
		</caption>
		<% 
		Connection con = Conexion.getInstance().getConnection();
		String sql = "SELECT * FROM sugerencias";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		
		
		
		
			
	%>
		<tr>
			
			<th>Nombre</th>
			<th>Apellidos</th>
			<th>Email</th>
			<th>Sugerencia</th>
			
			

		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%=  rs.getString("nombre")%></td>
			<td><%= rs.getString("apellidos")%></td>
			<td><%= rs.getString("email")%></td>
			<td><%= rs.getString("sugerencia")%></td>
			
			

			<%  } rs.close();%>
		</tr>
		</table>
		</div>	

</body>
</html>