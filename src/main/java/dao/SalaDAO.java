package dao;
import java.util.List;


import entity.Sala;
public interface SalaDAO {

	public abstract int insertaSala(Sala obj);
	public abstract List<Sala> listaSala11(String filtro);
	public abstract int actualizaSala1(Sala obj);
	public abstract int eliminaSala1(int idSala);
	public abstract Sala buscaSala1(int idSala);
	
}