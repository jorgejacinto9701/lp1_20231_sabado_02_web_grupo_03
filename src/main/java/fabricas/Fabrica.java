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
import dao.SalaDAO;
import dao.SedeDAO;
import dao.SeparacionDAO;
import dao.TesisDAO;
import dao.UsuarioDAO;
public abstract class Fabrica {

	public static final int MYSQL = 1;
	public static final int SQLSERVER = 2;

	public abstract UsuarioDAO getUsuarioDAO();
	public abstract AlumnoDAO  getAlumnoDAO();
	public abstract AutorDAO getAutorDAO();
	public abstract GradoDAO getGradoDAO();
	public abstract EditorialDAO getEditorialDAO();
	public abstract LibroDAO getLibroDAO();
	public abstract ProveedorDAO getProveedor();
	public abstract RevistaDAO getRevistaDAO();
	public abstract RevistaDAO getRevista();
	public abstract ModalidadDAO getModalidad();
	public abstract SalaDAO getSalaDAO();
	public abstract TesisDAO getTesisDAO();
	public abstract DevolucionDAO getDevolucionDAO();
	public abstract PrestamoDAO getPrestamoDAO();
	public abstract SeparacionDAO getSeparacionDAO();
	public abstract PaisDAO getPais();
	public abstract SedeDAO getSedeDAO();
	
	public static Fabrica getFabrica(int tipo){
		Fabrica salida = null;
		switch(tipo){
			case MYSQL: 
				salida = new FabricaMysql();
				break;
		}
		return salida;
	}
	}
	
	