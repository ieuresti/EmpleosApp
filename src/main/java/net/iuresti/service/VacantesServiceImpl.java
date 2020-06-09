package net.iuresti.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import net.iuresti.model.Vacante;

@Service
public class VacantesServiceImpl implements IVacantesService {
	
	// Atributos a nivel de la clase
	// Esta lista estara disponible en cualquier metodo dentro de la clase
	private List<Vacante> lista = null;

	/**
	 * Constructor que genera una lista de objetos de tipo Vacante
	 */
	public VacantesServiceImpl() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		lista = new LinkedList<Vacante>();
		// El metodo parse puede lanzar la excepcion ParseException, razon por la cual
		// el codigo esta dentro de un bloque try
		try {
			// Creamos la oferta de Trabajo 1
			Vacante vacante1 = new Vacante();
			vacante1.setId(1);
			vacante1.setNombre("Ingeniero Civil"); // Titulo de la vacante
			vacante1.setDescripcion("Solicitamos Ing. Civil para diseñar puente peatonal.");
			vacante1.setFecha(sdf.parse("08-02-2019"));
			vacante1.setSalario(14000.0);
			vacante1.setDestacado(1);
			vacante1.setImagen("empresa1.png");
			vacante1.setEstatus("Creada");

			// Creamos la oferta de Trabajo 2
			Vacante vacante2 = new Vacante();
			vacante2.setId(2);
			vacante2.setNombre("Contador Publico");
			vacante2.setDescripcion("Empresa importante solicita contador con 5 años de experiencia titulado.");
			vacante2.setFecha(sdf.parse("09-02-2019"));
			vacante2.setSalario(12000.0);
			vacante2.setDestacado(0);
			vacante2.setImagen("empresa2.png");
			vacante2.setEstatus("Aprobada");

			// Creamos la oferta de Trabajo 3
			Vacante vacante3 = new Vacante();
			vacante3.setId(3);
			vacante3.setNombre("Ingeniero Electrico");
			vacante3.setDescripcion("Empresa internacional solicita Ingeniero mecanico para mantenimiento de la instalacion electrica.");
			vacante3.setFecha(sdf.parse("10-02-2019"));
			vacante3.setSalario(10500.0);
			vacante3.setDestacado(0);
			vacante3.setEstatus("Eliminada");

			// Creamos la oferta de Trabajo 4
			Vacante vacante4 = new Vacante();
			vacante4.setId(4);
			vacante4.setNombre("Diseñador Grafico");
			vacante4.setDescripcion("Solicitamos Diseñador Grafico titulado para diseñar publicidad de la empresa.");
			vacante4.setFecha(sdf.parse("11-02-2019"));
			vacante4.setSalario(7500.0);
			vacante4.setDestacado(1);
			vacante4.setImagen("empresa3.png");
			vacante4.setEstatus("Creada");

			// Agregamos los 4 objetos de tipo Vacante a la lista
			lista.add(vacante1);
			lista.add(vacante2);
			lista.add(vacante3);
			lista.add(vacante4);

		} catch (ParseException e) {
			System.out.println("Error: " + e.getMessage());
		}
	}

	@Override
	public List<Vacante> buscarTodas() {
		return lista;
	}

	@Override
	public Vacante buscarPorId(Integer idVacante) {
		// Recorrer nuestra lista de objetos tipo Vacante
		// La variable temporal v representara cada objeto en esta lista 
		for (Vacante v : lista) {
			if (v.getId() == idVacante) {
				return v;
			}
		}
		// Suponiendo que pasamos un id que no existe despues de recorrer la lista regresara null
		return null;
	}

	@Override
	public void guardar(Vacante vacante) {
		// Llamamos nuestra lista y agregamos el objeto Vacante(es el que envia el controlador a traves de la clase de servicio)
		lista.add(vacante);
	}
	
	@Override
	public void eliminar(Integer idVacante) {
		
	}

	@Override
	public List<Vacante> buscarDestacadas() {
		return null;
	}

	@Override
	public List<Vacante> buscarByExample(Example<Vacante> example) {
		
		return null;
	}

	@Override
	public Page<Vacante> buscarTodas(Pageable page) {
		
		return null;
	}

}
