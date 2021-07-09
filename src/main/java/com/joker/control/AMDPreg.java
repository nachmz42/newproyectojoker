package com.joker.control;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joker.modelo.PreguntaDAO;
import com.joker.modelo.Pregunta;





@WebServlet("/AMDPreg")
public class AMDPreg extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cat = request.getParameter("categoria");
		System.out.println(cat);
		String accion = request.getParameter("opcion");
		int id2 =Integer.parseInt(request.getParameter("id"));
		String id = request.getParameter("id");
		String pageDest = "";
		PreguntaDAO pdao = new PreguntaDAO();
		request.setAttribute("id", id);
		request.setAttribute("categoria", cat);
		if(accion.equals("mod")) {
			pageDest="formModPreg.jsp";
			Pregunta p = pdao.getPregunta(id2, cat);
			request.setAttribute("pregunta", p);
			request.setAttribute("cat", cat);
			
		}else {
			if(accion.equals("del")) {
				pdao.delPregunta(id2, cat);
				pageDest="AMDPregTabla.jsp";
			}
		}
		RequestDispatcher rd = request.getRequestDispatcher(pageDest);
		rd.forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		if(op.equals("m")) {
			String cat = request.getParameter("categoria");		
			int id =Integer.parseInt(request.getParameter("id"));
			PreguntaDAO pdao = new PreguntaDAO();
			Pregunta preg = null;
			String pageDest = "AMDPregTabla.jsp";
			
			String pregunta = request.getParameter("pregunta");
			String rs1 = request.getParameter("rs1");
			String rs2 = request.getParameter("rs2");
			String rs3 = request.getParameter("rs3");
			String rs4 = request.getParameter("rs4");
			String rsc = request.getParameter("rsc");
			preg = new Pregunta(pregunta,rs1,rs2,rs3,rs4,rsc,id);
			
			pdao.modPregunta(preg, cat);
			
			RequestDispatcher rd = request.getRequestDispatcher(pageDest);
			rd.forward(request, response);
		}else { if(op.equals("a")) {
			String cat = request.getParameter("cat");
			int id =Integer.parseInt(request.getParameter("id"));
			PreguntaDAO pdao = new PreguntaDAO();
			Pregunta preg = null;
			String pageDest = "AMDPregTabla.jsp";
			
			String pregunta = request.getParameter("pregunta");
			String rs1 = request.getParameter("rs1");
			String rs2 = request.getParameter("rs2");
			String rs3 = request.getParameter("rs3");
			String rs4 = request.getParameter("rs4");
			String rsc = request.getParameter("rsc");
			preg = new Pregunta(pregunta,rs1,rs2,rs3,rs4,rsc,id);
			pdao.altaPregunta(preg, cat);
			RequestDispatcher rd = request.getRequestDispatcher(pageDest);
			rd.forward(request, response);
			
			}
			
		}
		
	}

}
