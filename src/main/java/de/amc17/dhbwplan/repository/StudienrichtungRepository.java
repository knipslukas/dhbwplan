package de.amc17.dhbwplan.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import de.amc17.dhbwplan.entity.Studiengang;
import de.amc17.dhbwplan.entity.Studienrichtung;


public interface StudienrichtungRepository extends CrudRepository<Studienrichtung, Integer> {

	public List<Studienrichtung> findByName(String name);

	public List<Studienrichtung> findByOrderByNameAsc();
	
	public List<Studienrichtung> findAll();
	public Studienrichtung findByriID(int id);

	public List<Studienrichtung> findAllByStudiengangOrderByNameAsc(Studiengang studiengang);
}
