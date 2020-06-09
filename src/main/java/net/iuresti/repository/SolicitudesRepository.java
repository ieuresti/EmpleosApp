package net.iuresti.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import net.iuresti.model.Solicitud;

public interface SolicitudesRepository extends JpaRepository<Solicitud, Integer> {

}
