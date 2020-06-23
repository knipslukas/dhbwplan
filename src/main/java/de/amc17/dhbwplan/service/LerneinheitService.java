package de.amc17.dhbwplan.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import de.amc17.dhbwplan.entity.Lerneinheit;
import de.amc17.dhbwplan.entity.Modul;
import de.amc17.dhbwplan.repository.LerneinheitRepository;

@Service
public class LerneinheitService {
	@Resource
	private LerneinheitRepository LerneinheitRepository;

	private static final Logger LOG = LogManager.getLogger(UserService.class.getName());

	public Lerneinheit addLerneinheit(Lerneinheit aLerneinheit) {
		try {
			if (String.valueOf(aLerneinheit.getPraesenzzeit()) == null) aLerneinheit.setPräsenzzeit(0);
			if (String.valueOf(aLerneinheit.getSelbststudium()) == null) aLerneinheit.setSelbststudium(0);
			if (aLerneinheit.getName() == "") aLerneinheit.setName("Keine Daten");
			LerneinheitRepository.save(aLerneinheit);
		} catch (Exception e) {
			return null;
		}
		return aLerneinheit;
	}

	public boolean deleteLerneinheit(int aLEID) {
		try {
			LerneinheitRepository.deleteById(aLEID);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public boolean updateLerneinheit(Lerneinheit aLerneinheit) {
		try {
			Lerneinheit oLerneinheit;
			if ((oLerneinheit = LerneinheitRepository.findByLEID(aLerneinheit.getLEID())) != null) {
				LerneinheitRepository.save(aLerneinheit);
			} else {
				LOG.warn("Lerneinheit not found");
				return false;
			}
		} catch (Exception e) {
			LOG.error(e);
			return false;
		}
		return true;
	}

	public List<Lerneinheit> getAllLerneinheit(String aName) {
		try {
			if (aName != null) {
				return LerneinheitRepository.findAllByName(aName);
			}
			List<Lerneinheit> list = LerneinheitRepository.findByOrderByNameAsc();
			if (!list.isEmpty()) {
				return list;
			} else
				return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Lerneinheit getLerneinheitByID(int aLEID) {
		try {
			return LerneinheitRepository.findByLEID(aLEID);
		} catch (Exception e) {
			return null;
		}
	}
	
	public List<Lerneinheit> getAllLee(Modul modul) {
		try {
			return LerneinheitRepository.findAllByModulOrderByNameAsc(modul);
		}catch(Exception e) {
			LOG.error("Could not load LEE"+e);
			return null;
		}
	}
}