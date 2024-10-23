package com.unu.proyectoWebGB.models;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.unu.proyectoWebGB.beans.*;

public class AutoresModel extends Conexion {
	CallableStatement cs;
	ResultSet rs;

	/*
	 * ArrayList<Autor> autores = new ArrayList<>(); autores.add(new
	 * Autor(1,"García Marquez", "Colombiano")); autores.add(new Autor(2,"Borges",
	 * "Argentina")); autores.add(new Autor(3,"Allende", "Chilena")); return
	 * autores;
	 */

	public List<Autor> listarAutores() throws SQLException {
		try {
			List<Autor> lista = new ArrayList<>();
			String sql = "CALL sp_listarAutor()";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			while (rs.next()) {
				Autor autor = new Autor();
				autor.setIdAutor(rs.getInt("idautores"));
				autor.setNombre(rs.getString("nombre_autor"));
				autor.setNacionalidad(rs.getString("nacionalidad_autor"));
				lista.add(autor);
			}
			this.cerrarConexion();
			return lista;
		} catch (SQLException ex) {
			ex.printStackTrace();
			this.cerrarConexion();
			;
			return null;
		}
	}

}
