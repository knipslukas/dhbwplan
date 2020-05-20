package de.amc17.dhbwplan.service;

import java.util.Optional;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import de.amc17.dhbwplan.entity.Modul;
import de.amc17.dhbwplan.repository.ModulRepository;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;


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
			if((oModul = modulRepository.findByMID(aModul.getMID()))!= null)
			{
				if(oModul.getUser() != null)
				{
					if (oModul.getUser().getBezeichnung() != aModul.getBezeichnung())
					{
						aModul.setUser(oModul.getUser());
						aModul.getUser().setBezeichnung(aModul.getBezeichnung());
					}
				}
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
	
	public List<Modul> getAllModul(String aBezeichnung, String aModulart) 
	{		
		try 
		{
			if (aBezeichnung != null) 
			{
				return modulRepository.findBybezeichnung(aBezeichnung);			
			} 
			else if (aModulart != null) 
			{
				return modulRepository.findBymodulart(aModulart);
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
			return modulRepository.findByMID(aMID); 
		} 
		catch (Exception e )
		{
			return null;
		}
	}
	
	public List<Modul> getAllModulForUser() 
	{
		try 
		{
			return modulRepository.allModulOhneUser();
		}
		catch (Exception e) 
		{
			LOG.error("ModulService - No Users found or Query invalid! \n "+e);
			return null;
		}
	}
	
	
}

