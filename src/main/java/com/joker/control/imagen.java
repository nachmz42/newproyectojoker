package com.joker.control;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class imagen
 */
@WebServlet("/imagen")
public class imagen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public imagen() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
	HttpSession sesion= request.getSession(); 
	InputStream img = (InputStream) sesion.getAttribute("img");
	int tamanoInput = img.available();
	byte[] datosImagen = new byte[tamanoInput];
	img.read(datosImagen,0,tamanoInput);
	response.getOutputStream().write(datosImagen);
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion= request.getSession(); 
		InputStream img = (InputStream) sesion.getAttribute("img");
		int tamanoInput = img.available();
		byte[] datosImagen = new byte[tamanoInput];
		img.read(datosImagen,0,tamanoInput);
		response.getOutputStream().write(datosImagen);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
