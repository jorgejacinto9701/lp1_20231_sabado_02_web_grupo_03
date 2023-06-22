package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import dao.AutorDAO;
import entity.Autor;
import fabricas.Fabrica;


@WebServlet("/consultaAutor")
public class ConsultaAutorServlet extends HttpServlet  {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO  dao = fabrica.getAutorDAO();
		String nombre = req.getParameter("nombre");
		String vfechaInicio = req.getParameter("fechaInicio");
		String vfechaFin = req.getParameter("fechaFin");
		String grado = req.getParameter("grado");
		String estado = req.getParameter("estado");

		if (vfechaInicio.equals("")) 	vfechaInicio = "0001-01-01"; 
		if (vfechaFin.equals("")) 		vfechaFin = "2900-12-31";

		List<Autor> lista = dao.consultaAutor(nombre+"%" , Integer.parseInt(grado) , Integer.parseInt(estado), Date.valueOf(vfechaInicio),Date.valueOf(vfechaFin));
		Gson gson = new Gson();
		String json = gson.toJson(lista);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
		
	}

}