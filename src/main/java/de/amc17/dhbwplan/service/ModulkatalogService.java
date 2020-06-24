package de.amc17.dhbwplan.service;


import java.util.Optional;

import javax.annotation.Resource;
import java.util.Date;

import org.springframework.stereotype.Service;

import de.amc17.dhbwplan.entity.Modul;
import de.amc17.dhbwplan.entity.Modulkatalog;
import de.amc17.dhbwplan.entity.Studienrichtung;
import de.amc17.dhbwplan.repository.ModulkatalogRepository;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;


@Service
public class ModulkatalogService {

	@Resource
	private ModulkatalogRepository ModulkatalogRepository;
	
	private static final Logger LOG = LogManager.getLogger(UserService.class.getName());


	public Modulkatalog addModulkatalog(Modulkatalog aModulkatalog) {
		
		try {
			ModulkatalogRepository.save(aModulkatalog);
		} catch (Exception e) {
			return null;
		}
		 
		return aModulkatalog;
	}

	public boolean deleteModulkatalog(int MKID) {
		try {
			ModulkatalogRepository.deleteById(MKID);
		} catch (Exception e){
			return false;
		}
		return true;
	}
	
	public boolean updateModulkatalog(Modulkatalog aModulkatalog) {
		try {
			Modulkatalog oModulkatalog;
			if ((oModulkatalog = ModulkatalogRepository.findByMKID(aModulkatalog.getMKID())) != null) { 
						oModulkatalog.setGueltigVon(aModulkatalog.getGueltigVon());
						oModulkatalog.setGueltigBis(aModulkatalog.getGueltigBis());
						oModulkatalog.setStudienrichtung(aModulkatalog.getStudienrichtung());
						oModulkatalog.setName(aModulkatalog.getName());
				ModulkatalogRepository.save(oModulkatalog);
			} else {
				LOG.warn("Modulkatalog not found");
				return false;
			}
		} catch (Exception e) {
			LOG.error(e);
			return false;
		}
		
		return true;
	}

	public List<Modulkatalog> getAllModulkatalog() {		
		try {
			List<Modulkatalog> list = ModulkatalogRepository.findAll();
			if (!list.isEmpty()) {
				return list;
			}
			else return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Modulkatalog getModulkatalogByID(int MKID) {
		try {
			return ModulkatalogRepository.findByMKID(MKID); 
		} catch (Exception e ){
			return null;
		}
	}
	
	public List<Modulkatalog> getAllMOK(Studienrichtung studienrichtung) {
		try {
			return ModulkatalogRepository.findAllByStudienrichtung(studienrichtung);
		}catch(Exception e) {
			LOG.error("Could not load MOK"+e);
      return null;
    }
}
	public List<Modul> getAllModul(int modulID) {
		try {
			Modulkatalog modulk = ModulkatalogRepository.findById(modulID).get();
			return modulk.getModul();
		}
		catch(Exception e) {
			LOG.error("Couldn't load Kurslist" + e);
			return null;
		}
	}
	
}
