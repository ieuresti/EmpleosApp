package net.iuresti.service;

import java.util.List;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import net.iuresti.model.Vacante;

public interface IVacantesService {

	List<Vacante> buscarTodas();
	
	Vacante buscarPorId(Integer idVacante);
	
	List<Vacante> buscarDestacadas();
	
	void guardar(Vacante vacante);
	
	void eliminar (Integer idVacante);
	
	List<Vacante> buscarByExample(Example<Vacante> example);
	
	Page<Vacante> buscarTodas(Pageable page);

}
