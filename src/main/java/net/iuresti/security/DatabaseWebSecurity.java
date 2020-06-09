package net.iuresti.security;

// Spring Security - Clase para leer Usuarios y Roles desde BD(users, authorities)

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity // Permitir agregar soporte a nuestro proyecto de Spring Boot para Spring Security
public class DatabaseWebSecurity extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private DataSource dataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.jdbcAuthentication().dataSource(dataSource)
		.usersByUsernameQuery("select username, password, estatus from Usuarios where username=?")
		.authoritiesByUsernameQuery("select u.username, p.perfil from UsuarioPerfil up " +
		"inner join Usuarios u on u.id = up.idUsuario " + 
		"inner join Perfiles p on p.id = up.idPerfil " + 
		"where u.username = ?");
		
	}
	
	/**
	 * Personalizamos el Acceso a las URLs de la aplicacion
	 */
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
		// Los recursos estaticos no requieren autenticacion
		.antMatchers(
				"/bootstrap/**",
				"/images/**",
				"/tinymce/**",
				"/logos/**").permitAll()
		
		// Las vistas publicas no requieren autenticacion
		.antMatchers("/",
				"/login",
				"/signup",
				"/search",
				"/bcrypt/**",
				"/about",
				"/vacantes/view/**").permitAll()
		
		// Asignar permisos a URLs por ROLES
		.antMatchers("/solicitudes/create/**", "/solicitudes/save/**").hasAuthority("USUARIO")
		
		.antMatchers("/solicitudes/**").hasAnyAuthority("SUPERVISOR", "ADMINISTRADOR")
		.antMatchers("/vacantes/**").hasAnyAuthority("SUPERVISOR", "ADMINISTRADOR")
		.antMatchers("/categorias/**").hasAnyAuthority("SUPERVISOR", "ADMINISTRADOR")
		.antMatchers("/usuarios/**").hasAnyAuthority("ADMINISTRADOR")
		
		// Todas las demas URLs de la Aplicacion requieren autenticacion
		.anyRequest().authenticated()
		
		// El formulario de Login no requiere autenticacion
		.and().formLogin().loginPage("/login").permitAll()
		.and().logout().permitAll();

	}
	
	/**
	 * Implementación de Spring Security que encripta passwords con el algoritmo Bcrypt
	 */
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
