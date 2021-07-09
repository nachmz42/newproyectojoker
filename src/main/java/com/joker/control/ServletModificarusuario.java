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

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletModificarusuario")
public class ServletModificarusuario extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsuarioDAO udao = new UsuarioDAO();
		
		String email = request.getParameter("email");
		Usuario u = udao.getUser(email);
		
		request.setAttribute("user", u);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("modificarusuario.jsp");
		rd.forward(request, response);
		
	}
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean rs= true;
		String nombre= request.getParameter("nombre");
		String apellidos= request.getParameter("apellidos");
		String email= request.getParameter("email");
		String password= request.getParameter("password");
		String rol= request.getParameter("rol");
		String edad= request.getParameter("edad");
		int edadNum= Integer.parseInt(edad);
		
		//Creamos el objeto Usuario con los dstos recuperados del formulario
		Usuario usu= new Usuario(nombre,apellidos,edadNum,email,password,rol);
		
		UsuarioDAO usudao= new UsuarioDAO();
		
		// Creamos el objeto Usuario
	
		
		// invocamos al método creando el objeto usu
		
		
		rs=usudao.modificarUsuario(usu);
		
		
		System.out.println("NOMBRE: " + nombre);
		System.out.println("APELLIDOS: " + apellidos);
		System.out.println("EMAIL: " + email);
		System.out.println("PASSWORD: " + password);
		System.out.println("Rol: " + rol);
		System.out.println("EDAD: " + edadNum);
		
		
		if(rs=true) {
			request.getSession().setAttribute("Mensaje", "Usuario modificado correctamente");
		}else {
			request.getSession().setAttribute("Mensaje", "Error, usuario no se ha podido modificar");
			
		}
		response.sendRedirect("listado.jsp");
		
		
}
}
