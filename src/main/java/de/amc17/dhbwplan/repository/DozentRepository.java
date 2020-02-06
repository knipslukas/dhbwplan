package de.amc17.dhbwplan.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import de.amc17.dhbwplan.entity.Dozent;


public interface DozentRepository extends CrudRepository<Dozent, Integer> {
	
		public List<Dozent> findAll();
}
