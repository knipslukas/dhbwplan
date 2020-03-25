package de.amc17.dhbwplan.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import de.amc17.dhbwplan.entity.Dozent;


public interface DozentRepository extends CrudRepository<Dozent, Integer> {
	
	public List<Dozent> findBynachname(String name);
	public List<Dozent> findByemail(String mail);
	public List<Dozent> findByOrderByNachnameAsc();
//	public List<Dozent> findBygehalteneFaecher(String mail); 
//	public List<Dozent> findBymoeglicheFaecher(String mail);
	
	@Query("SELECT dozent FROM Dozent dozent WHERE dozent.studiengangsleiter=true AND dozent.user=null")
	public List<Dozent> allDozentOhneUser();
	
	public List<Dozent> findAll();
	public Dozent findByDID(int id);

}
