package fabricas;

import dao.AlumnoDAO;
import dao.AutorDAO;
import dao.DevolucionDAO;
import dao.EditorialDAO;
import dao.GradoDAO;
import dao.LibroDAO;
import dao.ModalidadDAO;
import dao.PaisDAO;
import dao.PrestamoDAO;
import dao.ProveedorDAO;
import dao.RevistaDAO;
import dao.SedeDAO;
import dao.SeparacionDAO;
import dao.TesisDAO;
import dao.UsuarioDAO;
import dao.impl.MySqlAlumnoDAO;
import dao.impl.MySqlAutorDAO;
import dao.impl.MySqlDevolucionDAO;
import dao.impl.MySqlEditorialDAO;
import dao.impl.MySqlGradoDAO;
import dao.impl.MySqlLibroDAO;
import dao.impl.MySqlModalidadDAO;
import dao.impl.MySqlPrestamoDAO;
import dao.impl.MySqlProveedorDAO;
import dao.impl.MySqlRevistaDAO;
import dao.impl.MySqlSalaDAO;
import dao.impl.MySqlSeparacionDAO;
import dao.impl.MySqlTesisDAO;
import dao.impl.MySqlUsuarioDAO;
import dao.impl.MysqlPais;
import dao.impl.MysqlSede;

public class FabricaMysql extends Fabrica {

	public UsuarioDAO getUsuarioDAO() {
		return new MySqlUsuarioDAO();
	}

	public AlumnoDAO getAlumnoDAO() {
		return new MySqlAlumnoDAO();
	}

	public AutorDAO getAutorDAO() {
		return new MySqlAutorDAO();
	}

	public TesisDAO getTesisDAO() {
		return new MySqlTesisDAO();
	}

	public MySqlSalaDAO getSalaDAO() {
		return new MySqlSalaDAO();
	}

	public RevistaDAO getRevistaDAO() {
		return new MySqlRevistaDAO();
	}

	public LibroDAO getLibroDAO() {
		return new MySqlLibroDAO();
	}

	public ProveedorDAO getProveedor() {
		return new MySqlProveedorDAO();
	}

	public EditorialDAO getEditorialDAO() {
		return new MySqlEditorialDAO();
	}

	public PrestamoDAO getPrestamoDAO() {
		return new MySqlPrestamoDAO();
	}

	public SeparacionDAO getSeparacionDAO() {
		return new MySqlSeparacionDAO();
	}

	public DevolucionDAO getDevolucionDAO() {
		return new MySqlDevolucionDAO();
	}

	public GradoDAO getGradoDAO() {
		return new MySqlGradoDAO();
	}

	public PaisDAO getPais() {
		return new MysqlPais();
	}

	@Override
	public RevistaDAO getRevista() {
		return new MySqlRevistaDAO();

	}

	@Override
	public ModalidadDAO getModalidad() {
		return new MySqlModalidadDAO();
	}

	@Override
	public SedeDAO getSedeDAO() {
		return new MysqlSede();
	}

}
