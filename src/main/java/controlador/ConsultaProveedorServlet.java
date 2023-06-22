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
import dao.ProveedorDAO;
import entity.Proveedor;
import fabricas.Fabrica;


@WebServlet("/consultaProveedor")
public class ConsultaProveedorServlet extends HttpServlet  {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		ProveedorDAO  dao = fabrica.getProveedor();
		String RazonSocial = req.getParameter("RazonSocial");
		String pais = req.getParameter("pais");
		String estado = req.getParameter("estado");
		String vfechaInicio = req.getParameter("fechaInicio");
		String vfechaFin = req.getParameter("fechaFin");

		if (vfechaInicio.equals("")) 	vfechaInicio = "1801-01-01"; 
		if (vfechaFin.equals("")) 		vfechaFin = "2500-12-31";

List<Proveedor> lista = dao.consultaProveedor(RazonSocial + "%", Integer.valueOf(pais), Integer.valueOf(estado),Date.valueOf(vfechaInicio), Date.valueOf(vfechaFin));
		
		Gson gson = new Gson();
		String json = gson.toJson(lista);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
		
	}

}