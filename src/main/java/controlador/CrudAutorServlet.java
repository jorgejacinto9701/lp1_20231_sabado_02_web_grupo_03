package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.AutorDAO;
import entity.Autor;
import entity.Grado;
import entity.Respuesta;
import fabricas.Fabrica;

@SuppressWarnings("unused")
@WebServlet("/crudAutor")

public class CrudAutorServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static Logger log = Logger.getLogger(CrudAutorServlet.class.getName());

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">> CrudAutorServlet >> service");
		String vmetodo = req.getParameter("metodo");
		switch (vmetodo) {
		case "lista":
			lista(req, resp);
			break;
		case "inserta":
			lista(req, resp);
			break;
		case "actualiza":
			lista(req, resp);
			break;
		case "eLogica":
			lista(req, resp);
			break;
		case "eFisica":
			lista(req, resp);
			break;

		default:
			break;
		}
	}

	protected void lista(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">> CrudAutorServlet >> lista");
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO dao = fabrica.getAutorDAO();

		String filtro = req.getParameter("filtro");
		List<Autor> lista = dao.listaAutor(filtro + "%");

		Gson gson = new Gson();
		String json = gson.toJson(lista);

		resp.setContentType("application/json;charset=UTF-8");

		PrintWriter out = resp.getWriter();
		out.println(json);

	}

	protected void inserta(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">> CrudAutorServlet >> inserta");
		log.info(">> CrudClienteServlet >> inserta");

		String vnombre = req.getParameter("nombre");
		String vapellido = req.getParameter("apellido");
		String vfecha = req.getParameter("fechaNacimiento");
		String vtelefono = req.getParameter("telefono");
		String vGrado = req.getParameter("Grado");

		Grado objGrado = new Grado();
		objGrado.setIdGrado(Integer.parseInt(vGrado));

		Autor objAutor = new Autor();
		objAutor.setNombres(vnombre);
		objAutor.setApellidos(vapellido);
		objAutor.setFechaNacimiento(Date.valueOf(vfecha));
		objAutor.setTelefono(vtelefono);
		objAutor.setEstado(1);
		objAutor.setGrado(objGrado);
		objAutor.setFechaRegistro(new Timestamp(System.currentTimeMillis()));

		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO dao = fabrica.getAutorDAO();

		int insertados = dao.insertaAutor(objAutor);
		List<Autor> lista = dao.listaAutor("%");

		Respuesta objRespuesta = new Respuesta();
		if (insertados > 0) {
			objRespuesta.setMensaje("Registro exitoso");
		} else {
			objRespuesta.setMensaje("Error en el registro");
		}
		objRespuesta.setDatos(lista);

		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
	}

	protected void actualiza(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">> CrudAutorServlet >> actualiza");

		log.info(">>> crudEmpleado >>> actualiza");

		String vnombre = req.getParameter("nombre");
		String vapellido = req.getParameter("apellido");
		String vfecha = req.getParameter("fechaNacimiento");
		String vtelefono = req.getParameter("telefono");
		String vGrado = req.getParameter("Grado");

		Grado objGrado = new Grado();
		objGrado.setIdGrado(Integer.parseInt(vGrado));

		Autor objAutor = new Autor();
		objAutor.setNombres(vnombre);
		objAutor.setApellidos(vapellido);
		objAutor.setFechaNacimiento(Date.valueOf(vfecha));
		objAutor.setTelefono(vtelefono);
		objAutor.setEstado(1);
		objAutor.setGrado(objGrado);
		objAutor.setFechaRegistro(new Timestamp(System.currentTimeMillis()));

		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO dao = fabrica.getAutorDAO();

		int insertados = dao.actualizaAutor(objAutor);
		List<Autor> lista = dao.listaAutor("%");

		Respuesta objRespuesta = new Respuesta();
		if (insertados > 0) {
			objRespuesta.setMensaje("Actualización exitosa");
		} else {
			objRespuesta.setMensaje("Error al actualizar");
		}
		objRespuesta.setDatos(lista);

		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);

		resp.setContentType("application/json;charset=UTF-8");

		PrintWriter out = resp.getWriter();
		out.println(json);
	}

	protected void eliminacionLogica(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		log.info(">> CrudAutorServlet >> eliminacionLogica");
		
log.info(">>> crudAutor >>> eliminacionLogica");
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO dao = fabrica.getAutorDAO();
	
		String idAutor = req.getParameter("idAutor");
		
		Autor objEmpleado = dao.buscaAutor(Integer.parseInt(idAutor));
		int estadoNuevo = objEmpleado.getEstado() == 0 ? 1 : 0;
		objEmpleado.setEstado(estadoNuevo);
		
		dao.actualizaAutor(objEmpleado);
		List<Autor> lista = dao.listaAutor("%");
		
		Respuesta objRespuesta = new Respuesta();
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
	}

	protected void eliminacionFisica(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		log.info(">> CrudAutorServlet >> eliminacionFisica");
		
log.info(">>> crudEmpleado >>> eliminacionFisica");
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO dao = fabrica.getAutorDAO();
	
		String idEmpleado = req.getParameter("idEmpleado");
		
		int eliminados = dao.eliminaAutor(Integer.parseInt(idEmpleado));
		List<Autor> lista = dao.listaAutor("%");
		
		Respuesta objRespuesta = new Respuesta();
		if (eliminados > 0) {
			objRespuesta.setMensaje("Eliminación exitosa");
		}else {
			objRespuesta.setMensaje("Error al eliminar");
		}
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
	}

}
