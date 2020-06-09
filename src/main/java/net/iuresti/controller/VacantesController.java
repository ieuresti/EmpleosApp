package net.iuresti.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.iuresti.model.Vacante;
import net.iuresti.service.ICategoriasService;
import net.iuresti.service.IVacantesService;
import net.iuresti.util.Utileria;

@Controller
@RequestMapping("/vacantes")
public class VacantesController {
	
	@Value("${empleosapp.ruta.imagenes}")
	private String ruta;
	
	@Autowired
	private IVacantesService serviceVacantes;
	
	@Autowired
	private ICategoriasService serviceCategorias;
	
	@GetMapping("/index")
	public String mostrarIndex(Model model) {
		List<Vacante> lista = serviceVacantes.buscarTodas();
		model.addAttribute("vacantes", lista);		
		return "vacantes/listVacantes";
	}
	
	/**
	 * Metodo que muestra el listado de vacantes con paginacion
	 */
	@GetMapping(value = "/indexPaginate")
	public String mostrarIndexPaginado(Model model, Pageable page) {
		Page<Vacante> lista = serviceVacantes.buscarTodas(page);
		model.addAttribute("vacantes", lista);
		return "vacantes/listVacantes";
	}

	/**
	 * Método para renderizar la vista de los Detalles para una  determinada Vacante
	 * 
	 * En la url despues de /view/ sera una parte dinamica,
	 * El nombre de la variable id hace referencia en la url en la parte de {id} 
	 * en ese punto en el parametro idVacante ya se tendria el valor de id
	 */
	@GetMapping("/view/{id}")
	public String verDetalle(@PathVariable("id") int idVacante, Model model) {
		// Pasamos el id que nos envia la vista a nuestra clase de servicio
		Vacante vacante = serviceVacantes.buscarPorId(idVacante);
		model.addAttribute("vacante", vacante);
		return "detalle";
	}
	
	/**
	 * Método que muestra el formulario para crear una nueva Vacante
	 * 
	 * Nota: Para vincular errores en la vista, tambien debemos enviar al formulario
	 * un objeto de nuestra clase de modelo (se declara como parametro) dentro del metodo
	 */
	@GetMapping("/create")
	public String crear(Vacante vacante, Model model) {
		return "vacantes/formVacante";
	}
	
	/**
	 * Método que guarda la Vacante en la base de datos
	 * 
	 * Para revisar posibles errores despues del Data Binding se agrega el parametro
	 * de tipo BindingResult INMEDIATAMENTE despues de la clase de modelo.
	 * 
	 * Los atributos flash son almacenados antes de hacer el redirect, en nuestro caso
	 * el mensaje de comprobacion de registro exitoso
	 */
	@PostMapping("/save")
	public String guardar(Vacante vacante, BindingResult result, RedirectAttributes attributes, 
			@RequestParam("archivoImagen") MultipartFile multiPart) {
		if (result.hasErrors()) {
			System.out.println("Existieron errores");
			return "vacantes/formVacante";
		}
		
		if (!multiPart.isEmpty()) {
			// String ruta = "/empleos/img-vacantes/"; // Linux/MAC
			// String ruta = "c:/empleos/img-vacantes/"; //Windows
			String nombreImagen = Utileria.guardarArchivo(multiPart, ruta);
			if (nombreImagen != null) { // La imagen si se subio
				//Procesamos la variable nombreImagen
				vacante.setImagen(nombreImagen); // Asignamos el nombre de la imagen
			}
		}
		// Guadamos el objeto vacante en la BD
		serviceVacantes.guardar(vacante);
		attributes.addFlashAttribute("msg", "Los datos de la vacante fueron guardados!");
		// return "redirect:/vacantes/index";
		return "redirect:/vacantes/indexPaginate"; // Realizamos una peticion HTTP tipo Get a esta url para renderizar la lista
	}

	/**
	 * Método que elimina una Vacante de la base de datos
	 * 
	 * Cuando se realize una peticion tipo Get a esta url en los parametros http se
	 * buscara el parametro id y en caso de ser encontrado se va a vincular el valor
	 * al parametro idVacante
	 */
	@GetMapping("/delete/{id}")
	public String eliminar(@PathVariable("id") int idVacante, RedirectAttributes attributes) {
		// Eliminamos la vacante.
		serviceVacantes.eliminar(idVacante);
		attributes.addFlashAttribute("msg", "La vacante fue eliminada!");
		// return "redirect:/vacantes/index";
		return "redirect:/vacantes/indexPaginate";
	}
	
	/**
	 * Metodo que busca el objeto en la bd y se lo envia al formulario para editarlo
	 */
	@GetMapping("/edit/{id}")
	public String editar(@PathVariable("id") int idVacante, Model model) {
		Vacante vacante = serviceVacantes.buscarPorId(idVacante);
		model.addAttribute("vacante", vacante);
		return "vacantes/formVacante";
	}
	
	/**
	 * Agregamos al Model la lista de Categorias: De esta forma nos evitamos agregarlos en los metodos crear y editar
	 * 
	 * Otra forma de agregar datos al modelo que son genericos o comunes para todos los metodos en
	 * este controlador
	 */
	@ModelAttribute
	public void setGenericos(Model model) {
		model.addAttribute("categorias", serviceCategorias.buscarTodas());
	}
	
	/**
	 * Personalizamos el Data Binding para todas las propiedades de tipo Date
	 * 
	 * InitBinder permite crear metodos para configurar el Data Binding directamente en el controlador
	 * Aqui se configura CustomDateEditor para todas las propiedades de tipo java.util.Date
	 */
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

}
