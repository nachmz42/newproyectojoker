package com.joker.control;

import java.io.IOException;
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


@WebServlet("/ServletAltausuario")
public class ServletAltausuario extends HttpServlet {
	
  
    

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
		
		
		rs=usudao.altaUsuario(usu);
		
		
		System.out.println("NOMBRE: " + nombre);
		System.out.println("APELLIDOS: " + apellidos);
		System.out.println("EMAIL: " + email);
		System.out.println("PASSWORD: " + password);
		System.out.println("Rol: " + rol);
		System.out.println("EDAD: " + edadNum);
		
		
		if(rs=true) {
			String Mensaje= "Usuario creado correctamente";
			request.getSession().setAttribute("Mensaje", Mensaje);
			response.sendRedirect("admin.jsp");
		}else {
			String Mensaje1= "Error, usuario no se ha podido dar de alta, compruebe correo";
			request.getSession().setAttribute("Mensaje",Mensaje1 );
			response.sendRedirect("admin.jsp");
			
		}
		
		
		
}
}
