package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.SalaDAO;
import entity.Sala;
import entity.Sede;
import util.MySqlDBConexion;

public class MySqlSalaDAO implements SalaDAO {
private static Logger log = Logger.getLogger(MySqlSalaDAO.class.getName());
	
	public int insertaSala(Sala  obj) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into sala values (null,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNumero());
			pstm.setInt(2, obj.getPiso());
			pstm.setInt(3, obj.getNumAlumnos());
			pstm.setString(3, obj.getRecursos());
			pstm.setTimestamp(4, obj.getFechaRegistro());
			pstm.setInt(5, obj.getEstado());
			pstm.setInt(6, obj.getSede().getIdSede());
			
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
	public List<Sala> listaSala(String filtro) {
		List<Sala> lista = new ArrayList<Sala>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select r.*, m.numero from sala r inner join sede m on "
					+ " m.idSede= r.idSede "
					+ " where r.nombre like ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, filtro);
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Sala objSala = null;
			Sede objSede = null;
			while(rs.next()) {
				objSala = new Sala ();
				objSala.setIdSala(rs.getInt(1));
				objSala.setNumero(rs.getString(2));
				objSala.setPiso(rs.getInt(3));
				objSala.setNumAlumnos(rs.getInt(4));
				objSala.setRecursos(rs.getString(5));
				objSala.setEstado(rs.getInt(6));
				
				objSede = new Sede();
				objSede.setIdSede(rs.getInt(7));
				objSede.setNombre(rs.getString(8));
				objSala.setSede(objSede);
				
				lista.add(objSala);
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
  
	@Override
	public int actualizaSala(Sala obj) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "update revista set numero=?, piso=?, numAlumnos=?, recursos=?,estado=? idSede=? where idSalav=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNumero());
			pstm.setInt(2, obj.getPiso());
			pstm.setInt(3, obj.getNumAlumnos());
			pstm.setString(4, obj.getRecursos());
			pstm.setInt(4, obj.getEstado());		
			pstm.setInt(5, obj.getIdSala());
			
			
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
	public int eliminaSala(int idSala) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "delete from sala where idSala = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idSala);
			
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
	public Sala buscaSala(int idSala) {
		
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Sala objSala = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select r.*, m.nombre from  sala r inner join sede m on "
					+ " r.idSede = m.idSede "
					+ " where r.idSala = ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idSala);
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Sede objSede = null;
			while(rs.next()) {
				objSala = new Sala ();
				objSala.setIdSala(rs.getInt(1));
				objSala.setNumero(rs.getString(2));
				objSala.setPiso(rs.getInt(3));
				objSala.setNumAlumnos(rs.getInt(4));
				objSala.setRecursos(rs.getString(5));
				objSala.setEstado(rs.getInt(6));
				
				
				objSede = new Sede();
				objSede.setIdSede(rs.getInt(7));
				objSede.setNombre(rs.getString(8));
				objSala.setSede(objSede);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		return objSala;
	}



}