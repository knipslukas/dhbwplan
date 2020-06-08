package de.amc17.dhbwplan.service;

import java.util.Optional;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import de.amc17.dhbwplan.entity.Kurs;
import de.amc17.dhbwplan.entity.Praesenzzeitraum;
import de.amc17.dhbwplan.repository.KursRepository;

import java.util.Comparator;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class KursService {

	@Resource
	private KursRepository kursRepository;

	private static final Logger LOG = LogManager.getLogger(UserService.class.getName());

	public Kurs addKurs(Kurs aKurs) {

		try {
			kursRepository.save(aKurs);
		} catch (Exception e) {
			return null;
		}

		return aKurs;
	}

	public boolean deleteKurs(int aKID) {
		try {
			kursRepository.deleteById(aKID);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public boolean updateKurs(Kurs aKurs) {
		try {
			// TO-DO: Testen
			kursRepository.save(aKurs);

		} catch (Exception e) {
			LOG.error(e);
			return false;
		}

		return true;
	}

	public List<Kurs> getAllKurs() {
		try {
			List<Kurs> list = kursRepository.findByOrderByJahrgangAsc();
			if (!list.isEmpty()) {
				return list;
			} else
				return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<Kurs> getAllKursByJahrgang(int aJahrgang) {
		try {
			return kursRepository.findByJahrgang(aJahrgang);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<Kurs> getAllKursByName(String aName) {
		try {
			return kursRepository.findByName(aName);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Kurs getKursByID(int aDID) {
		try {
			return kursRepository.findByKID(aDID);
		} catch (Exception e) {
			return null;
		}
	}
	


}
