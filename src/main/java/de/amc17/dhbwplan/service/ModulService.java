package de.amc17.dhbwplan.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import de.amc17.dhbwplan.entity.Modul;
import de.amc17.dhbwplan.repository.ModulRepository;


@Service
public class ModulService 
{
	@Resource
	private ModulRepository modulRepository;
	
	private static final Logger LOG = LogManager.getLogger(UserService.class.getName());
	
	public Modul addModul(Modul aModul)
	{
		try 
		{
			if (aModul.getBezeichnung() == "") aModul.setBezeichnung("Keine Daten");
			if (aModul.getModulart() == "") aModul.setModulart("Keine Daten");
			modulRepository.save(aModul);
		}
		catch (Exception e)
		{
			return null;
		}
			return aModul;
	}
	
	public boolean deleteModul(int aMID)
	{
		try
		{
			modulRepository.deleteById(aMID);
		}
		catch(Exception e)
		{
			return false;
		}
		return true;
	}
	
	public boolean updateModul(Modul aModul)
	{
		try
		{
			Modul oModul;
			if((oModul = modulRepository.findById(aModul.getMID()).get())!= null)
			{
				modulRepository.save(aModul);
			}
			else
			{
				LOG.warn("Modul not found");
				return false;
			}
		}
		catch (Exception e)
		{
			LOG.error(e);
			return false;
		}
		return true;
	}
	
	public List<Modul> getAllModul(String aBezeichnung, String modulart) 
	{		
		try 
		{
			if (aBezeichnung != null) 
			{
				return modulRepository.findByBezeichnung(aBezeichnung);			
			} 
			List<Modul> list = modulRepository.findByOrderByBezeichnungAsc();
			if (!list.isEmpty()) 
			{
				return list;
			}
			else return null;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}
	}
	
	public Modul getModulByID(int aMID) 
	{
		try 
		{
			return modulRepository.findById(aMID).get(); 
		} 
		catch (Exception e )
		{
			return null;
		}
	}
	
	
	
}

