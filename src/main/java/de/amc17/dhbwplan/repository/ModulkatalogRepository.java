package de.amc17.dhbwplan.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import de.amc17.dhbwplan.entity.Modulkatalog;


public interface ModulkatalogRepository extends CrudRepository<Modulkatalog, Integer> {

	
	public List<Modulkatalog> findAll();
	public Modulkatalog findByMKID(int id);
}
