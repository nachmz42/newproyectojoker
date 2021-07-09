package com.joker.control;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.joker.modelo.Usuario;
import com.joker.modelo.UsuarioDAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletResgistro")
@MultipartConfig(maxFileSize = 16177215)  // upload file's size up to 16MB
public class ServletResgistro extends HttpServlet {
	
  
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean rs= true;
		String nombre= request.getParameter("nombre");
		String apellidos= request.getParameter("apellidos");
		String email= request.getParameter("email");
		String password= request.getParameter("password");
		String rol= request.getParameter("rol");
		String edad= request.getParameter("edad");
		
		Part filePart = request.getPart("fichero");
		Long size = filePart.getSize();
		System.out.println(size);
		int edadNum= Integer.parseInt(edad);
		InputStream img = filePart.getInputStream();
		
		Usuario usu;
		//Creamos el objeto Usuario con los dstos recuperados del formulario
		if(size==0) {
			usu= new Usuario(nombre,apellidos,edadNum,email,password,rol);
		}else {
			usu= new Usuario(nombre,apellidos,edadNum,email,password,rol,img);
		}
		
		
		UsuarioDAO usudao= new UsuarioDAO();
		
		// Creamos el objeto Usuario
	
		
		// invocamos al método creando el objeto usu
		
		
		rs=usudao.altaUsuario(usu);
		
		
		System.out.println("NOMBRE: " + nombre);
		System.out.println("APELLIDOS : " + apellidos);
		System.out.println("EMAIL: " + email);
		System.out.println("PASSWORD: " + password);
		System.out.println("EDAD: " + edadNum);
		
		
		if(rs== true) {
			
			response.sendRedirect("login.jsp");
			
		}else {
			
			HttpSession sesion= request.getSession();
			String msgerror = "usuario no se ha creado, el correo introducido ya existe";
			sesion.setAttribute("msgerror", msgerror);
			response.sendRedirect("registro.jsp");
			}
			
		}
		
		
		
}


