
package com.joker.modelo;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.Connection;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

import com.joker.services.Conexion;

public class UsuarioDAO {

	private Connection con;

	private PreparedStatement pst;

	private ResultSet rs;

	public Usuario getUser(String email) {
		String sql = "Select * from usuarios where email = ?";
		Usuario u = new Usuario();
		
		try {
			con = Conexion.getInstance().getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				u.setNombre(rs.getString("nombre"));
				
				u.setApellidos(rs.getString("apellidos"));
				
				u.setEdad(rs.getInt("edad"));
				
				u.setEmail(rs.getString("email"));
				
				u.setPass(rs.getString("pass"));
				
				u.setRol(rs.getString("rol"));
				
				
			}
			
			} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
				} return u;
	}

	
	public boolean altaUsuario(Usuario u) {

		String sql = "INSERT INTO usuarios(nombre,apellidos,edad ,email,pass,rol,img) values(?,?,?,?,?,?,?) ";
		

		try {
			con = Conexion.getInstance().getConnection();
			
			pst = con.prepareStatement(sql);

			pst.setString(1, u.getNombre());

			pst.setString(2, u.getApellidos());

			pst.setInt(3, u.getEdad());

			pst.setString(4, u.getEmail());

			pst.setString(5, u.getPass());
			
			pst.setString(6, u.getRol());
			
			pst.setBlob(7, u.getImg());

			pst.executeUpdate();
			
			return true;

		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			
			return false;
		}
		

		
	}

	public boolean modificarUsuario(Usuario u) {

		

		String sql = "UPDATE usuarios  SET nombre= ?, apellidos= ?,edad= ?,pass= ?,rol= ? WHERE email=? ";

		try {
			con = Conexion.getInstance().getConnection();
			
			pst = con.prepareStatement(sql);

			pst.setString(1, u.getNombre());

			pst.setString(2, u.getApellidos());

			pst.setInt(3, u.getEdad());

			pst.setString(4, u.getPass());

			pst.setString(5, u.getRol());
			
			pst.setString(6, u.getEmail());

			pst.executeUpdate();
			
			return true;

		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return false;
		}
	}

	public boolean BorrarUsuario(String email, String pass)  {

		String sql = "DELETE  FROM usuarios where email=? and pass=?";

		try {
			con = Conexion.getInstance().getConnection();
			pst = con.prepareStatement(sql);

			pst.setString(1, email);
			pst.setString(2, pass);
			pst.executeUpdate();
			
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	
		

	}

	public Usuario login(String email, String pass) throws SQLException {

		Usuario u = null;

		String sql = "SELECT * FROM usuarios where email=? and pass=?";

		con = Conexion.getInstance().getConnection();

		pst = con.prepareStatement(sql);

		pst.setString(1, email);
		pst.setString(2, pass);

		rs = pst.executeQuery();

		if (rs.next()) {

			u = new Usuario();

			u.setNombre(rs.getString("nombre"));

			u.setApellidos(rs.getString("apellidos"));

			u.setEdad(rs.getInt("edad"));

			u.setEmail(rs.getString("email"));
			
			u.setPass(rs.getString("pass"));

			u.setRol(rs.getString("rol"));
			
			byte[] b = rs.getBytes("img");
			if(b!=null) {
			InputStream img = new ByteArrayInputStream(b);
			u.setImg(img);
			}

		}

		return u;

	}
	
	public boolean Sugerencia(String nombre, String apellidos, String email, String sugerencia) {

		String sql = "INSERT INTO sugerencias (nombre,apellidos,email,sugerencia) values(?,?,?,?) ";
		

		try {
			con = Conexion.getInstance().getConnection();
			
			pst = con.prepareStatement(sql);

			pst.setString(1,nombre);

			pst.setString(2, apellidos);

			pst.setString(3, email);
			
			pst.setString(4, sugerencia);

			pst.executeUpdate();
			
			return true;

		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return false;
		}
		

		
	}




}
