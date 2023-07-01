package dao;
import java.util.List;

import entity.Revista;
public interface RevistaDAO {
	public abstract int insertaRevista(Revista obj);
	public abstract List<Revista> listaRevista(String filtro);
	public abstract int actualizaRevista(Revista obj);
	public abstract int eliminaRevista(int idRevista);
	public abstract Revista buscaRevista(int idRevista);
}



