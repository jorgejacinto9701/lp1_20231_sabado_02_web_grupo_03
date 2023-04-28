package fabricas;

import dao.AlumnoDAO;
import dao.AutorDAO;
import dao.DevolucionDAO;
import dao.EditorialDAO;
import dao.GradoDAO;

import dao.LibroDAO;
import dao.ModalidadDAO;
import dao.PrestamoDAO;
import dao.ProveedorDAO;
import dao.RevistaDAO;
import dao.SalaDAO;
import dao.SeparacionDAO;
import dao.TesisDAO;
import dao.PaisDAO;
import dao.UsuarioDAO;
import dao.impl.MySqlAlumnoDAO;
import dao.impl.MySqlAutorDAO;
import dao.impl.MySqlDevolucionDAO;
import dao.impl.MySqlEditorialDAO;
import dao.impl.MySqlLibroDAO;
import dao.impl.MySqlModalidadDAO;
import dao.impl.MySqlPrestamoDAO;
import dao.impl.MySqlProveedorDAO;
import dao.impl.MySqlRevistaDAO;
import dao.impl.MySqlSalaDAO;
import dao.impl.MySqlSeparacionDAO;
import dao.impl.MySqlTesisDAO;
import dao.impl.MysqlPais;
import dao.impl.MySqlUsuarioDAO;
import dao.impl.MySqlGradoDAO;


public class FabricaMysql extends Fabrica {

	public UsuarioDAO getUsuarioDAO() {			return new MySqlUsuarioDAO(); 	}
	public AlumnoDAO getAlumnoDAO() {			return new MySqlAlumnoDAO(); 	}
	public AutorDAO getAutorDAO() {				return new MySqlAutorDAO(); 	}
	public TesisDAO getTesisDAO() {				return new MySqlTesisDAO(); 	}
	public MySqlSalaDAO getSalaDAO() {				return new MySqlSalaDAO(); 	}
	public RevistaDAO getRevistaDAO() {			return new MySqlRevistaDAO(); 	}
	public LibroDAO getLibroDAO() {				return new MySqlLibroDAO(); 	}
	public ProveedorDAO getProveedor() {		return new MySqlProveedorDAO(); 	}
	public EditorialDAO getEditorialDAO() {		return new MySqlEditorialDAO(); 	}
	public PrestamoDAO getPrestamoDAO() {		return new MySqlPrestamoDAO(); 	}
	public SeparacionDAO getSeparacionDAO() {	return new MySqlSeparacionDAO(); 	}
	public DevolucionDAO getDevolucionDAO() {	return new MySqlDevolucionDAO(); 	}
	public GradoDAO getGradoDAO() {				return new MySqlGradoDAO(); 	}
	public PaisDAO getPais() {
		return new MysqlPais();
	}
	@Override
	public RevistaDAO getRevista() {
		// TODO Auto-generated method stub
		return new MySqlRevistaDAO();
		
	}
	@Override
	public ModalidadDAO getModalidad() {
		// TODO Auto-generated method stub
		return new MySqlModalidadDAO();
	}
	@Override
	public SalaDAO getSalaDAO1() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
