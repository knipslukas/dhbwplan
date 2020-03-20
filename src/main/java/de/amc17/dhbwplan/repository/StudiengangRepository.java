package de.amc17.dhbwplan.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;


import de.amc17.dhbwplan.entity.Studiengang;

public interface StudiengangRepository extends CrudRepository<Studiengang, Integer> {

	public List<Studiengang> findByName(String name);

	public List<Studiengang> findByOrderByNameAsc();
	
	public List<Studiengang> findAll();
	public Studiengang findByStID(int id);

}
