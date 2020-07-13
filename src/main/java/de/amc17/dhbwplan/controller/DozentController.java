package de.amc17.dhbwplan.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import de.amc17.dhbwplan.data.DozentLeeDto;
import de.amc17.dhbwplan.entity.Dozent;
import de.amc17.dhbwplan.entity.Lerneinheit;
import de.amc17.dhbwplan.service.DozentService;
import de.amc17.dhbwplan.service.LerneinheitService;
import de.amc17.dhbwplan.service.ModulService;
import de.amc17.dhbwplan.service.UserService;

@Controller
@RequestMapping(path = "/dozent")

public class DozentController {
	

	@Autowired
	private DozentService mDozentService;
	
	@Autowired
	private ModulService mModulService;
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private LerneinheitService mLernServ;
	

	@PostMapping(path = "/add")
	public String addDozent(@ModelAttribute Dozent doz, RedirectAttributes redirectAttributes) {
		if (mDozentService.addDozent(doz) != null) {
			return "redirect:/dozent/show/"+doz.getDID();
		}
		else {
			redirectAttributes.addAttribute("dozentCreated", false);
		}
		return "redirect:/dozent/";
	}

	@GetMapping(value = "/delete/{aID}")
	public String deleteDozent(RedirectAttributes redirectAttributes, @PathVariable int aID) {
		if (mDozentService.deleteDozent(aID)) {
			redirectAttributes.addAttribute("dozentDeleted", true);
		}
		else {
			redirectAttributes.addAttribute("dozentDeleted", false);
		}
		return "redirect:/dozent/";
	}

	@PostMapping(path = "/update/{aID}")
	public String updateDozent(RedirectAttributes redirectAttributes, @ModelAttribute Dozent aDozent) {
		if (mDozentService.updateDozent(aDozent)) {
			redirectAttributes.addAttribute("dozentUpdated", true);
		}
		else {
			redirectAttributes.addAttribute("dozentUpdated", false);
		}
		return "redirect:/dozent/show/"+aDozent.getDID();
	}
	 
	 @GetMapping(path="") 
	 public String getAllDozent(Model model, @RequestParam (required = false) String nachname, 
			 @RequestParam (required = false) String email, @RequestParam(required = false) Object dozentDeleted,
			 @RequestParam(required = false) Object dozentCreated) {
		 
		 model.addAttribute("dozentList", mDozentService.getAllDozent(nachname, email));
		 model.addAttribute("dozentDeleted", dozentDeleted);
		 model.addAttribute("dozentCreated", dozentCreated);
		 model.addAttribute("pageTitle", "DHBW - Übersicht Dozenten");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "dozent/doz_overview";
	 }
	 
	 @GetMapping(path="/show/{aID}") 
	 public String getAllDozent(Model model, @PathVariable int aID, @RequestParam(required = false) Object dozentUpdated) {
		 model.addAttribute("dozent", mDozentService.getDozentByID(aID));
		 model.addAttribute("dozentUpdated", dozentUpdated);
		 model.addAttribute("pageTitle", "DHBW - Dozentansicht");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "dozent/doz_einzel";
		 
	 }
	 
	 @GetMapping(value = "/edit/{dID}")
	 public String editDozent(Model model, @PathVariable int dID) {
		 model.addAttribute("dozent", mDozentService.getDozentByID(dID));
		 model.addAttribute("pageTitle", "DHBW - Dozent bearbeiten");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 model.addAttribute("modulListe", mModulService.getAllModul(null, null));
		 return "dozent/doz_edit";
	 }
	 
	 @GetMapping(value ="/add")
	 public String addDozentUi(Model model) {
		 model.addAttribute("pageTitle", "DHBW - Dozent Anlegen");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "dozent/doz_add";
	 }
	 
	 
	 @GetMapping(value = "/getAllLee/{dozid}", produces = "application/json")
	 @ResponseBody
	 public List<DozentLeeDto> getAllLerneinheits(@PathVariable int dozid) {
		 List<Lerneinheit> lees = mDozentService.getAllLerneinheitenForDozetn(dozid);
		 List<DozentLeeDto> dtos = new ArrayList<DozentLeeDto>();
		 for(Lerneinheit lee : lees) {
			 DozentLeeDto dto = new DozentLeeDto();
			 dto.setName(lee.getName());
			 dto.setModulName(lee.getModul().getBezeichnung());
			 dto.setLeid(lee.getLEID());
			 dtos.add(dto);
		 }
		 return dtos;
	 }
	 
	 @GetMapping(value = "/getLee/{modId}", produces = "application/json")
	 @ResponseBody
	 public List<Lerneinheit> getAllLerneinheiten(@PathVariable int modId) {
		 return mLernServ.getAllLee(mModulService.getModulByID(modId));
	 }
	 
	 @PostMapping(value = "/addLEE", produces = "application/json", consumes = "application/json")
	 @ResponseBody
	 public DozentLeeDto addLerneinheit(@RequestBody DozentLeeDto lee) {
		 Lerneinheit lerneinheit = mLernServ.getLerneinheitByID(lee.getLeid());
		 Dozent dozent = mDozentService.getDozentByID(lee.getDozid());
		 
		 dozent.getKannhalten().add(lerneinheit);
		 lerneinheit.getHaelt().add(dozent);
		 dozent = mDozentService.updateLeeDozent(dozent);
		 lerneinheit = mLernServ.updateLerneinheit(lerneinheit);
		 
		 if (dozent != null) {
			 return lee;
		 }
		 return null;
	 }
	 
	@PostMapping(value = "/deleteLee", produces="application/json", consumes="application/json")
	@ResponseBody
	public boolean deleteLee(@RequestBody DozentLeeDto dto) {
		Dozent dozent = mDozentService.getDozentByID(dto.getDozid());
		Lerneinheit lee = mLernServ.getLerneinheitByID(dto.getLeid());
		dozent.getKannhalten().remove(lee);
		lee.getHaelt().remove(dozent);
		
		if (mDozentService.updateDozent(dozent) && mLernServ.updateLerneinheit(lee) != null) {
				return true;
		}
		return false;
	}

}
