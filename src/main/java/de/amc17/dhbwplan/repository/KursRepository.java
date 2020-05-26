package de.amc17.dhbwplan.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import de.amc17.dhbwplan.entity.Kurs;

public interface KursRepository extends CrudRepository<Kurs, Integer> {

	public List<Kurs> findByName(String name);

	public List<Kurs> findByJahrgang(int jahrgang);

	public List<Kurs> findByOrderByNameAsc();

	public List<Kurs> findByOrderByJahrgangAsc();

	public List<Kurs> findAll();

	public Kurs findByKID(int id);
}
