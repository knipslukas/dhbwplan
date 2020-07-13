package de.amc17.dhbwplan.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import de.amc17.dhbwplan.entity.Modulkatalog;
import de.amc17.dhbwplan.entity.Studienrichtung;


public interface ModulkatalogRepository extends CrudRepository<Modulkatalog, Integer> {

	
	public List<Modulkatalog> findAll();
	public Modulkatalog findByMKID(int MKID);
	
	public List<Modulkatalog> findAllByStudienrichtung(Studienrichtung studienrichtung);
	
	public Modulkatalog findByStudienrichtungAndGueltigvonLessThanEqualAndGueltigbisGreaterThan(Studienrichtung studienrichtung, Date gueltigvon, Date gueltigbis);
	
	public int countByGueltigvonGreaterThanEqual(Date gueltigvon);
}
