package com.joker.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joker.modelo.UsuarioDAO;


@WebServlet("/ServletSugerencia")
public class ServletSugerencia extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String  nombre;
		String  apellidos;
		String  email;
		String  sugerencias;
		String pageDest= "usuarios.jsp";
		
		HttpSession sesion = request.getSession();

		 email = (String) sesion.getAttribute("email");

		nombre = (String) sesion.getAttribute("nombre");

		 apellidos= (String) sesion.getAttribute("apellidos");
		 
		 sugerencias= request.getParameter("sugerencia");
		 
		 UsuarioDAO udao= new UsuarioDAO();
		 
		 udao.Sugerencia(nombre, apellidos, email, sugerencias);
		 
		 
		 RequestDispatcher rd = request.getRequestDispatcher(pageDest);

			rd.forward(request, response);
	}

}
