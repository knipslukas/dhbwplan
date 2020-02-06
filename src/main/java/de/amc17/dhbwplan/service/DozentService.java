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
	

	public List<Dozent> getDozentByNachname(String aNachname) {
		
		List<Dozent> temp = dozentRepository.findAll();
		List<Dozent> result = temp.stream()
			     .filter(item -> item.getmNachname().equals(aNachname))
			     .collect(Collectors.toList());
		
		return result;
		
	}
	
	public List<Dozent> getDozentByEmail(String aEmail) {
		
		List<Dozent> temp = dozentRepository.findAll();
		List<Dozent> result = temp.stream()
			     .filter(item -> item.getmEmail().equals(aEmail))
			     .collect(Collectors.toList());
		
		return result;
	}

}
