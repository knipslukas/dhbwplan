package de.amc17.dhbwplan.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import de.amc17.dhbwplan.entity.Kurs;
import de.amc17.dhbwplan.entity.Praesenzzeitraum;


public interface PraesenzzeitraumRepository extends CrudRepository<Praesenzzeitraum, Integer> {


	public List<Praesenzzeitraum> findAll();
	public Praesenzzeitraum findByPID(int id); 
	
	public List<Praesenzzeitraum> findAllByKursOrderBySemesterAsc(Kurs kurs);
	
}
