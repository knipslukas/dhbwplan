package de.amc17.dhbwplan.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import de.amc17.dhbwplan.entity.Dozent;


public interface DozentRepository extends CrudRepository<Dozent, Integer> {
	
	public List<Dozent> findBymNachname(String name);
	public List<Dozent> findBymEmail(String mail);
	public List<Dozent> findAll();
}
