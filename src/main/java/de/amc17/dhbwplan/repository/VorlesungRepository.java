package de.amc17.dhbwplan.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import de.amc17.dhbwplan.entity.Vorlesung;


public interface VorlesungRepository extends CrudRepository<Vorlesung, Integer> {

	public List<Vorlesung> findByName(String name);

	public List<Vorlesung> findByOrderByNameAsc();
	
	public List<Vorlesung> findAll();
	public Vorlesung findByVID(int VID);
}
