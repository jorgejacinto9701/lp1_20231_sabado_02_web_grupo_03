package controlador;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Timestamp;

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

@WebServlet("/registraProveedor")
public class ProveedorServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		String vrazonsocial = req.getParameter("razonsocial");
		String vruc = req.getParameter("ruc");
		String vdireccion = req.getParameter("direccion");
		String vcelular = req.getParameter("celular");
		String vcontacto = req.getParameter("contacto");
		String vpais = req.getParameter("pais");


			Pais objPais = new Pais();
			objPais.setIdPais(Integer.parseInt(vpais));
			
			Proveedor objProveedor = new Proveedor();
			objProveedor.setRazonsocial(vrazonsocial);
			objProveedor.setRuc(vruc);
			objProveedor.setDireccion(vdireccion);
			objProveedor.setCelular(vcelular);
			objProveedor.setContacto(vcontacto);
			objProveedor.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
			objProveedor.setEstado(1);
			objProveedor.setPais(objPais);
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			ProveedorDAO dao = fabrica.getProveedor();
		
			int insertados = dao.insertProveedor(objProveedor);
			
			
			Respuesta objRespuesta = new Respuesta();
			if (insertados > 0) {
				objRespuesta.setMensaje("Registro exitoso");
			}else {
				objRespuesta.setMensaje("Error en el registro");
			}
			
			Gson gson = new Gson();
			String json = gson.toJson(objRespuesta);
			
			resp.setContentType("application/json;charset=UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.println(json);
	}
}