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
<title>Random</title>
<link rel="stylesheet" href="STYLE/css/culturaGeneral.css"></link>
</head>
<body>

<% 
	Long datetime = System.currentTimeMillis();
	Timestamp inicio = new Timestamp(datetime);
	Long inicial = inicio.getTime();
	String ini = String.valueOf(inicial);
	
	Connection con = Conexion.getInstance().getConnection();
	String SQL = "Select MAX(id_pregunta) as id_pregunta from categoria_cultura";
	Statement st = con.createStatement();
	
	ResultSet rs = st.executeQuery(SQL);
	ResultSet rspregs;
	
	PreguntaDAO pdao = new PreguntaDAO();
	int elegidasCult[] = new int[3];	
	Pregunta pregsCult[] = new Pregunta[3];
	
	int elegidasMaths[] = new int[3];	
	Pregunta pregsMaths[] = new Pregunta[3];
	
	int elegidasProg[] = new int[3];	
	Pregunta pregsProg[] = new Pregunta[3];
	
	int idmaxCult = 0;
	
	while(rs.next()){
		idmaxCult = rs.getInt("id_pregunta");
	}
	
	SQL = "Select MAX(id_pregunta) as id_pregunta from categoria_maths";
	ResultSet rsMaths = st.executeQuery(SQL);
	int idmaxMaths = 0;
	
	while(rsMaths.next()){
		idmaxMaths = rsMaths.getInt("id_pregunta");
	}
	SQL = "Select MAX(id_pregunta) as id_pregunta from categoria_maths";
	ResultSet rsProg = st.executeQuery(SQL);
	
	int idmaxProg = 0;
	
	while(rsProg.next()){
		idmaxProg = rsProg.getInt("id_pregunta");
	}
	int xCult;
	double iCult = Math.random()*(idmaxCult)+1;
	xCult = (int) iCult;
	
	int xMaths;
	double iMaths = Math.random()*(idmaxMaths)+1;
	xMaths = (int) iMaths;
	
	int xProg;
	double iProg = Math.random()*(idmaxProg)+1;
	xProg = (int) iProg;
	
	for(int w = 0; w<=2; w++){
		while(true) {
			
			
			iCult = Math.random()*(idmaxCult)+1;
			xCult = (int) iCult;

			if(pdao.check(elegidasCult,xCult)) {
			}else {
				elegidasCult[w] = xCult;
				break;
			}
		}
	}
	
	for(int w = 0; w<=2; w++){
		while(true) {
			
			
			iMaths = Math.random()*(idmaxMaths)+1;
			xMaths = (int) iMaths;

			if(pdao.check(elegidasMaths,xMaths)) {
			}else {
				elegidasMaths[w] = xMaths;
				break;
			}
		}
	}
	
	for(int w = 0; w<=2; w++){
		while(true) {
			
			
			iProg = Math.random()*(idmaxProg)+1;
			xProg = (int) iProg;

			if(pdao.check(elegidasProg,xProg)) {
			}else {
				elegidasProg[w] = xProg;
				break;
			}
		}
	}
	
	String sql="Select * from categoria_cultura where id_pregunta = ?";
	PreparedStatement pst = con.prepareStatement(sql);
	
	for(int z=0; z<=2;z++){
		pst.setString(1,String.valueOf(elegidasCult[z]));
		rspregs = pst.executeQuery();
		while(rspregs.next()){
			
			pregsCult[z] = new Pregunta();
			pregsCult[z].setPregunta(rspregs.getString("pregunta"));
			pregsCult[z].setRs1(rspregs.getString("rs1"));
			pregsCult[z].setRs2(rspregs.getString("rs2"));
			pregsCult[z].setRs3(rspregs.getString("rs3"));
			pregsCult[z].setRs4(rspregs.getString("rs4"));
			pregsCult[z].setRsc(rspregs.getString("rsc"));
			pregsCult[z].setId(elegidasCult[z]);
			break;			
		}
	}
	
	sql="Select * from categoria_maths where id_pregunta = ?";
	pst = con.prepareStatement(sql);
	
	for(int z=0; z<=2;z++){
		pst.setString(1,String.valueOf(elegidasMaths[z]));
		rspregs = pst.executeQuery();
		while(rspregs.next()){
			
			pregsMaths[z] = new Pregunta();
			pregsMaths[z].setPregunta(rspregs.getString("pregunta"));
			pregsMaths[z].setRs1(rspregs.getString("rs1"));
			pregsMaths[z].setRs2(rspregs.getString("rs2"));
			pregsMaths[z].setRs3(rspregs.getString("rs3"));
			pregsMaths[z].setRs4(rspregs.getString("rs4"));
			pregsMaths[z].setRsc(rspregs.getString("rsc"));
			pregsMaths[z].setId(elegidasMaths[z]);
			break;			
		}
	}
	
	sql="Select * from categoria_programacion where id_pregunta = ?";
	pst = con.prepareStatement(sql);
	
	for(int z=0; z<=2;z++){
		pst.setString(1,String.valueOf(elegidasProg[z]));
		rspregs = pst.executeQuery();
		while(rspregs.next()){
			
			pregsProg[z] = new Pregunta();
			pregsProg[z].setPregunta(rspregs.getString("pregunta"));
			pregsProg[z].setRs1(rspregs.getString("rs1"));
			pregsProg[z].setRs2(rspregs.getString("rs2"));
			pregsProg[z].setRs3(rspregs.getString("rs3"));
			pregsProg[z].setRs4(rspregs.getString("rs4"));
			pregsProg[z].setRsc(rspregs.getString("rsc"));
			pregsProg[z].setId(elegidasMaths[z]);
			break;			
		}
	}
	
	
