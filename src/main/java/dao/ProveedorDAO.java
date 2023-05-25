package dao;

import java.util.List;

import entity.Proveedor;

public interface ProveedorDAO {

	public abstract int insertProveedor(Proveedor obj);
	public abstract List<Proveedor> listaProveedor(String filtro);
	public abstract int actualizaProveedor(Proveedor obj);
	public abstract int eliminaProveedor(int idProveedor);
	public abstract Proveedor buscaProveedor(int idProveedor);
}

