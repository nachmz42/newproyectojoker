package com.joker.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.joker.services.Conexion;

public class Pregunta extends Object{
	String pregunta,rs1,rs2,rs3,rs4,rsc;
	int id;

	
	//ToString

	@Override
	public String toString() {
		return "Pregunta [pregunta=" + pregunta + ", rs1=" + rs1 + ", rs2=" + rs2 + ", rs3=" + rs3 + ", rs4=" + rs4
				+ ", rsc=" + rsc + ", id=" + id + "]";
	}

	
	//GETTERS Y SETTERS
	
	public String getPregunta() {
		return pregunta;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}

	public void setPregunta(String pregunta) {
		this.pregunta = pregunta;
	}

	public String getRs1() {
		return rs1;
	}

	public void setRs1(String rs1) {
		this.rs1 = rs1;
	}

	public String getRs2() {
		return rs2;
	}

	public void setRs2(String rs2) {
		this.rs2 = rs2;
	}

	public String getRs3() {
		return rs3;
	}

	public void setRs3(String rs3) {
		this.rs3 = rs3;
	}

	public String getRs4() {
		return rs4;
	}

	public void setRs4(String rs4) {
		this.rs4 = rs4;
	}

	public String getRsc() {
		return rsc;
	}

	public void setRsc(String rsc) {
		this.rsc = rsc;
	}
	
	
	//CONSTRUCTORES
	public Pregunta() {

	}
	

	public Pregunta(String pregunta, String rs1, String rs2, String rs3, String rs4, String rsc, int id) {
		super();
		this.pregunta = pregunta;
		this.rs1 = rs1;
		this.rs2 = rs2;
		this.rs3 = rs3;
		this.rs4 = rs4;
		this.rsc = rsc;
		this.id = id;
	}


	//MÉTODOS
	

	
	
	
}
