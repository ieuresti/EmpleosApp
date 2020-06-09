package net.iuresti.service.db;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.iuresti.model.Usuario;
import net.iuresti.repository.UsuariosRepository;
import net.iuresti.service.IUsuariosService;

@Service
public class UsuariosServiceJpa implements IUsuariosService {
	
	@Autowired
	private UsuariosRepository usuariosRepo;

	@Override
	public void guardar(Usuario usuario) {
		usuariosRepo.save(usuario);
	}

	@Override
	public void eliminar(Integer idUsuario) {
		usuariosRepo.deleteById(idUsuario);
	}

	@Override
	public List<Usuario> buscarTodos() {
		return usuariosRepo.findAll();
	}
	
	@Override
	public Usuario buscarPorId(Integer idUsuario) {
		Optional<Usuario> optional = usuariosRepo.findById(idUsuario);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	@Override
	public Usuario buscarPorUsername(String username) {
		return usuariosRepo.findByUsername(username);
	}

	@Override
	public List<Usuario> buscarRegistrados() {
		return usuariosRepo.findByFechaRegistroNotNull();
	}

	/**
	 * La anotacion Transactional se usa para indicar un método ejecutado dentro de una transacción de BD
	 */
	@Transactional
	@Override
	public int activar(int idUsuario) {
		int rows = usuariosRepo.unlock(idUsuario);
		return rows;
	}

	@Transactional
	@Override
	public int bloquear(int idUsuario) {
		int rows = usuariosRepo.lock(idUsuario);
		return rows;
	}

}
