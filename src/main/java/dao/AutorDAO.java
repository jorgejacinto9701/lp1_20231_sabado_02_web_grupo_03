package dao;

import entity.Autor;
import java.util.List;


public interface AutorDAO {
	

	public abstract int insertaAutor(Autor obj);
	public abstract  List<Autor>listaAutor(String filtro);
	public abstract int actualizaAutor(Autor obj);
	public abstract int eliminaAutor(int idAutor);
	public abstract Autor buscaAutor(int idAutor);
	
}

