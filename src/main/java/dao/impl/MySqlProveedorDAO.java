package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.ProveedorDAO;
import entity.Pais;
import entity.Proveedor;
import util.MySqlDBConexion;

public class MySqlProveedorDAO implements ProveedorDAO{


	private static Logger log = Logger.getLogger(MySqlProveedorDAO.class.getName());
	
	public int insertProveedor(Proveedor  obj) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into proveedor values(null,?,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getRazonsocial());
			pstm.setString(2, obj.getRuc());
			pstm.setString(3, obj.getDireccion());
			pstm.setString(4, obj.getCelular());
			pstm.setString(5, obj.getContacto());
			pstm.setInt(6, obj.getEstado());
			pstm.setTimestamp(7, obj.getFechaRegistro());
			pstm.setInt(8, obj.getPais().getIdPais());
			
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
	public List<Proveedor> listaProveedor(String filtro) {
		List<Proveedor> lista = new ArrayList<Proveedor>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "SELECT pr.*, pa.nombre FROM proveedor pr INNER JOIN pais pa ON"
					+ " pr.idPais = pa.idPais"
					+ "  WHERE pr.razonsocial LIKE ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, filtro);
			
			log.info(">>>> " + pstm);
			
			rs = pstm.executeQuery();
			Proveedor objProveedor = null;
			Pais objPais = null;
			while (rs.next()) {
				objProveedor = new Proveedor();
				objProveedor.setIdProveedor(rs.getInt(1));
				objProveedor.setRazonsocial(rs.getString(2));
				objProveedor.setRuc(rs.getString(3));
				objProveedor.setDireccion(rs.getString(4));
				objProveedor.setCelular(rs.getString(5));
				objProveedor.setContacto(rs.getString(6));
				objProveedor.setEstado(rs.getInt(7));
				objProveedor.setFechaRegistro(rs.getTimestamp(8));
				            
				objPais = new Pais();
				objPais.setIdPais(rs.getInt(9));
				objPais.setNombre(rs.getString(10));
				objProveedor.setPais(objPais); 
			                
			    lista.add(objProveedor);
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
	public int actualizaProveedor(Proveedor obj) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "update proveedor set razonsocial=?, ruc=?, direccion=?, celular=?, contacto=?, estado=?, idPais=? where idProveedor=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getRazonsocial());
			pstm.setString(2, obj.getRuc());
			pstm.setString(3, obj.getDireccion());
			pstm.setString(4, obj.getCelular());
			pstm.setString(5, obj.getContacto());
			pstm.setInt(6, obj.getEstado());
			pstm.setInt(7, obj.getPais().getIdPais());
			pstm.setInt(8, obj.getIdProveedor());
			
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
	public int eliminaProveedor(int idProveedor) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "delete from proveedor where idProveedor = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idProveedor);

			
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
	public Proveedor buscaProveedor(int idProveedor) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Proveedor objProveedor = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "select pr.*, pa.nombre from proveedor pr inner join pais pa on"
		             + " pr.idPais = pa.idPais"
		             + " where pr.idProveedor = ?";

			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idProveedor);
			
			log.info(">>>> " + pstm);
			
			rs = pstm.executeQuery();
			Pais objPais = null;
			while(rs.next()) {
				objProveedor = new Proveedor();
			    objProveedor.setIdProveedor(rs.getInt(1));
			    objProveedor.setRazonsocial(rs.getString(2));
			    objProveedor.setRuc(rs.getString(3));
			    objProveedor.setDireccion(rs.getString(4));
			    objProveedor.setCelular(rs.getString(5));
			    objProveedor.setContacto(rs.getString(6));
			    objProveedor.setEstado(rs.getInt(7));
			    objProveedor.setFechaRegistro(rs.getTimestamp(8));
			                
			    objPais = new Pais();
			    objPais.setIdPais(rs.getInt(9));
			    objPais.setNombre(rs.getString(10));
			    objProveedor.setPais(objPais);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		return objProveedor;
	}


	
}
