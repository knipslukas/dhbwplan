package de.amc17.dhbwplan.service;

import java.util.Optional;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import de.amc17.dhbwplan.entity.Dozent;
import de.amc17.dhbwplan.repository.DozentRepository;

@Service
public class DozentService {

	@Resource
	private DozentRepository dozentRepository;

	public Dozent addDozent(int aDID, Dozent aDozent) {

		dozentRepository.save(aDozent);
		return aDozent;
	}

	public Dozent deleteDozent(int aDID) {
		Optional<Dozent> deleted = dozentRepository.findById(aDID);
		if (deleted.isPresent())
			dozentRepository.deleteById(aDID);
		return deleted.orElse(new Dozent());
	}
	
	public Dozent updateDozent(int aDID, Dozent aDozent) {
		Optional<Dozent> updated = dozentRepository.findById(aDID);
		if (updated.isPresent())
			dozentRepository.save(aDozent);
		return updated.orElse(new Dozent());
	}

	public Iterable<Dozent> getAllDozent() {
		
		return dozentRepository.findAll();
	}

	public Dozent getDozentByID(int aDID) {
		
		Optional<Dozent> temp = dozentRepository.findById(aDID);
		return temp.orElse(new Dozent());
	}
	

	public String getDozentNachnameByID(int aDID) {
		
		Optional<Dozent> temp = dozentRepository.findById(aDID);
		return temp.orElse(new Dozent()).getmNachname();
		
	}
	
	public String getDozentEmailByID(int aDID) {
		
		Optional<Dozent> temp = dozentRepository.findById(aDID);
		return temp.orElse(new Dozent()).getmEmail();
		
	}

}
