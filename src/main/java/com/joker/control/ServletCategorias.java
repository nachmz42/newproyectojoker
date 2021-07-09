package com.joker.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joker.modelo.PreguntaDAO;
import java.sql.Timestamp;



/**
 * Servlet implementation class ServletCategorias
 */
@WebServlet("/ServletCategorias")
public class ServletCategorias extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Long datetime = System.currentTimeMillis();
		Timestamp fin = new Timestamp(datetime);
		Long miliFin = fin.getTime();
		System.out.println(miliFin);
		String miliI = request.getParameter("inicial");
		System.out.println(miliI);
		Long  miliInicio = Long.valueOf(miliI);
		
		Long tiempoTotal = miliFin - miliInicio;
		Long segundosTotal = tiempoTotal/1000;
		int segsTotal = Math.toIntExact(segundosTotal);
		int minTotal = segsTotal/60;
		int horaTotal = minTotal/60;
		int segsTotalReal = segsTotal - minTotal*60;
		int minTotalReal = minTotal - horaTotal*60;
		String min = String.valueOf(minTotalReal);
		String horas = String.valueOf(horaTotal);
		String segs = String.valueOf(segsTotalReal);
		String tiempo = horas+":"+min+":"+segs;
		
		int puntuacion= 0;
		String rs1,rs2,rs3,rs4,rs5,rs6,rs7,rs8,rs9,rs10;
		String rsc1,rsc2,rsc3,rsc4,rsc5,rsc6,rsc7,rsc8,rsc9,rsc10;
		HttpSession sesion = request.getSession();
		String email = (String) sesion.getAttribute("email");
		String nombre = (String) sesion.getAttribute("nombre");
		String ape = (String) sesion.getAttribute("apellidos");
		String cat = request.getParameter("categoria");
		PreguntaDAO pdao = new PreguntaDAO();
	
		
		rs1 = request.getParameter("pregunta1");
		rsc1= request.getParameter("p1rsc");
		rs2 = request.getParameter("pregunta2");
		rsc2= request.getParameter("p2rsc");
		rs3 = request.getParameter("pregunta3");
		rsc3= request.getParameter("p3rsc");
		rs4 = request.getParameter("pregunta4");
		rsc4= request.getParameter("p4rsc");
		rs5 = request.getParameter("pregunta5");
		rsc5= request.getParameter("p5rsc");
		rs6 = request.getParameter("pregunta6");
		rsc6= request.getParameter("p6rsc");
		rs7 = request.getParameter("pregunta7");
		rsc7= request.getParameter("p7rsc");
		rs8 = request.getParameter("pregunta8");
		rsc8= request.getParameter("p8rsc");
		rs9= request.getParameter("pregunta9");
		rsc9= request.getParameter("p9rsc");
		rs10 = request.getParameter("pregunta10");
		rsc10= request.getParameter("p10rsc");
		String respuestas[] = {rs1,rs2,rs3,rs4,rs5,rs6,rs7,rs8,rs9,rs10};
		String respcorrectas[] = { rsc1,rsc2,rsc3,rsc4,rsc5,rsc6,rsc7,rsc8,rsc9,rsc10};

		for(int i = 0; i<=9;i++) {
			if(respuestas[i].equals(respcorrectas[i])) {
				System.out.println("Respuesta correcta: " + respuestas[i] );
				System.out.println(respcorrectas[i]+ "------" + respuestas[i] );
				puntuacion ++;
			}else {
				System.out.println("Respuesta incorrecta: " + respuestas[i] );
				System.out.println(respcorrectas[i]+ "------" + respuestas[i] );
			}
		}
		pdao.rankear(email,nombre,cat,ape,puntuacion,tiempo);
		request.setAttribute("puntuacion", puntuacion);
		request.setAttribute("tiempo", tiempo);
		RequestDispatcher rd = request.getRequestDispatcher("puntuacion.jsp");
		rd.forward(request, response);
		
	
	}
	
	

}

