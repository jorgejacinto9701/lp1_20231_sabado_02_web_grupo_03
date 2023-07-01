package dao;

import java.sql.Date;
import java.util.List;

import entity.Editorial;

public interface EditorialDAO {
	//consultas
	public abstract List<Editorial> listaCompleja(String razonSocial, int idPais, int estado, Date fecInicio, Date fecFin);
	//crud
	public abstract int insertaEditorial(Editorial obj);
	public abstract List<Editorial> listaEditorial(String filtro);
	public abstract int actualizaEditorial(Editorial obj);
	public abstract int eliminaEditorial(int idEditorial);
	public abstract Editorial buscaEditorial(int idEditorial);
}

