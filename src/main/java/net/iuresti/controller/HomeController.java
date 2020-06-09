package net.iuresti.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.iuresti.model.Perfil;
import net.iuresti.model.Usuario;
import net.iuresti.model.Vacante;
import net.iuresti.service.ICategoriasService;
import net.iuresti.service.IUsuariosService;
import net.iuresti.service.IVacantesService;

@Controller
public class HomeController {
	
	/**
	 * Inyeccion de una instancia de nuestra clase de servicio
	 */
	@Autowired
	private IVacantesService serviceVacantes;
	
	@Autowired
	private ICategoriasService serviceCategorias;
	
	@Autowired
	private IUsuariosService serviceUsuarios;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	/**
	 * Este metodo responde a una peticion tipo Get (link o url navegador), esta url
	 * en una app web representa el directorio raiz de toda la aplicacion
	 */
	@GetMapping("/")
	public String mostrarHome(Model model) {
		return "home"; // Esta cadena representa el nombre de la vista
	}
	
	/**
	 * Método que esta mapeado al botón Ingresar en el menú
	 */
	@GetMapping("/index")
	public String mostrarIndex(Authentication auth, HttpSession session) {
		
		// Como el usuario ya ingreso, ya podemos agregar a la session el objeto usuario
		String username = auth.getName(); // Recuperamos el nombre del usuario que inicio sesion
		
		// Obtener los roles del usuario
		for (GrantedAuthority rol : auth.getAuthorities()) {
			System.out.println("ROL: " + rol.getAuthority());
		}
		// Preguntar si no existe una sesion para crearla
		if (session.getAttribute("usuario") == null) {
			Usuario usuario = serviceUsuarios.buscarPorUsername(username);
			usuario.setPassword(null); // Con esto no se almacenara la contraseña en la sesion
			System.out.println("Usuario: " + usuario); // Solo para saber si el obj fue encontrado
			session.setAttribute("usuario", usuario); // Agregar objetos/datos a la sesion
		}
		return "redirect:/"; // Redireccionar a la URL "/" es decir, al directorio raiz de la aplicacion
	}
	
	/**
	 * Método que muestra el formulario para que se registren nuevos usuarios
	 */
	@GetMapping("/signup")
	public String registrarse(Usuario usuario) {
		return "formRegistro";
	}
	
	/**
	 * Método que guarda en la base de datos el usuario registrado
	 */
	@PostMapping("/signup")
	public String guardarRegistro(Usuario usuario, RedirectAttributes attributes) {
		
		String pwdPlano = usuario.getPassword(); // Recuperamos la contraseña que viene en texto plano
		String pwdEncriptado = passwordEncoder.encode(pwdPlano); // Encriptamos el pwd BCryptPasswordEncoder
		usuario.setPassword(pwdEncriptado); // Hacemos un set al atributo password (ya viene encriptado)
		
		usuario.setEstatus(1); // Activado por defecto
		usuario.setFechaRegistro(new Date()); // Fecha de Registro, la fecha actual del servidor
		
		// Creamos el Perfil que le asignaremos al nuevo usuario
		Perfil perfil = new Perfil();
		perfil.setId(3); // Perfil USUARIO
		usuario.agregar(perfil);
		// Guardamos el usuario en la bd. El perfil se guarda automaticamente
		serviceUsuarios.guardar(usuario);
		attributes.addFlashAttribute("msg", "Has sido registrado. ¡Ahora puedes ingresar al sistema!");
		// return "redirect:/usuarios/index";
		return "redirect:/login";
	}
	
	/**
	 * Metodo que muestra la vista de la pagina de Acerca
	 */
	@GetMapping("/about")
	public String mostrarAcerca() {			
		return "acerca";
	}
	
	/**
	 * Método que muestra el formulario de login personalizado
	 */
	@GetMapping("/login")
	public String mostrarLogin() {
		return "formLogin";
	}
	
	/**
	 * Método personalizado para cerrar la sesión del usuario
	 */
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();
		logoutHandler.logout(request, null, null);
		// return "redirect:/login";
		return "redirect:/";
	}
	
	/**
	 * Utileria para encriptar texto con el algorito BCrypt
	 * @param texto
	 * @return
	 */
	@GetMapping("/bcrypt/{texto}")
	@ResponseBody // Al hacer una peticion a este metodo en vez de buscar una vista, se va a regresar el texto directamente al navegador
	public String encriptar(@PathVariable("texto") String texto) {
		return texto + " Encriptado en Bcrypt: " + passwordEncoder.encode(texto);
	}
	
	/**
	 * Método para realizar búsquedas desde el formulario de búsqueda del HomePage
	 */
	@GetMapping("/search")
	public String buscar(@ModelAttribute("search") Vacante vacante, Model model) {
		
		// La busqueda de vacantes desde el formulario debera de ser únicamente en Vacantes con estatus "Aprobada". Entonces forzamos ese filtrado.
		vacante.setEstatus("Aprobada");
		
		// Configuracion para cambiar en la condicion (en este caso el atributo descripcion) para que no se use el operador = en la consulta a la bd,
		// si no la palabra reservada like cuando se haga una busqueda (where descripcion like '%?%')
		ExampleMatcher matcher = ExampleMatcher.matching().withMatcher("descripcion", ExampleMatcher.GenericPropertyMatchers.contains());
		
		Example<Vacante> example = Example.of(vacante, matcher);
		List<Vacante> lista = serviceVacantes.buscarByExample(example);
		model.addAttribute("vacantes", lista); // Agregando al modelo la lista para que se renderize en la pagina principal
		return "home";
	}
	
	/**
	 * InitBinder para Strings si los detecta vacios en el Data Binding los settea a null
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	}
	
	/**
	 * Metodo que agrega al modelo datos genéricos para todo el controlador
	 */
	@ModelAttribute
	public void setGenericos(Model model) {
		Vacante vacanteSearch = new Vacante();
		vacanteSearch.reset(); // En el search(home.html), el objeto Vacante el valor de imagen sera null
		model.addAttribute("search", vacanteSearch);
		model.addAttribute("vacantes", serviceVacantes.buscarDestacadas());
		model.addAttribute("categorias", serviceCategorias.buscarTodas());
	}

}
