package de.amc17.dhbwplan.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import de.amc17.dhbwplan.entity.Termin;


public interface TerminRepository extends CrudRepository<Termin, Integer> {

	public List<Termin> findByDatum(String datum);

	public List<Termin> findByOrderByDatumAsc();
	
	public List<Termin> findAll();
	public Termin findByTID(int id);
}
