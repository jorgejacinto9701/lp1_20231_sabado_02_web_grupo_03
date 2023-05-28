package dao;

import java.util.List;

import entity.Editorial;

public interface EditorialDAO {

	public abstract int insertaEditorial(Editorial obj);
	public abstract List<Editorial> listaEditorial(String filtro);
	public abstract int actualizaEditorial(Editorial obj);
	public abstract int eliminaEditorial(int idEditorial);
	public abstract Editorial buscaEditorial(int idEditorial);
}

