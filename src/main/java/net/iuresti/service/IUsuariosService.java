package net.iuresti.service;

import java.util.List;

import net.iuresti.model.Usuario;

public interface IUsuariosService {
	
	void guardar(Usuario usuario);
	
	void eliminar(Integer idUsuario);
	
	List<Usuario> buscarTodos();
	
	List<Usuario> buscarRegistrados();
	
	Usuario buscarPorId(Integer idUsuario);
	
	Usuario buscarPorUsername(String username); // Regresa un obj tipo Usuario, recibe como param una cadena
	
	int activar(int idUsuario);
	
	int bloquear(int idUsuario);

}
