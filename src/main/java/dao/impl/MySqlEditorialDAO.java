package dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.EditorialDAO;
import entity.Editorial;
import entity.Pais;

import util.FechaUtil;
import util.MySqlDBConexion;

public class MySqlEditorialDAO implements EditorialDAO {
private static Logger log = Logger.getLogger(MySqlEditorialDAO.class.getName());


public int insertaEditorial(Editorial obj) {
	int salida = -1;
	
	Connection conn = null;
	PreparedStatement pstm = null;
	try {
		conn = MySqlDBConexion.getConexion();
		
		String sql = "insert into editorial values (null,?,?,?,?,?,?,?)";
		pstm = conn.prepareStatement(sql);
		pstm.setString(1, obj.getRazonSocial());
		pstm.setString(2, obj.getDireccion());
		pstm.setString(3, obj.getRuc());
		pstm.setDate(4, obj.getFechaCreacion());
		pstm.setTimestamp(5, obj.getFechaRegistro());
		pstm.setInt(6, obj.getEstado());
		pstm.setInt(7, obj.getPais().getIdPais());
		
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
	public List<Editorial> listaEditorial(String filtro) {
		List<Editorial> lista = new ArrayList<Editorial>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select e.*, p.nombre from editorial e inner join Pais p on "
					+ " p.idPais= e.idPais "
					+ " where e.razonSocial like ? ";
			
			
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, filtro);
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Editorial objEditorial = null;
			Pais objPais = null;
			while(rs.next()) {
				objEditorial = new Editorial();
				objEditorial.setIdEditorial(rs.getInt(1));
				objEditorial.setRazonSocial(rs.getString(2));
				objEditorial.setDireccion(rs.getString(3));
				objEditorial.setRuc(rs.getString(4));
				objEditorial.setFechaCreacion(rs.getDate(5));
				objEditorial.setFechaRegistro(rs.getTimestamp(6));
				objEditorial.setEstado(rs.getInt(7));
				objEditorial.setFormatoCreacion(FechaUtil.getFechaFormateadaYYYYMMdd(rs.getDate(5)));
				
				objPais = new Pais();
				objPais.setIdPais(rs.getInt(7));
				objPais.setNombre(rs.getString(8));
				objEditorial.setPais(objPais);
				
				lista.add(objEditorial);
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
	public int actualizaEditorial(Editorial obj) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "update editorial set razonSocial=?, direccion=?,ruc=?,fechaCreacion=?, estado=?, idPais=? where idEditorial=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getRazonSocial());
			pstm.setString(2, obj.getDireccion());
			pstm.setString(3, obj.getRuc());
			pstm.setDate(4, obj.getFechaCreacion());
			pstm.setInt(5, obj.getEstado());
			pstm.setInt(6, obj.getPais().getIdPais());
			pstm.setInt(7, obj.getIdEditorial());
			
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
	public int eliminaEditorial(int idEditorial) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "delete from Editorial where idEditorial = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idEditorial);
			
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
	public Editorial buscaEditorial(int idEditorial) {

		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Editorial objEditorial = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select e.*, p.nombre from editorial e inner join Pais p on "
					+" p.idPais= e.idPais "
					+" where e.idEditorial=?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idEditorial);
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Pais objPais = null;
			while(rs.next()) {
				objEditorial = new Editorial();
				objEditorial.setIdEditorial(rs.getInt(1));
				objEditorial.setRazonSocial(rs.getString(2));
				objEditorial.setDireccion(rs.getString(3));
				objEditorial.setRuc(rs.getString(4));
				objEditorial.setFechaCreacion(rs.getDate(5));
				objEditorial.setFechaRegistro(rs.getTimestamp(6));
				objEditorial.setEstado(rs.getInt(7));
				
				
				objPais = new Pais();
				objPais.setIdPais(rs.getInt(8));
				objPais.setNombre(rs.getString(9));
				objEditorial.setPais(objPais);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		return objEditorial;
	}

	@Override
	public List<Editorial> listaCompleja(String razonSocial, int idPais, int estado, Date fecInicio, Date fecFin) {
		List<Editorial> lista = new ArrayList<Editorial>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = " SELECT e.*, p.nombre FROM editorial e inner join pais p "
					+ " on e.idPais = p.idPais "
					+ "where 1=1 "
					+ "and e.razonSocial like ?"
					+ "and ( ? = -1 or e.idPais = ? )"
					+ "and e.estado = ? "
					+ "and e.fechaCreacion >= ?"
					+ "and e.fechaCreacion <= ?";
			
			
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, razonSocial);
			pstm.setInt(2, idPais);
			pstm.setInt(3, idPais);
			pstm.setInt(4, estado);
			pstm.setDate(5, fecInicio);
    			pstm.setDate(6, fecFin);
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Editorial objEditorial = null;
			Pais objPais = null;
			while(rs.next()) {
				objEditorial = new Editorial();
				objEditorial.setIdEditorial(rs.getInt(1));
				objEditorial.setRazonSocial(rs.getString(2));
				objEditorial.setDireccion(rs.getString(3));
				objEditorial.setRuc(rs.getString(4));
				objEditorial.setFechaCreacion(rs.getDate(5));
				objEditorial.setFechaRegistro(rs.getTimestamp(6));
				objEditorial.setEstado(rs.getInt(7));
				objEditorial.setFormatoCreacion(FechaUtil.getFechaFormateadaYYYYMMdd(rs.getDate(5)));
				
				objPais = new Pais();
				objPais.setIdPais(rs.getInt(8));
				objPais.setNombre(rs.getString(9));
				objEditorial.setPais(objPais);
				
				lista.add(objEditorial);
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



	

	


