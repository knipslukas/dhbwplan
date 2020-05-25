package de.amc17.dhbwplan.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import de.amc17.dhbwplan.entity.Dozent;
import de.amc17.dhbwplan.entity.Studiengang;
import de.amc17.dhbwplan.service.DozentService;
import de.amc17.dhbwplan.service.StudiengangService;
import de.amc17.dhbwplan.service.UserService;

@Controller
@RequestMapping(path = "/studiengang")

public class StudiengangController {
	

	@Autowired
	private StudiengangService mStudiengangService;
	
	@Autowired
	private UserService userServ;

	@PostMapping(path = "/add")
	public String addStudiengang(@ModelAttribute Studiengang studg, RedirectAttributes redirectAttributes) {
		if (mStudiengangService.addStudiengang(studg) != null) {
			return "redirect:/studiengang/show/"+studg.getID();
		}
		else {
			redirectAttributes.addAttribute("studiengangCreated", false);
		}
		return "redirect:/studiengang/getAll/";
	}

	@GetMapping(value = "/delete/{aID}")
	public String deleteStudiengang(RedirectAttributes redirectAttributes, @PathVariable int aID) {
		if (mStudiengangService.deleteStudiengang(aID)) {
			redirectAttributes.addAttribute("StudiengangDeleted", true);
		}
		else {
			redirectAttributes.addAttribute("StudiengangDeleted", false);
		}
		return "redirect:/studiengang/getAll";
	}

	@PostMapping(path = "/update/{aID}")
	public String updateStudiengang(RedirectAttributes redirectAttributes, @ModelAttribute Studiengang aStudiengang) {
		if (mStudiengangService.updateStudiengang(aStudiengang)) {
			redirectAttributes.addAttribute("studiengangUpdated", true);
		}
		else {
			redirectAttributes.addAttribute("studiengangUpdated", false);
		}
		return "redirect:/studiengang/show/"+aStudiengang.getID();
	}
	 
	@GetMapping(path="/") 
	public String getAllDozent(Model model, @RequestParam (required = false) String name,
			@RequestParam(required = false) Object StudiengangDeleted,
			@RequestParam(required = false) Object StudiengangCreated) {
		 
		 model.addAttribute("studiengangList", mStudiengangService.getAllStudiengangs(name));
		 model.addAttribute("StudiengangDeleted", StudiengangDeleted);
		 model.addAttribute("studiengangCreated", StudiengangCreated);
		 model.addAttribute("pageTitle", "DHBW - Übersicht Dozenten");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "dozent/doz_overview";
	 }
	 
	 @GetMapping(path="/show/{aID}") 
	 public String getAllDozent(Model model, @PathVariable int aID, @RequestParam(required = false) Object dozentUpdated) {
		 model.addAttribute("dozent", mStudiengangService.getDozentByID(aID));
		 model.addAttribute("dozentUpdated", dozentUpdated);
		 model.addAttribute("pageTitle", "DHBW - Dozentansicht");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "dozent/doz_einzel";
		 
	 }
	 
	 @GetMapping(value = "/edit/{dID}")
	 public String editDozent(Model model, @PathVariable int dID) {
		 model.addAttribute("dozent", mStudiengangService.getDozentByID(dID));
		 model.addAttribute("pageTitle", "DHBW - Dozent bearbeiten");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "dozent/doz_edit";
	 }
	 
	 @GetMapping(value ="/add")
	 public String addDozentUi(Model model) {
		 model.addAttribute("pageTitle", "DHBW - Dozent Anlegen");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "dozent/doz_add";
	 }

}
