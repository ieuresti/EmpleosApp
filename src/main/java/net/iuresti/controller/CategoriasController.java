package net.iuresti.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.iuresti.model.Categoria;
import net.iuresti.service.ICategoriasService;

@Controller
@RequestMapping("/categorias")
public class CategoriasController {
	
	@Autowired
	private ICategoriasService serviceCategorias;

	/**
	 * Metodo que muestra la lista de categorias sin paginacion
	 */
	@GetMapping("/index")
	public String mostrarIndex(Model model) {
		List<Categoria> lista = serviceCategorias.buscarTodas();
		model.addAttribute("categorias", lista);
		return "categorias/listCategorias";
	}
	
	/**
	 * Metodo que muestra el listado de categorias con paginacion
	 */
	@GetMapping(value = "/indexPaginate")
	public String mostrarIndexPaginado(Model model, Pageable page) {
		Page<Categoria> lista = serviceCategorias.buscarTodas(page);
		model.addAttribute("categorias", lista);
		return "categorias/listCategorias";
	}

	/**
	 * Método para renderizar el formulario para crear una nueva Categoría
	 */
	@GetMapping("/create")
	public String crear(Categoria categoria) {
		return "categorias/formCategoria";
	}

	/** 
	* Método para guardar una Categoría en la base de datos
	* 
	* Nota: El uso de @RequestParam dentro de un metodo es para recibir los valores del formulario,
	* los nombres deben de coincidir con los del formulario.
	*/
	@PostMapping("/save")
	public String guardar(Categoria categoria, BindingResult result, RedirectAttributes attributes) {
		if (result.hasErrors()) {
			System.out.println("Existieron Errores");
			return "vacantes/formVacante";
		}
		// Guardamos el objeto categoria en la bd
		serviceCategorias.guardar(categoria);
		attributes.addFlashAttribute("msg", "Los datos de la categoria fueron guardados!");
		System.out.println("Categoria: " + categoria);
		// return "redirect:/categorias/index";
		return "redirect:/categorias/indexPaginate";
	}
	
	/**
	 * Metodo que busca el objeto en la bd y se lo envia al formulario para editarlo
	 */
	@GetMapping("/edit/{id}")
	public String editar(@PathVariable("id") int idCategoria, Model model) {
		Categoria categoria = serviceCategorias.buscarPorId(idCategoria);
		model.addAttribute("categoria", categoria);
		return "categorias/formCategoria";
	}
	
	/**
	 * Método para eliminar una Categoría de la base de datos
	 */
	@GetMapping("/delete/{id}")
	public String eliminar(@PathVariable("id") int idCategoria, RedirectAttributes attributes) {
		// Eliminamos la categoria
		serviceCategorias.eliminar(idCategoria);
		attributes.addFlashAttribute("msg", "La categoria fue eliminada!");
		// return "redirect:/categorias/index";
		return "redirect:/categorias/indexPaginate";
	}

}
