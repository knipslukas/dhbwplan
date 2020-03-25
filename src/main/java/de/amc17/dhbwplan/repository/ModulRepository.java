package de.amc17.dhbwplan.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;


import de.amc17.dhbwplan.entity.Modul;

public interface ModulRepository extends CrudRepository<Modul, Integer> {

	public List<Modul> findByBezeichnung(String bezeichnung);
	
	public List<Modul> findByOrderByBezeichnungAsc();

	public List<Modul> findAll();
	public Modul findByMid(int id);
}
