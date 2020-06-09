package net.iuresti.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import net.iuresti.model.Usuario;

public interface UsuariosRepository extends JpaRepository<Usuario, Integer> {
	
	// Buscar usuario por username
	Usuario findByUsername(String username);
	List<Usuario> findByFechaRegistroNotNull();
	
	// Cambiar estatus a 0 (bloquear)
	@Modifying
	@Query("UPDATE Usuario u SET u.estatus=0 WHERE u.id = :paramIdUsuario")
	int lock(@Param("paramIdUsuario") int idUsuario);
	
	// Cambiar estatus a 1 (activar)
	@Modifying
	@Query("UPDATE Usuario u SET u.estatus=1 WHERE u.id = :paramIdUsuario")
	int unlock(@Param("paramIdUsuario") int idUsuario);

}
