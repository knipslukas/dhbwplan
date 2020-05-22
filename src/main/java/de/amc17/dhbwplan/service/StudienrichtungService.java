package de.amc17.dhbwplan.service;


import java.util.Optional;

import javax.annotation.Resource;
import java.util.Date;

import org.springframework.stereotype.Service;

import de.amc17.dhbwplan.entity.Studienrichtung;
import de.amc17.dhbwplan.repository.StudienrichtungRepository;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;


@Service
public class StudienrichtungService {

	@Resource
	private StudienrichtungRepository StudienrichtungRepository;
	
	private static final Logger LOG = LogManager.getLogger(UserService.class.getName());


	public Studienrichtung addStudienrichtung(Studienrichtung aStudienrichtung) {
		
		try {
			StudienrichtungRepository.save(aStudienrichtung);
		} catch (Exception e) {
			return null;
		}
		 
		return aStudienrichtung;
	}

	public boolean deleteStudienrichtung(int riID) {
		try {
			StudienrichtungRepository.deleteById(riID);
		} catch (Exception e){
			return false;
		}
		return true;
	}
	
	public boolean updateStudienrichtung(Studienrichtung aStudienrichtung) {
		try {
			Studienrichtung oStudienrichtung;
			if ((oStudienrichtung = StudienrichtungRepository.findByriID(aStudienrichtung.getriID())) != null) { 
						aStudienrichtung.setName(oStudienrichtung.getName());
				StudienrichtungRepository.save(aStudienrichtung);
			} else {
				LOG.warn("Studienrichtung not found");
				return false;
			}
		} catch (Exception e) {
			LOG.error(e);
			return false;
		}
		
		return true;
	}

	public List<Studienrichtung> getAllStudienrichtung(String name) {		
		try {
			if (name != null) {
				return StudienrichtungRepository.findAll();		
			}
			List<Studienrichtung> list = StudienrichtungRepository.findAll();
			if (!list.isEmpty()) {
				return list;
			}
			else return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Studienrichtung getStudienrichtungByID(int riID) {
		try {
			return StudienrichtungRepository.findByriID(riID); 
		} catch (Exception e ){
			return null;
		}
	}
	
}
