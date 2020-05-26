package de.amc17.dhbwplan.service;


import java.util.Optional;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import de.amc17.dhbwplan.entity.Vorlesung;
import de.amc17.dhbwplan.repository.VorlesungRepository;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;


@Service
public class VorlesungService {

	@Resource
	private VorlesungRepository VorlesungRepository;
	
	private static final Logger LOG = LogManager.getLogger(UserService.class.getName());


	public Vorlesung addVorlesung(Vorlesung aVorlesung) {
		
		try {
			if (aVorlesung.getName() == "") aVorlesung.setName("KeinName");
			VorlesungRepository.save(aVorlesung);
		} catch (Exception e) {
			return null;
		}
		 
		return aVorlesung;
	}

	public boolean deleteVorlesung(int VID) {
		try {
			VorlesungRepository.deleteById(VID);
		} catch (Exception e){
			return false;
		}
		return true;
	}
	
	public boolean updateVorlesung(Vorlesung aVorlesung) {
		try {
			Vorlesung oVorlesung;
			if ((oVorlesung = VorlesungRepository.findByVID(aVorlesung.getVID())) != null) { 
					aVorlesung.setName(oVorlesung.getName());
					aVorlesung.setVorlesungsstunden(oVorlesung.getVorlesungsstunden());
				VorlesungRepository.save(aVorlesung);
			} else {
				LOG.warn("Vorlesung not found");
				return false;
			}
		} catch (Exception e) {
			LOG.error(e);
			return false;
		}
		
		return true;
	}

	public List<Vorlesung> getAllVorlesung(String name, int vorlesungsstunden) {		
		try {
			if (name != null) {
				return VorlesungRepository.findAll();			
			} 
			List<Vorlesung> list = VorlesungRepository.findAll();
			if (!list.isEmpty()) {
				return list;
			}
			else return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Vorlesung getVorlesungByVID(int VID) {
		try {
			return VorlesungRepository.findByVID(VID); 
		} catch (Exception e ){
			return null;
		}
	}
	
}
