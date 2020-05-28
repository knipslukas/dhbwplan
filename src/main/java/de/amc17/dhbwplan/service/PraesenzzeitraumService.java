package de.amc17.dhbwplan.service;


import java.util.Optional;

import javax.annotation.Resource;
import java.util.Date;

import org.springframework.stereotype.Service;

import de.amc17.dhbwplan.entity.Praesenzzeitraum;
import de.amc17.dhbwplan.repository.PraesenzzeitraumRepository;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;


@Service
public class PraesenzzeitraumService {

	@Resource
	private PraesenzzeitraumRepository PraesenzzeitraumRepository;
	
	private static final Logger LOG = LogManager.getLogger(UserService.class.getName());


	public Praesenzzeitraum addPraesenzzeitraum(Praesenzzeitraum aPraesenzzeitraum) {
		
		try {
			PraesenzzeitraumRepository.save(aPraesenzzeitraum);
		} catch (Exception e) {
			return null;
		}
		 
		return aPraesenzzeitraum;
	}

	public boolean deletePraesenzzeitraum(int PID) {
		try {
			PraesenzzeitraumRepository.deleteById(PID);
		} catch (Exception e){
			return false;
		}
		return true;
	}
	
	public boolean updatePraesenzzeitraum(Praesenzzeitraum aPraesenzzeitraum) {
		try {
			Praesenzzeitraum oPraesenzzeitraum;
			if ((oPraesenzzeitraum = PraesenzzeitraumRepository.findByPID(aPraesenzzeitraum.getPID())) != null) { 
						aPraesenzzeitraum.setSemester(oPraesenzzeitraum.getSemester());
						aPraesenzzeitraum.setVon(oPraesenzzeitraum.getVon());
						aPraesenzzeitraum.setBis(oPraesenzzeitraum.getBis());
				PraesenzzeitraumRepository.save(aPraesenzzeitraum);
			} else {
				LOG.warn("Praesenzzeitraum not found");
				return false;
			}
		} catch (Exception e) {
			LOG.error(e);
			return false;
		}
		
		return true;
	}

	public List<Praesenzzeitraum> getAllPraesenzzeitraum(int semester, Date von, Date bis) {		
		try {
			if (semester != 0) {
				return PraesenzzeitraumRepository.findAll();		
			}
			List<Praesenzzeitraum> list = PraesenzzeitraumRepository.findAll();
			if (!list.isEmpty()) {
				return list;
			}
			else return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Praesenzzeitraum getPraesenzzeitraumByID(int PID) {
		try {
			return PraesenzzeitraumRepository.findByPID(PID); 
		} catch (Exception e ){
			return null;
		}
	}
	
}
