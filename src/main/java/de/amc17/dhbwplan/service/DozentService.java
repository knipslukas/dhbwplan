package de.amc17.dhbwplan.service;


import java.util.Optional;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import de.amc17.dhbwplan.entity.Dozent;
import de.amc17.dhbwplan.repository.DozentRepository;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;


@Service
public class DozentService {

	@Resource
	private DozentRepository dozentRepository;


	public boolean addDozent(Dozent aDozent) {
		
		try {
			dozentRepository.save(aDozent);
		} catch (Exception e) {
			return false;
		}
		 
		return true;
	}

	public boolean deleteDozent(int aDID) {
		try {
			dozentRepository.deleteById(aDID);
		} catch (Exception e){
			return false;
		}
		return true;
	}
	
	public boolean updateDozent(int aDID, Dozent aDozent) {
		try {
			dozentRepository.findById(aDID); 
			dozentRepository.save(aDozent);
		} catch (Exception e) {
			return false;
		}
		
		return true;
	}

	public List<Dozent> getAllDozent(String aNachname, String aEmail) {
		
		if (!aNachname.isEmpty()) {
			return dozentRepository.findBynachname(aNachname);			
		} else if (!aEmail.isEmpty()) {
			return dozentRepository.findByemail(aEmail);
		}
		
		return dozentRepository.findAll();
	}

	public Dozent getDozentByID(int aDID) {
		
			return dozentRepository.findByDID(aDID);
	}
//	
// 
//	public List<Dozent> getDozentByNachname(String aNachname) {
//		
//		return dozentRepository.findBynachname(aNachname);	
//	}
//	
//	public List<Dozent> getDozentByEmail(String aEmail) {
//		
////		List<Dozent> temp = dozentRepository.findBymEmail(aEmail);
////		return temp;
//
//		
//		return result;
//	}

}
