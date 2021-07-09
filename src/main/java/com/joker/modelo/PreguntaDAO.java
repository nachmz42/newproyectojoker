package com.joker.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.joker.services.Conexion;

public class PreguntaDAO {
	public Pregunta getPregunta(int id, String opcion) {
		String SQL = "";
		Pregunta p = new Pregunta();
		
		try {
			Connection con = Conexion.getInstance().getConnection();
			if(opcion.equals("m")) {
				SQL ="Select * from categoria_maths where id_pregunta=?";
			}else {if(opcion.equals("c")) {
				SQL ="Select * from categoria_cultura where id_pregunta=?";
			}else {if(opcion.equals("p")) {
				SQL ="Select * from categoria_programacion where id_pregunta=?";
						}
					}
				}
			PreparedStatement pst = con.prepareStatement(SQL);

			pst.setInt(1,id);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				p.setId(id);
				p.setPregunta(rs.getString("pregunta"));
				p.setRs1(rs.getString("rs1"));
				p.setRs2(rs.getString("rs2"));
				p.setRs3(rs.getString("rs3"));
				p.setRs4(rs.getString("rs4"));
				p.setRsc(rs.getString("rsc"));
				
			}
			
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return p;
	
	}
	
	public void modPregunta(Pregunta preg, String opcion) {
		String SQL = "";
		try {
			Connection con = Conexion.getInstance().getConnection();
			if(opcion.equals("m")) {
				SQL ="Update categoria_maths set pregunta = ?,rs1=?,rs2=?,rs3=?,rs4=?,rsc=? where id_pregunta=?";
			}else {if(opcion.equals("c")) {
				SQL ="Update categoria_cultura set pregunta = ?,rs1=?,rs2=?,rs3=?,rs4=?,rsc=? where id_pregunta=?";
			}else {if(opcion.equals("p")) {
				SQL ="Update categoria_programacion set pregunta = ?,rs1=?,rs2=?,rs3=?,rs4=?,rsc=? where id_pregunta=?";
						}
					}
				}
			PreparedStatement pst = con.prepareStatement(SQL);
			pst.setString(1, preg.getPregunta());
			pst.setString(2, preg.getRs1());
			pst.setString(3, preg.getRs2());
			pst.setString(4, preg.getRs3());
			pst.setString(5, preg.getRs4());
			pst.setString(6, preg.getRsc());
			pst.setInt(7, preg.getId());
			
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void delPregunta(int id,String opcion) {
		
		String SQL = "";
		try {
			Connection con = Conexion.getInstance().getConnection();
			if(opcion.equals("m")) {
				SQL ="Delete from categoria_maths where id_pregunta=?";
			}else {if(opcion.equals("c")) {
				SQL ="Delete from categoria_cultura where id_pregunta=?";
			}else {if(opcion.equals("p")) {
				SQL ="Delete from categoria_programacion where id_pregunta=? ";
						}
					}
				}
		PreparedStatement pst = con.prepareStatement(SQL);
		pst.setInt(1,id);
		pst.executeUpdate();
		String sql1 ="";
		String sql2 ="";
		String sql3 ="";
		
		
		if(opcion.equals("c")) {
			sql1 ="ALTER TABLE `categoria_cultura` DROP `id_pregunta`";
			sql2 ="ALTER TABLE `categoria_cultura` AUTO_INCREMENT = 1";
			sql3 ="ALTER TABLE `categoria_cultura` ADD `id_pregunta` int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST";
		}else {if(opcion.equals("m")) {
			sql1 ="ALTER TABLE `categoria_maths` DROP `id_pregunta`";
			sql2 ="ALTER TABLE `categoria_maths` AUTO_INCREMENT = 1";
			sql3 ="ALTER TABLE `categoria_maths` ADD `id_pregunta` int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST";
		}else {if(opcion.equals("p")) {
			sql1 ="ALTER TABLE `categoria_programacion` DROP `id_pregunta`";
			sql2 ="ALTER TABLE `categoria_programacion` AUTO_INCREMENT = 1";
			sql3 ="ALTER TABLE `categoria_programacion` ADD `id_pregunta` int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST";
					}
				}
			}
		Statement st = con.createStatement();
		st.executeUpdate(sql1);
		st.executeUpdate(sql2);
		st.executeUpdate(sql3);
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

	public void altaPregunta(Pregunta preg,String opcion) {
		String SQL ="";
		
		if(opcion.equals("m")) {
			SQL ="Insert into categoria_maths (pregunta,rs1,rs2,rs3,rs4,rsc) values (?,?,?,?,?,?)";
		}else {if(opcion.equals("c")) {
			SQL ="Insert into categoria_cultura (pregunta,rs1,rs2,rs3,rs4,rsc) values (?,?,?,?,?,?)";
		}else {if(opcion.equals("p")) {
			SQL ="Insert into categoria_programacion (pregunta,rs1,rs2,rs3,rs4,rsc) values (?,?,?,?,?,?)";
					}
				}
			}
		try {
			Connection con = Conexion.getInstance().getConnection();
			PreparedStatement pst = con.prepareStatement(SQL);
			pst.setString(1, preg.getPregunta());
			pst.setString(2, preg.getRs1());
			pst.setString(3, preg.getRs2());
			pst.setString(4, preg.getRs3());
			pst.setString(5, preg.getRs4());
			pst.setString(6, preg.getRsc());
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public Boolean check(int[] arr, int toCheckValue)
    {

        boolean test = false;
        for (int element : arr) {
            if (element == toCheckValue) {
                test = true;
                break;
            }
        }
        return test;
    }
	
	public void rankear(String email, String nombre, String categoria, String ape, int puntuacion, String tiempo) {
		
		String SQL = "Insert into ranking (email,nombre,apellidos,categoria,tiempo,puntuacion) "
				+ "values (?,?,?,?,?,?)";
		try {
			Connection con = Conexion.getInstance().getConnection();
			PreparedStatement pst = con.prepareStatement(SQL);
			pst.setString(1,email);
			pst.setString(2,nombre);
			pst.setString(3,ape);
			pst.setString(4,categoria);
			pst.setString(5,tiempo);
			pst.setInt(6,puntuacion);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
}
