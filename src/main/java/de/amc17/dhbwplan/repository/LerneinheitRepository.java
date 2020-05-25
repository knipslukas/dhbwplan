package de.amc17.dhbwplan.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import de.amc17.dhbwplan.entity.Dozent;
import de.amc17.dhbwplan.entity.Lerneinheit;


public interface LerneinheitRepository extends CrudRepository<Lerneinheit, Integer> {

	public List<Lerneinheit> findbyBezeichnung (String bezeichnung);
	public List<Lerneinheit> findByOrderByBezeichnungAsc();
	public List<Lerneinheit> findAll();
	public Lerneinheit findByLEID(int id);
}
