package dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.AutorDAO;
import entity.Autor;
import entity.Grado;
import util.FechaUtil;
import util.MySqlDBConexion;

public class MySqlAutorDAO implements AutorDAO{
	private static Logger log = Logger.getLogger(MySqlAutorDAO.class.getName());
	
	public int insertaAutor(Autor  obj) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into autor values(null,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombres());
			pstm.setString(2, obj.getApellidos());
			pstm.setDate(3, obj.getFechaNacimiento());
			pstm.setString(4, obj.getTelefono());
			pstm.setTimestamp(5, obj.getFechaRegistro());
			pstm.setInt(6, obj.getEstado());
			pstm.setInt(7, obj.getGrado().getIdGrado());
			log.info(">>>> " + pstm);
			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return salida;
	}

	@Override
	public List<Autor> listaAutor(String filtro) {
		List<Autor> lista = new ArrayList<Autor>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
				conn = MySqlDBConexion.getConexion();
				String sql = "select a.*, ga.descripcion from autor a "
						+ "inner join grado_autor ga on a.idGrado = ga.idGrado "
						+ "where a.nombres like ? ";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, filtro);
				
				log.info(">>>>" + pstm);
				
				rs = pstm.executeQuery();
				Autor objAutor = null;
				Grado objGrado = null;
				while(rs.next()) {
					objAutor = new Autor();
					objAutor.setIdAutor(rs.getInt(1));
					objAutor.setNombres(rs.getString(2));
					objAutor.setApellidos(rs.getString(3));
					objAutor.setFechaNacimiento(rs.getDate(4));
					objAutor.setTelefono(rs.getString(5));
					objAutor.setFechaRegistro(rs.getTimestamp(6));
					objAutor.setEstado(rs.getInt(7));
					objAutor.setFormateadoFecNac(FechaUtil.getFechaFormateadaYYYYMMdd(rs.getDate(4)));
					objGrado = new Grado();
					objGrado.setIdGrado(rs.getInt(8));
					objGrado.setDescripcion(rs.getString(9));
					objAutor.setGrado(objGrado);
					
					lista.add(objAutor);
		}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) pstm.close();
		
			}catch (Exception e2) {}
				
		}
		return lista;
	}

	@Override
	public int actualizaAutor(Autor obj) {
int salida = -1;
	
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
		
			String sql = "Update autor set nombres=?, apellidos=?, fechaNacimiento=?, telefono=?, estado=?, idGrado=? where idAutor=?";
			
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombres());
			pstm.setString(2, obj.getApellidos());
			pstm.setDate(3, obj.getFechaNacimiento());
			pstm.setString(4, obj.getTelefono());
			pstm.setInt(5, obj.getEstado());
			pstm.setInt(6, obj.getGrado().getIdGrado());
			pstm.setInt(7, obj.getIdAutor());
			
			log.info(">>>> " + pstm);

			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return salida;
	}

	@Override
	public int eliminaAutor(int idAutor) {
int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "delete from autor where idAutor = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idAutor);
			
			
			log.info(">>>> " + pstm);

			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return salida;
	}

	@Override
	public Autor buscaAutor(int idAutor) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Autor objAutor = null;
		try {
				conn = MySqlDBConexion.getConexion();
				String sql = "select cl.*, ca.descripcion FROM autor cl "
						+ "inner join grado_autor ca on cl.idGrado = ca.idGrado "
						+ "where cl.nombres like = ? ";
				pstm = conn.prepareStatement(sql);
				pstm.setInt(1, idAutor);
				log.info(">>>>" + pstm);
				rs =pstm.executeQuery();
				
				Grado objGrado = null;
				while(rs.next()) {
					objAutor = new Autor();
					objAutor.setIdAutor(rs.getInt(1));
					objAutor.setNombres(rs.getString(2));
					objAutor.setApellidos(rs.getString(3));
					objAutor.setFechaNacimiento(rs.getDate(4));
					objAutor.setTelefono(rs.getString(5));
					objAutor.setFechaRegistro(rs.getTimestamp(6));
					objAutor.setEstado(rs.getInt(7));
					objGrado = new Grado();
					objGrado.setIdGrado(rs.getInt(8));
					objGrado.setDescripcion(rs.getString(9));
					objAutor.setGrado(objGrado);
				
		}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) pstm.close();
		
			}catch (Exception e2) {}
				
		}
		return objAutor;
	}

	@Override
	public List<Autor> consultaAutor(String nombre, int idGrado, int idEstado, Date fecInicio, Date fecFin) {
		List<Autor> lista = new ArrayList<Autor>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "SELECT cl.*, ca.descripcion FROM autor cl inner join grado_autor ca "
					+ "on cl.idGrado = ca.idGrado "
					+ "where 1=1 "
					+ "and cl.nombres like ? "
					+ "and ( ? = -1 or cl.idGrado = ? ) "
					+ "and cl.estado = ? "
					+ "and cl.fechaNacimiento >= ? "
					+ "and cl.fechaNacimiento <= ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, nombre);
			pstm.setInt(2, idGrado);
			pstm.setInt(3, idGrado);
			pstm.setInt(4, idEstado);
			pstm.setDate(5, fecInicio);
			pstm.setDate(6, fecFin);
			log.info(">>>> " + pstm);
			rs = pstm.executeQuery();
			Autor objAutor = null;
			Grado objGrado = null;
			while(rs.next()) {
				objAutor = new Autor();
				objAutor.setIdAutor(rs.getInt(1));
				objAutor.setNombres(rs.getString(2));
				objAutor.setApellidos(rs.getString(3));
				objAutor.setFechaNacimiento(rs.getDate(4));
				objAutor.setTelefono(rs.getString(5));
				objAutor.setFechaRegistro(rs.getTimestamp(6));
				objAutor.setEstado(rs.getInt(7));
				objAutor.setFormateadoFecNac(FechaUtil.getFechaFormateadaYYYYMMdd(rs.getDate(4)));
				objGrado = new Grado();
				objGrado.setIdGrado(rs.getInt(8));
				objGrado.setDescripcion(rs.getString(9));
				objAutor.setGrado(objGrado);
				lista.add(objAutor);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return lista;
	}
	
}
