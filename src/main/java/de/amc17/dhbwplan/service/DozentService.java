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
	
	public boolean updateDozent(Dozent aDozent) {
		try {
			if (dozentRepository.findById(aDozent.getDID()).isPresent()) { 
				dozentRepository.save(aDozent);
			} else {
				return false;
			}
		} catch (Exception e) {
			
			return false;
		}
		
		return true;
	}

	public List<Dozent> getAllDozent(String aNachname, String aEmail) {		
		try {
			if (aNachname != null) {
				return dozentRepository.findBynachname(aNachname);			
			} else if (aEmail != null) {
				return dozentRepository.findByemail(aEmail);
			}
			List<Dozent> list = dozentRepository.findAll();
			if (!list.isEmpty()) {
				return list;
			}
			else return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Dozent getDozentByID(int aDID) {
		try {
			return dozentRepository.findByDID(aDID); 
		} catch (Exception e ){
			return null;
		}
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
