package net.iuresti.service;

import java.util.LinkedList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import net.iuresti.model.Categoria;

@Service
public class CategoriasServiceImpl implements ICategoriasService {
	
	private List<Categoria> lista = null;
	
	public CategoriasServiceImpl() {
		lista = new LinkedList<Categoria>();
		
		Categoria categoria1 = new Categoria();
		categoria1.setId(1);
		categoria1.setNombre("Ventas");
		categoria1.setDescripcion("Ofertas de trabajo relacionado con ventas");
		
		Categoria categoria2 = new Categoria();
		categoria2.setId(2);
		categoria2.setNombre("Contabilidad");
		categoria2.setDescripcion("Trabajos relacionados con el area de contabilidad");
		
		Categoria categoria3 = new Categoria();
		categoria3.setId(3);
		categoria3.setNombre("Transporte");
		categoria3.setDescripcion("Transporte de personal, material y relacionados");
		
		Categoria categoria4 = new Categoria();
		categoria4.setId(4);
		categoria4.setNombre("Informatica");
		categoria4.setDescripcion("Empleos en programacion, soporte, etc");
		
		Categoria categoria5 = new Categoria();
		categoria5.setId(5);
		categoria5.setNombre("Construccion");
		categoria5.setDescripcion("Trabajos relaccionados en construccion");
		
		Categoria categoria6 = new Categoria();
		categoria6.setId(6);
		categoria6.setNombre("Educacion");
		categoria6.setDescripcion("Maestros, tutores, etc");
		
		lista.add(categoria1);
		lista.add(categoria2);
		lista.add(categoria3);
		lista.add(categoria4);
		lista.add(categoria5);
		lista.add(categoria6);
	}

	@Override
	public List<Categoria> buscarTodas() {
		return lista;
	}

	@Override
	public Categoria buscarPorId(Integer idCategoria) {
		for ( Categoria c : lista) {
			if (c.getId() == idCategoria) {
				return c;
			}
		}
		return null;
	}
	
	@Override
	public void guardar(Categoria categoria) {
		lista.add(categoria);		
	}

	@Override
	public void eliminar(Integer idCategoria) {
		
	}

	@Override
	public Page<Categoria> buscarTodas(Pageable page) {
		
		return null;
	}

}
