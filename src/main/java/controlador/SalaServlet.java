package controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.SalaDAO;
import entity.Respuesta;
import entity.Sala;
import entity.Sede;
import fabricas.Fabrica;

@WebServlet("/registraSala")
public class SalaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String vnumero = req.getParameter("numero");
			String vpiso = req.getParameter("piso");
			String vnumAlumnos = req.getParameter("numAlumnos");
			String vrecursos = req.getParameter("recursos");
			String vestado = req.getParameter("estado");
			String vsede = req.getParameter("sede");

			Sede objSede = new Sede();
			objSede.setIdSede(Integer.parseInt(vsede));         
			
			Sala objSala = new Sala();
			objSala.setNumero(vnumero);
			//objSala.setPiso(vpiso);
			//objSala.setNumAlumnos(vpiso);
			objSala.setRecursos(vpiso);
			objSala.setEstado(1);  
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			SalaDAO dao = fabrica.getSalaDAO();
		
			int insertados = dao.insertaSala(objSala);
			
			
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
