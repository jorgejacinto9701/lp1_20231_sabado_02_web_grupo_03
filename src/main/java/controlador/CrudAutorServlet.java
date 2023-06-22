package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Logger;
import com.google.gson.Gson;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Grado;
import entity.Autor;
import dao.AutorDAO;
import fabricas.Fabrica;
import entity.Respuesta;

@WebServlet("/crudAutor")
public class CrudAutorServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private static Logger log = Logger.getLogger(CrudAutorServlet.class.getName());
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info("CrudAutorServlet >> service ");
		String vmetodo = req.getParameter("metodo");
		switch (vmetodo) {
		case "lista":
			lista(req, resp);
			break;
		case "inserta":
			inserta(req, resp);
			break;
		
		case "actualiza":
			actualiza(req, resp);
			break;
		case "eLogica":
			eliminacionLogica(req, resp);
			break;
		case "eFisica":
			eliminacionFisica(req, resp);
			break;
		}
	}
	
	protected void lista(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info("CrudAutorServlet >> lista");
		
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
		log.info("CrudAutorServlet >> inserta");
		
		String vnombre = req.getParameter("nombres");
		String vapellidos = req.getParameter("apellidos");
		String vtelefono = req.getParameter("telefono");
		String vfecha = req.getParameter("fechaNacimiento");
		String vgrado = req.getParameter("grado");
		
		Grado objGrado = new Grado();
		objGrado.setIdGrado(Integer.parseInt(vgrado));
		
		Autor objAutor = new Autor();
		objAutor.setNombres(vnombre);
		objAutor.setApellidos(vapellidos);
		objAutor.setFechaNacimiento(Date.valueOf(vfecha));
		objAutor.setTelefono(vtelefono);
		objAutor.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
		objAutor.setEstado(1);
		objAutor.setGrado(objGrado);
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO dao = fabrica.getAutorDAO();
	
		int insertados = dao.insertaAutor(objAutor);
		List<Autor> lista = dao.listaAutor("%");		
		
		Respuesta objRespuesta = new Respuesta();
		if (insertados > 0) {
			objRespuesta.setMensaje("Registro exitoso");
		}else {
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
		
		log.info("CrudAutorServlet >> actualiza");
		
		String vidAutor = req.getParameter("idAutor");
		String vestado = req.getParameter("estado");
		String vnombre = req.getParameter("nombres");
		String vapellidos = req.getParameter("apellidos");
		String vtelefono = req.getParameter("telefono");
		String vfecha = req.getParameter("fechaNacimiento");
		String vgrado = req.getParameter("grado");
		
		Grado objGrado = new Grado();
		objGrado.setIdGrado(Integer.parseInt(vgrado));
		
		Autor objAutor = new Autor();
		objAutor.setIdAutor(Integer.parseInt(vidAutor));
		objAutor.setNombres(vnombre);
		objAutor.setApellidos(vapellidos);
		objAutor.setFechaNacimiento(Date.valueOf(vfecha));
		objAutor.setTelefono(vtelefono);
		objAutor.setGrado(objGrado);
		objAutor.setEstado(Integer.parseInt(vestado));
		objAutor.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO dao = fabrica.getAutorDAO();
	
		int actualizados = dao.actualizaAutor(objAutor);
		List<Autor> lista = dao.listaAutor("%");		
		
		Respuesta objRespuesta = new Respuesta();
		if (actualizados > 0) {
			objRespuesta.setMensaje("Actualización exitoso");
		}else {
			objRespuesta.setMensaje("Error en la actualización");
		}
		objRespuesta.setDatos(lista);


		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
	}
	protected void eliminacionLogica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		log.info("CrudAutorServlet >> eliminacionLogica");
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO dao = fabrica.getAutorDAO();
	
		String idAutor = req.getParameter("idAutor");
		
		Autor objAutor = dao.buscaAutor(Integer.parseInt(idAutor));
		int estadoNuevo = objAutor.getEstado() == 0 ? 1 : 0;
		objAutor.setEstado(estadoNuevo);
		
		dao.actualizaAutor(objAutor);
		List<Autor> lista = dao.listaAutor("%");
		
		Respuesta objRespuesta = new Respuesta();
		objRespuesta.setDatos(lista);

		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);

		
		
	}
	protected void eliminacionFisica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info("CrudAutorServlet >> eliminacionFisica");
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO dao = fabrica.getAutorDAO();
	
		String idAutor = req.getParameter("idAutor");
		
		int eliminados = dao.eliminaAutor(Integer.parseInt(idAutor));
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
