package net.iuresti.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import net.iuresti.model.Solicitud;

public interface ISolicitudesService {
	
	// Método que guarda un objeto tipo Solicitud en la BD (solo disponible para un usuario con perfil USUARIO).
	void guardar(Solicitud solicitud);
		
	// Método que elimina una Solicitud de la BD (solo disponible para usuarios con perfil ADMINISTRADOR/SUPERVISOR).
	void eliminar(Integer idSolicitud);
		
	// Método que recupera todas las Solicitudes guardadas en la BD (solo disponible para usuarios con perfil ADMINISTRADOR/SUPERVISOR).
	List<Solicitud> buscarTodas();
		
	// Método que busca una Solicitud en la BD (solo disponible para usuarios con perfil ADMINISTRADOR/SUPERVISOR).
	Solicitud buscarPorId(Integer idSolicitud);
		
	// Método que recupera todas las Solicitudes (con paginación) guardadas en la BD (solo disponible para usuarios con perfil ADMINISTRADOR/SUPERVISOR).
	Page<Solicitud> buscarTodas(Pageable page);

}
