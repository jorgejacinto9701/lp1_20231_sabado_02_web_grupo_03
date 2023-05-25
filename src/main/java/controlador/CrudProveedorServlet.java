package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


import dao.ProveedorDAO;
import entity.Pais;
import entity.Proveedor;
import entity.Respuesta;
import fabricas.Fabrica;

@WebServlet("/crudProveedor")
public class CrudProveedorServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;
	
	private static Logger Log = Logger.getLogger(CrudProveedorServlet.class.getName());

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			Log.info(">> CrudProveedorServlet >> service");
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
			       default:
			    	   break;
	}		
	}
	protected void lista(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Log.info(">> CrudProveedorServlet >> lista");
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		ProveedorDAO dao = fabrica.getProveedor();
		
		String filtro = req.getParameter("filtro");
		List<Proveedor> lista= dao.listaProveedor(filtro + "%");
		
		Gson gson = new Gson();
		String json = gson.toJson(lista);
		
		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(json);
	}	
	protected void inserta(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Log.info(">> CrudProveedorServlet >> inserta");
		
		String vrazonsoc = req.getParameter("razonsocial");
		String vruc = req.getParameter("ruc");
		String vdireccion = req.getParameter("direccion");
		String vcelular = req.getParameter("celular");
		String vcontacto = req.getParameter("contacto");
		String vpais  = req.getParameter("Pais");

		Pais objPais = new Pais();
		objPais.setIdPais(Integer.parseInt(vpais));
		
		Proveedor objProveedor = new Proveedor();
		objProveedor.setRazonsocial(vrazonsoc);
		objProveedor.setRuc(vruc);
		objProveedor.setDireccion(vdireccion);
		objProveedor.setCelular(vcelular);
		objProveedor.setContacto(vcontacto);
		objProveedor.setEstado(1);
		objProveedor.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
		objProveedor.setPais(objPais);
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		ProveedorDAO dao = fabrica.getProveedor();
	
		int insertados = dao.insertProveedor(objProveedor);
		List<Proveedor> lista = dao.listaProveedor("%");
		
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
		Log.info(">> CrudProveedorServlet >> actualiza");
		
		String vidProveedor = req.getParameter("idProveedor");
		String vrazonsoc = req.getParameter("razonsocial");
		String vruc = req.getParameter("ruc");
		String vdireccion = req.getParameter("direccion");
		String vcelular = req.getParameter("celular");
		String vcontacto = req.getParameter("contacto");
		String vestado = req.getParameter("estado");
		String vpais  = req.getParameter("Pais");
		
		Pais objPais = new Pais();
		objPais.setIdPais(Integer.parseInt(vpais));
		
		Proveedor objProveedor = new Proveedor();
		objProveedor.setIdProveedor(Integer.parseInt(vidProveedor));
		objProveedor.setRazonsocial(vrazonsoc);
		objProveedor.setRuc(vruc);
		objProveedor.setDireccion(vdireccion);
		objProveedor.setCelular(vcelular);
		objProveedor.setContacto(vcontacto);
		objProveedor.setEstado(Integer.parseInt(vestado));
		objProveedor.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
		objProveedor.setPais(objPais);
		
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		ProveedorDAO dao = fabrica.getProveedor();
	
		int insertados = dao.actualizaProveedor(objProveedor);
		List<Proveedor> lista = dao.listaProveedor("%");
		
		Respuesta objRespuesta = new Respuesta();
		if (insertados > 0) {
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
	protected void eliminacionLogica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Log.info(">> CrudProveedorServlet >> eliminacionLogica");
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		ProveedorDAO dao = fabrica.getProveedor();
	
		String idProveedor = req.getParameter("idProveedor");
		
		Proveedor objProveedor = dao.buscaProveedor(Integer.parseInt(idProveedor));
		int estadoNuevo = objProveedor.getEstado() == 0 ? 1 : 0;
		objProveedor.setEstado(estadoNuevo);
		
		dao.actualizaProveedor(objProveedor);
		List<Proveedor> lista = dao.listaProveedor("%");
		
		Respuesta objRespuesta = new Respuesta();
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
		
	}	
	protected void eliminacionFisica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Log.info(">> CrudProveedorServlet >> eliminacionFisica");

	Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
	ProveedorDAO dao = fabrica.getProveedor();
	
	String idProveedor = req.getParameter("idProveedor");
	
	int insertados = dao.eliminaProveedor(Integer.parseInt(idProveedor));
	List<Proveedor> lista = dao.listaProveedor("%");
	
	Respuesta objRespuesta = new Respuesta();
	if (insertados > 0) {
		objRespuesta.setMensaje("Eliminación exitoso");
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