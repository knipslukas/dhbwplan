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

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;


@Service
public class DozentService {

	@Resource
	private DozentRepository dozentRepository;
	
	private static final Logger LOG = LogManager.getLogger(UserService.class.getName());


	public Dozent addDozent(Dozent aDozent) {
		
		try {
			if (aDozent.getNotiz() == "") aDozent.setNotiz("Keine Daten");
			if (aDozent.getSchwerpunkt() == "") aDozent.setSchwerpunkt("Keine Daten");
			dozentRepository.save(aDozent);
		} catch (Exception e) {
			return null;
		}
		 
		return aDozent;
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
			Dozent oDozent;
			if ((oDozent = dozentRepository.findByDID(aDozent.getDID())) != null) { 
				if (oDozent.getUser() != null) {
					if (oDozent.getUser().getEmail() != aDozent.getEmail()) {
						aDozent.setUser(oDozent.getUser());
						aDozent.getUser().setEmail(aDozent.getEmail());
					}
				}
				dozentRepository.save(aDozent);
			} else {
				LOG.warn("Dozent not found");
				return false;
			}
		} catch (Exception e) {
			LOG.error(e);
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
			List<Dozent> list = dozentRepository.findByOrderByNachnameAsc();
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
	
	public List<Dozent> getAllDozentForUser() {
		try {
			return dozentRepository.allDozentOhneUser();
		}
		catch (Exception e) {
			LOG.error("DozentService - No Users found or Query invalid! \n "+e);
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
