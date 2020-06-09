package net.iuresti.model;

// Esta clase representa una entidad (un registro) en la tabla de Usuarios de la base de datos

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="Usuarios")
public class Usuario {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String nombre;
	private String email;
	private String username;
	private String password;
	private Integer estatus;
	private Date fechaRegistro;
	
	// Relacion ManyToMany (Un usuario tiene muchos perfiles)
	// Por defecto Fetch es FetchType.LAZY
	@ManyToMany(fetch=FetchType.EAGER) // Esto es para que cuando se haga una busqueda de un usuario automaticamente se recupere en la misma consulta todos los perfiles que tenga asociados dicho usuario
	@JoinTable(name="UsuarioPerfil", // tabla intermedia
			joinColumns=@JoinColumn(name="idUsuario"), // foreignKey en la tabla de UsuarioPerfil
			inverseJoinColumns=@JoinColumn(name="idPerfil")) // foreignKey en la tabla de UsuarioPerfil
	
	private List<Perfil> perfiles; // La razon de que sea de tipo List es para que un usuario pueda tener varios perfiles(que acepte varios perfiles)
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public Integer getEstatus() {
		return estatus;
	}
	
	public void setEstatus(Integer estatus) {
		this.estatus = estatus;
	}
	
	public Date getFechaRegistro() {
		return fechaRegistro;
	}
	
	public void setFechaRegistro(Date fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}

	public List<Perfil> getPerfiles() {
		return perfiles;
	}

	public void setPerfiles(List<Perfil> perfiles) {
		this.perfiles = perfiles;
	}
	
	/**
	 * Metodo que agrega a la lista de perfiles los diferentes tipos de perfiles que le vamos a asignar al usuario
	 * @param tempPerfil
	 */
	public void agregar(Perfil tempPerfil) {
		if (perfiles == null) {
			perfiles = new LinkedList<Perfil>();
		}
		perfiles.add(tempPerfil);
	}

	@Override
	public String toString() {
		return "Usuario [id=" + id + ", nombre=" + nombre + ", email=" + email + ", username=" + username
				+ ", password=" + password + ", estatus=" + estatus + ", fechaRegistro=" + fechaRegistro + ", perfiles="
				+ perfiles + "]";
	}

}
