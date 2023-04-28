package dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.util.logging.Logger;

import dao.ProveedorDAO;
import entity.Proveedor;
import entity.Sala;
import util.MySqlDBConexion;

public class MySqlSalaDAO implements ProveedorDAO{


	private static Logger log = Logger.getLogger(MySqlSalaDAO.class.getName());
	
	public int insertSala(Sala  obj) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into sala values(null,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNumero());
			pstm.setInt(2, obj.getPiso());
			pstm.setInt(3, obj.getNumAlumnos());
			pstm.setString(4, obj.getRecursos());
			pstm.setInt(5, obj.getEstado());
			pstm.setDate(6, (Date) obj.getFechaRegistro());
			pstm.setInt(7, obj.getSede().getIdSede());
			
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
	public int insertProveedor(Proveedor obj) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
