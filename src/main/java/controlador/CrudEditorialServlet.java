package controlador;

import java.io.IOException;
import java.util.logging.Logger;

import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.google.gson.Gson;

import dao.EditorialDAO;
import entity.Pais;
import entity.Respuesta;
import entity.Editorial;
import fabricas.Fabrica;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/crudEditorial")
public class CrudEditorialServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private static Logger log = Logger.getLogger(CrudEditorialServlet.class.getName());
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">>> crudEditorial >>> service");
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
		log.info(">>> crudEditorial >>> lista");
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		EditorialDAO dao = fabrica.getEditorialDAO();
		
		String filtro = req.getParameter("filtro");
		List<Editorial> lista = dao.listaEditorial(filtro + "%");
		
		Gson gson = new Gson();
		String json = gson.toJson(lista);

		resp.setContentType("application/json;charset=UTF-8");

		PrintWriter out = resp.getWriter();
		out.println(json);
	}
	
	protected void actualiza(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">>> crudEditorial >>> actualiza");
		
		String vidEditorial = req.getParameter("idEditorial");
		String vrazonSocial = req.getParameter("razonSocial");
		String vdireccion = req.getParameter("direccion");
		String vruc = req.getParameter("ruc");
		String vfecha = req.getParameter("fechaCreacion");
		String vpais = req.getParameter("pais");
		
		Pais objPais= new Pais();
		objPais.setIdPais(Integer.parseInt(vpais));
		
		Editorial objEditorial = new Editorial();
		objEditorial.setIdEditorial(Integer.parseInt(vidEditorial));
		objEditorial.setRazonSocial(vrazonSocial);
		objEditorial.setDireccion(vdireccion);
		objEditorial.setRuc(vruc);
		objEditorial.setFechaCreacion(Date.valueOf(vfecha));
		objEditorial.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
		objEditorial.setEstado(1);
		objEditorial.setPais(objPais);
		
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		EditorialDAO dao = fabrica.getEditorialDAO();
	
		int actualizados = dao.actualizaEditorial(objEditorial);
		List<Editorial> lista = dao.listaEditorial("%");
		
		Respuesta objRespuesta = new Respuesta();
		if (actualizados > 0) {
			objRespuesta.setMensaje("Actualización exitosa");
		}else {
			objRespuesta.setMensaje("Error al actualizar");
		}
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		
		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(json);
	}
	
	protected void inserta(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">>> crudEditorial >>> inserta");
		
		String vrazonSocial = req.getParameter("razonSocial");
		String vdireccion = req.getParameter("direccion");
		String vruc = req.getParameter("ruc");
		String vfecha = req.getParameter("fechaCreacion");
		String vpais = req.getParameter("pais");

		Pais objPais = new Pais();
		objPais.setIdPais(Integer.parseInt(vpais));
		
		Editorial objEditorial = new Editorial();
		objEditorial.setRazonSocial(vrazonSocial);
		objEditorial.setDireccion(vdireccion);
		objEditorial.setRuc(vruc);
		objEditorial.setFechaCreacion(Date.valueOf(vfecha));
		objEditorial.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
		objEditorial.setEstado(1);
		objEditorial.setPais(objPais);
		
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		EditorialDAO dao = fabrica.getEditorialDAO();
	
		int insertados = dao.insertaEditorial(objEditorial);
		List<Editorial> lista = dao.listaEditorial("%");
		
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
	protected void eliminacionLogica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">>> crudEditorial >>> eliminacionLogica");
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		EditorialDAO dao = fabrica.getEditorialDAO();
	
		String idEditorial = req.getParameter("idEditorial");
		
		Editorial objEditorial = dao.buscaEditorial(Integer.parseInt(idEditorial));
		int estadoNuevo = objEditorial.getEstado() == 0 ? 1 : 0;
		objEditorial.setEstado(estadoNuevo);
		
		dao.actualizaEditorial(objEditorial);
		List<Editorial> lista = dao.listaEditorial("%");
		
		Respuesta objRespuesta = new Respuesta();
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
	}
	protected void eliminacionFisica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">>> crudEditorial >>> eliminacionFisica");
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		EditorialDAO dao = fabrica.getEditorialDAO();
	
		String idEditorial = req.getParameter("idEditorial");
		
		int eliminados = dao.eliminaEditorial(Integer.parseInt(idEditorial));
		List<Editorial> lista = dao.listaEditorial("%");
		
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