%>

	<form action="ServletCategorias" method="post">
	<input type="hidden" name="inicial" value="<%=ini%>">
	
	<h1 id="titulo">Random quiz!</h1>
		<h4>concentrate!  vas a necitarlo para este quiz random!</h4>
	<br>
	<p class="pregunta"> <%=pregsCult[0].getPregunta() %></p>
	
	<select name="pregunta1" class="select" id="slct">

    	<option value=<%=pregsCult[0].getRs1() %>><%=pregsCult[0].getRs1() %></option>
    	<option value=<%=pregsCult[0].getRs2() %>><%=pregsCult[0].getRs2() %></option>
    	<option value=<%=pregsCult[0].getRs3() %>><%=pregsCult[0].getRs3() %></option>
    	<option value=<%=pregsCult[0].getRs4() %>><%=pregsCult[0].getRs4() %></option>
		
  	</select>
  	<input type="hidden" name="p1rsc" value=<%= pregsCult[0].getRsc()%>>
  	<br>
  	<p class="pregunta"> <%=pregsMaths[0].getPregunta() %></p>
	
	<select name="pregunta2" class="select" id="slct">

    	<option value=<%=pregsMaths[0].getRs1() %>><%=pregsMaths[0].getRs1() %></option>
    	<option value=<%=pregsMaths[0].getRs2() %>><%=pregsMaths[0].getRs2() %></option>
    	<option value=<%=pregsMaths[0].getRs3() %>><%=pregsMaths[0].getRs3() %></option>
    	<option value=<%=pregsMaths[0].getRs4() %>><%=pregsMaths[0].getRs4() %></option>
		
  	</select>
  	<input type="hidden" name="p2rsc" value=<%= pregsMaths[0].getRsc()%>>
	<br>
  	
  	<p class="pregunta"> <%=pregsProg[0].getPregunta() %></p>
	
	<select name="pregunta3" class="select" id="slct">

    	<option value=<%=pregsProg[0].getRs1() %>><%=pregsProg[0].getRs1() %></option>
    	<option value=<%=pregsProg[0].getRs2() %>><%=pregsProg[0].getRs2() %></option>
    	<option value=<%=pregsProg[0].getRs3() %>><%=pregsProg[0].getRs3() %></option>
    	<option value=<%=pregsProg[0].getRs4() %>><%=pregsProg[0].getRs4() %></option>
		
  	</select>
  	<input type="hidden" name="p3rsc" value=<%= pregsProg[0].getRsc()%>>
  	<br>
  		<p class="pregunta"> <%=pregsCult[1].getPregunta() %></p>
	
	<select name="pregunta4" class="select" id="slct">

    	<option value=<%=pregsCult[1].getRs1() %>><%=pregsCult[1].getRs1() %></option>
    	<option value=<%=pregsCult[1].getRs2() %>><%=pregsCult[1].getRs2() %></option>
    	<option value=<%=pregsCult[1].getRs3() %>><%=pregsCult[1].getRs3() %></option>
    	<option value=<%=pregsCult[1].getRs4() %>><%=pregsCult[1].getRs4() %></option>
		
  	</select>
  	<input type="hidden" name="p4rsc" value=<%= pregsCult[1].getRsc()%>>
  	<br>
  	<p class="pregunta"> <%=pregsMaths[1].getPregunta() %></p>
	
	<select name="pregunta5" class="select" id="slct">

    	<option value=<%=pregsMaths[1].getRs1() %>><%=pregsMaths[1].getRs1() %></option>
    	<option value=<%=pregsMaths[1].getRs2() %>><%=pregsMaths[1].getRs2() %></option>
    	<option value=<%=pregsMaths[1].getRs3() %>><%=pregsMaths[1].getRs3() %></option>
    	<option value=<%=pregsMaths[1].getRs4() %>><%=pregsMaths[1].getRs4() %></option>
		
  	</select>
  	<input type="hidden" name="p5rsc" value=<%= pregsMaths[1].getRsc()%>>
	<br>
  	
  	<p class="pregunta"> <%=pregsProg[1].getPregunta() %></p>
	<br>
	<select name="pregunta6" class="select" id="slct">

    	<option value=<%=pregsProg[1].getRs1() %>><%=pregsProg[1].getRs1() %></option>
    	<option value=<%=pregsProg[1].getRs2() %>><%=pregsProg[1].getRs2() %></option>
    	<option value=<%=pregsProg[1].getRs3() %>><%=pregsProg[1].getRs3() %></option>
    	<option value=<%=pregsProg[1].getRs4() %>><%=pregsProg[1].getRs4() %></option>
		
  	</select>
  	<input type="hidden" name="p6rsc" value=<%= pregsProg[1].getRsc()%>>
  	<br>
  		<p class="pregunta"> <%=pregsCult[2].getPregunta() %></p>
	
	<select name="pregunta7" class="select" id="slct">

    	<option value=<%=pregsCult[2].getRs1() %>><%=pregsCult[2].getRs1() %></option>
    	<option value=<%=pregsCult[2].getRs2() %>><%=pregsCult[2].getRs2() %></option>
    	<option value=<%=pregsCult[2].getRs3() %>><%=pregsCult[2].getRs3() %></option>
    	<option value=<%=pregsCult[2].getRs4() %>><%=pregsCult[2].getRs4() %></option>
		
  	</select>
  	<input type="hidden" name="p7rsc" value=<%= pregsCult[2].getRsc()%>>
  	
  	<p class="pregunta"> <%=pregsMaths[2].getPregunta() %></p>
  	<br>
	
	<select name="pregunta8" class="select" id="slct">

    	<option value=<%=pregsMaths[2].getRs1() %>><%=pregsMaths[2].getRs1() %></option>
    	<option value=<%=pregsMaths[2].getRs2() %>><%=pregsMaths[2].getRs2() %></option>
    	<option value=<%=pregsMaths[2].getRs3() %>><%=pregsMaths[2].getRs3() %></option>
    	<option value=<%=pregsMaths[2].getRs4() %>><%=pregsMaths[2].getRs4() %></option>
		
  	</select>
  	<input type="hidden" name="p8rsc" value=<%= pregsMaths[2].getRsc()%>>
  	<br>

  	
  	<p class="pregunta"> <%=pregsProg[2].getPregunta() %></p>
	
	<select name="pregunta9" class="select" id="slct">

    	<option value=<%=pregsProg[2].getRs1() %>><%=pregsProg[2].getRs1() %></option>
    	<option value=<%=pregsProg[2].getRs2() %>><%=pregsProg[2].getRs2() %></option>
    	<option value=<%=pregsProg[2].getRs3() %>><%=pregsProg[2].getRs3() %></option>
    	<option value=<%=pregsProg[2].getRs4() %>><%=pregsProg[2].getRs4() %></option>
		
  	</select>
  	<br>
  	<input type="hidden" name="p9rsc" value=<%= pregsProg[2].getRsc()%>>
  	<input type="hidden" name="pregunta10" value="Sí">
  	<input type="hidden" name="p10rsc" value="No">
  	
  	<input type="hidden" name="categoria" value="Random">	
  	<button class="boton" type="submit" value="Enviar Respuestas">Enviar Respuestas</button>
  	</form>
  	
  	
</body>
</html>