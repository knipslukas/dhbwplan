
package de.amc17.dhbwplan.service;


import java.util.Optional;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import de.amc17.dhbwplan.entity.Dozent;
import de.amc17.dhbwplan.entity.Studiengang;
import de.amc17.dhbwplan.entity.Studienrichtung;
import de.amc17.dhbwplan.repository.DozentRepository;
import de.amc17.dhbwplan.repository.StudiengangRepository;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;


@Service
public class StudiengangService {

	@Resource
	private StudiengangRepository studiengangRepository;
	
	private static final Logger LOG = LogManager.getLogger(UserService.class.getName());


	public Studiengang addStudiengang(Studiengang aStudiengang) {
		
		try {
			if (aStudiengang.getBeschreibung() == "") aStudiengang.setBeschreibung("Keine Daten");
			if (aStudiengang.getName() == "") aStudiengang.setName("Keine Daten");
			studiengangRepository.save(aStudiengang);
		} catch (Exception e) {
			return null;
		}
		 
		return aStudiengang;
	}

	public boolean deleteStudiengang(int aDID) {
		try {
			studiengangRepository.deleteById(aDID);
		} catch (Exception e){
			return false;
		}
		return true;
	}
	
	public boolean updateStudiengang(Studiengang aStudiengang) {
		try {
			Studiengang oStudiengang;
			if ((oStudiengang = studiengangRepository.findByStID(aStudiengang.getStID())) != null) { 
				studiengangRepository.save(aStudiengang);
			} else {
				LOG.warn("Studiengang not found");
				return false;
			}
		} catch (Exception e) {
			LOG.error(e);
			return false;
		}
		
		return true;
	}

	public List<Studiengang> getAllStudiengangs(String aName) {		
		try {
			if (aName != null) {
				return studiengangRepository.findByName(aName);	
			} 
			List<Studiengang> list = studiengangRepository.findByOrderByNameAsc();
			if (!list.isEmpty()) {
				return list;
			}
			else return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}	

	public Studiengang getStudiengangByID(int aSID) {
		try {
			return studiengangRepository.findByStID(aSID); 
		} catch (Exception e ){
			return null;
		}
	}
	
	

	public List<Studienrichtung> getAllSturi(int stid) {
		try {
			Studiengang studiengang = studiengangRepository.findById(stid).get();
			return studiengang.getStudienrichtung();
		}
		catch(Exception e) {
			LOG.error("Couldn't load Kurslist" + e);
			return null;
		}
	}
	
	public List<Studiengang> getAllStuga(){
		return studiengangRepository.findAll();
	}
	
	
}