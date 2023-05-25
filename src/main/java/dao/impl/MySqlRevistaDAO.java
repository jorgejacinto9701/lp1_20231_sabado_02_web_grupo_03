package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.RevistaDAO;
import entity.Modalidad;
import entity.Revista;
import util.FechaUtil;
import util.MySqlDBConexion;

public class MySqlRevistaDAO implements RevistaDAO {
private static Logger log = Logger.getLogger(MySqlRevistaDAO.class.getName());
	
	public int insertaRevista(Revista  obj) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into revista values (null,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombre());
			pstm.setString(2, obj.getFrecuencia());
			pstm.setDate(3, obj.getFechaCreacion());
			pstm.setTimestamp(4, obj.getFechaRegistro());
			pstm.setInt(5, obj.getEstado());
			pstm.setInt(6, obj.getModalidad().getIdModalidad());
			
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
	public List<Revista> listaRevista(String filtro) {
		List<Revista> lista = new ArrayList<Revista>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select r.*, m.descripcion from revista r inner join Modalidad m on "
					+ " m.idModalidad= r.idModalidad "
					+ " where r.nombre like ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, filtro);
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Revista objRevista = null;
			Modalidad objModalidad = null;
			while(rs.next()) {
				objRevista = new Revista();
				objRevista.setIdRevista(rs.getInt(1));
				objRevista.setNombre(rs.getString(2));
				objRevista.setFrecuencia(rs.getString(3));
				objRevista.setFechaCreacion(rs.getDate(4));
				objRevista.setFechaRegistro(rs.getTimestamp(5));
				objRevista.setEstado(rs.getInt(6));
				objRevista.setFormatoCreacion(FechaUtil.getFechaFormateadaYYYYMMdd(rs.getDate(4)));
				
				objModalidad = new Modalidad();
				objModalidad.setIdModalidad(rs.getInt(7));
				objModalidad.setDescripcion(rs.getString(8));
				objRevista.setModalidad(objModalidad);
				
				lista.add(objRevista);
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
	public int actualizaRevista(Revista obj) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "update revista set nombre=?, frecuencia=?, fechaCreacion=?, estado=?, idModalidad=? where idRevista=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombre());
			pstm.setString(2, obj.getFrecuencia());
			pstm.setDate(3, obj.getFechaCreacion());
			pstm.setInt(4, obj.getEstado());
			pstm.setInt(5, obj.getModalidad().getIdModalidad());
			pstm.setInt(6, obj.getIdRevista());
			
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
	public int eliminaRevista(int idRevista) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "delete from revista where idRevista = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idRevista);
			
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
	public Revista buscaRevista(int idRevista) {
		
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Revista objRevista = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select r.*, m.descripcion from  revista r inner join modalidad m on "
					+ " r.idModalidad = m.idModalidad "
					+ " where r.idRevista = ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idRevista);
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Modalidad objModalidad = null;
			while(rs.next()) {
				objRevista = new Revista();
				objRevista.setIdRevista(rs.getInt(1));
				objRevista.setNombre(rs.getString(2));
				objRevista.setFrecuencia(rs.getString(3));
				objRevista.setFechaCreacion(rs.getDate(4));
				objRevista.setFechaRegistro(rs.getTimestamp(5));
				objRevista.setEstado(rs.getInt(6));
				
				
				objModalidad = new Modalidad();
				objModalidad.setIdModalidad(rs.getInt(7));
				objModalidad.setDescripcion(rs.getString(8));
				objRevista.setModalidad(objModalidad);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		return objRevista;
	}

}