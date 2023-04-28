 package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.RevistaDAO;
import entity.Revista;
import entity.Modalidad;
import entity.Respuesta;
import fabricas.Fabrica;

@WebServlet("/registraRevista")
public class RevistaServlet extends HttpServlet  {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String vnombre = req.getParameter("nombre");
			String vfrecuencia = req.getParameter("frecuencia");
			String vfechaCr = req.getParameter("fechaCr");
			String vmodalidad = req.getParameter("modalidad");

			Modalidad objModalidad = new Modalidad();
			objModalidad.setIdModalidad(Integer.parseInt(vmodalidad));
			
			Revista objRevista = new Revista();
			objRevista.setNombre(vnombre);
			objRevista.setFrecuencia(vfrecuencia);
			objRevista.setFechaCreacion(Date.valueOf(vfechaCr));
			objRevista.setFechaRegistro(new Timestamp(System.currentTimeMillis()));	
			objRevista.setEstado(1);

						
			objRevista.setModalidad(objModalidad);
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			RevistaDAO dao = fabrica.getRevista();
		
			int insertados = dao.insertaRevista(objRevista);
			
			
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
