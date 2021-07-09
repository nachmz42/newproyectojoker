package com.joker.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.joker.modelo.Usuario;
import com.joker.modelo.UsuarioDAO;



@WebServlet("/ServletEliminarusuario")
public class ServletEliminarusuario extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsuarioDAO udao = new UsuarioDAO();
		
		String email = request.getParameter("email");
		Usuario u = udao.getUser(email);
		
		
		String pass = u.getPass();
		
		udao.BorrarUsuario(email, pass);
		
		RequestDispatcher rd = request.getRequestDispatcher("listado.jsp");
		rd.forward(request, response);
		
	}
 
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		boolean rs= true;
		String email= request.getParameter("email");
		String password= request.getParameter("password");
		
		
		
		UsuarioDAO usudao= new UsuarioDAO();
		
		rs=usudao.BorrarUsuario(email,password);
		
		
		
		System.out.println("EMAIL: " + email);
		System.out.println("PASSWORD: " + password);
		
		
		if(rs=true) {
			request.getSession().setAttribute("Mensaje", "Usuario modificado correctamente");
		}else {
			request.getSession().setAttribute("Mensaje", "Error, usuario no se ha podido modificar");
			response.sendRedirect("eliminarusuario.jsp");
			
			
		}
		response.sendRedirect("admin.jsp");
		
	}

}
