package com.joker.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexion {
	
	private static Conexion instancia;
    private Connection connection;

    
    private String url = "jdbc:mysql://db4free.net:3306/midatabase42?serverTimezone=UTC";


    private String username = "nachmz42";
    private String password = "ignacio15";

    private Conexion() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException ex) {
            System.out.println("Conexion a BD incorrecta : " + ex.getMessage());
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public static Conexion getInstance() throws SQLException {
        if (instancia == null) {
        	instancia = new Conexion();
        } else if (instancia.getConnection().isClosed()) {
        	instancia = new Conexion();
        }

        return instancia;
    }
}