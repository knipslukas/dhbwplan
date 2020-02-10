package de.amc17.dhbwplan.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import de.amc17.dhbwplan.entity.Dozent;


public interface DozentRepository extends CrudRepository<Dozent, Integer> {
	
	public List<Dozent> findBynachname(String name);
	public List<Dozent> findByemail(String mail);
	public List<Dozent> findBygehalteneFaecher(String mail); 
	public List<Dozent> findBymoeglicheFaecher(String mail);
	
	public List<Dozent> findAll();
	public Dozent findByDID(int id);

}
