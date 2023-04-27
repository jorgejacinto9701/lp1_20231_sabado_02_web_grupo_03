package dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.util.logging.Logger;

import dao.ProveedorDAO;
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
			pstm.setString(6, obj.getEstado());
			pstm.setDate(7, (Date) obj.getFechaRegistro());
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
	
}
