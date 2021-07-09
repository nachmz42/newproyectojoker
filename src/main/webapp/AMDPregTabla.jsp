<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ page import="java.sql.*"%>
<%@ page import="com.joker.services.Conexion"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tabla De Preguntas</title>

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
			<b> Lista de preguntas Cultura General </b>
		</caption>
		<% 
		Connection con = Conexion.getInstance().getConnection();
		String sql = "SELECT * FROM categoria_cultura order by  pregunta asc";
		Statement st = con.createStatement();
		ResultSet rscult = st.executeQuery(sql);
		
			
	%>
		<tr>
			<th>Pregunta</th>
			<th>Respuesta 1</th>
			<th>Respuesta 2</th>
			<th>Respuesta 3</th>
			<th>Respuesta 4</th>
			<th>Respuesta Correcta</th>
			<th>Acciones</th>

		</tr>
		<% while(rscult.next()){ %>
		<tr>
			<td><%=  rscult.getString("pregunta")%></td>
			<td><%= rscult.getString("rs1")%></td>
			<td><%= rscult.getString("rs2")%></td>
			<td><%= rscult.getString("rs3")%></td>
			<td><%= rscult.getString("rs4")%></td>
			<td><%= rscult.getString("rsc")%></td>

			<td><a style="text-decoration: none; color: black"
				href="AMDPreg?categoria=c&id=<%= rscult.getString("id_pregunta")%>&opcion=mod">Modificar</a>
				<i class="fa fa-edit" aria-hidden="true"></i> <a
				style="text-decoration: none; color: black"
				href="AMDPreg?categoria=c&id=<%= rscult.getString("id_pregunta")%>&opcion=del">
					Eliminar<i class="fa fa-trash" aria-hidden="true"></i>
			</a></td>
		</tr>
		

		<%  } rscult.close();%>
		</table>
	
		<table>
		<caption>
			<b> Lista de preguntas Matemáticas </b>
		</caption>
		
	
		<% sql = "SELECT * FROM categoria_maths order by  pregunta asc ";
	ResultSet rsmath = st.executeQuery(sql); %>

		<% while(rsmath.next()){ %>
		<tr>
			<td><%=  rsmath.getString("pregunta")%></td>
			<td><%= rsmath.getString("rs1")%></td>
			<td><%= rsmath.getString("rs2")%></td>
			<td><%= rsmath.getString("rs3")%></td>
			<td><%= rsmath.getString("rs4")%></td>
			<td><%= rsmath.getString("rsc")%></td>
			
			
			<td><a style="text-decoration: none; color: black"
				href="AMDPreg?categoria=m&id=<%= rsmath.getString("id_pregunta")%>&opcion=mod">Modificar</a>
				<i class="fa fa-edit" aria-hidden="true"></i> <a
				style="text-decoration: none; color: black"
				href="AMDPreg?categoria=m&id=<%= rsmath.getString("id_pregunta")%>&opcion=del">
					Eliminar<i class="fa fa-trash" aria-hidden="true"></i>
			</a></td>
			
		</tr>
		<%} rsmath.close();%>
		</table>
	
		
		<table>
		<caption>
			<b> Lista de preguntas Programación </b>
		</caption>
		
		<%sql = "SELECT * FROM categoria_programacion order by  pregunta asc";
	ResultSet rsprog = st.executeQuery(sql); %>
		<% while(rsprog.next()){ %>
		<tr>
			<td><%= rsprog.getString("pregunta")%></td>
			<td><%=  rsprog.getString("rs1")%></td>
			<td><%=  rsprog.getString("rs2")%></td>
			<td><%= rsprog.getString("rs3")%></td>
			<td><%= rsprog.getString("rs4")%></td>
			<td><%= rsprog.getString("rsc")%></td>

	<td><a style="text-decoration: none; color: black"
				href="AMDPreg?categoria=p&id=<%= rsprog.getString("id_pregunta")%>&opcion=mod">Modificar</a>
				<i class="fa fa-edit" aria-hidden="true"></i> <a
				style="text-decoration: none; color: black"
				href="AMDPreg?categoria=p&id=<%= rsprog.getString("id_pregunta")%>&opcion=del">
					Eliminar<i class="fa fa-trash" aria-hidden="true"></i>
			</a></td>
		</tr>
		<%} rsprog.close(); %>
	</table>

</div>
</body>
</html>