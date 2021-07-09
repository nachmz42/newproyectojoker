<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@ page import="com.joker.services.Conexion"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
			<b> Lista de usuarios </b>
		</caption>
		<% 
		Connection con = Conexion.getInstance().getConnection();
		String sql = "SELECT * FROM usuarios";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		
		
		
		
			
	%>
		<tr>
			
			<th>Nombre</th>
			<th>Apellidos</th>
			<th>Email</th>
			<th>password</th>
			<th>Rol</th>
			<th>Acciones</th>
			

		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%=  rs.getString("nombre")%></td>
			<td><%= rs.getString("apellidos")%></td>
			<td><%= rs.getString("email")%></td>
			<td><%= rs.getString("pass")%></td>
			<td><%= rs.getString("rol")%></td>
			<td><a style="text-decoration: none; color: black"
				href="ServletModificarusuario?email=<%=rs.getString("email") %>">Modificar</a>
				<i class="fa fa-edit" aria-hidden="true"></i> <a
				style="text-decoration: none; color: black"
				href="ServletEliminarusuario?email=<%= rs.getString("email")%>">
					Eliminar<i class="fa fa-trash" aria-hidden="true"></i>
			</a></td>
			

			<%  } rs.close();%>
		</tr>
		</table>
		</div>

</body>
</html>