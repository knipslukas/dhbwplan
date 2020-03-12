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
import de.amc17.dhbwplan.service.DozentService;
import de.amc17.dhbwplan.service.UserService;

@Controller
@RequestMapping(path = "/dozent")

public class DozentController {
	

	@Autowired
	private DozentService mDozentService;
	
	@Autowired
	private UserService userServ;
	
	@GetMapping(value ="")
	public String redirectMain() {
		return "redirect:/dozent/getAll";
	}

	@PostMapping(path = "/add")
	public String addDozent(@ModelAttribute Dozent doz, RedirectAttributes redirectAttributes) {
		if (mDozentService.addDozent(doz)) {
			redirectAttributes.addAttribute("dozentCreated", true);
		}
		else {
			redirectAttributes.addAttribute("dozentCreated", false);
		}
		return "redirect:/dozent/getAll";
	}

	@GetMapping(value = "/delete/{aID}")
	public String deleteDozent(RedirectAttributes redirectAttributes, @PathVariable int aID) {
		if (mDozentService.deleteDozent(aID)) {
			redirectAttributes.addAttribute("dozentDeleted", true);
		}
		else {
			redirectAttributes.addAttribute("dozentDeleted", false);
		}
		//model.addAttribute("userName", userServ.getCurrentUser().getUsername());
		return "redirect:/dozent/getAll";
	}

	@PostMapping(path = "/update/{aID}")
	public String updateDozent(Model model, @RequestBody Dozent aDozent) {
		if (mDozentService.updateDozent(aDozent)) {
			model.addAttribute("dozentUpdated", true);
		}
		else {
			model.addAttribute("dozentUpdated", false);
		}
		model.addAttribute("pageTitle", "DHBW - Dozentansicht");
		model.addAttribute("userName", userServ.getCurrentUser().getUsername());
		return "dozent/doz_overview";
	}
	 
	 @GetMapping(path="/getAll") //TO DO other params (?) Faecher etc.
	 public String getAllDozent(Model model, @RequestParam (required = false) String nachname, 
			 @RequestParam (required = false) String email, @RequestParam(required = false) Object dozentDeleted,
			 @RequestParam(required = false) Object dozentCreated) {
		 
		 model.addAttribute("dozentList", mDozentService.getAllDozent(nachname, email));
		 model.addAttribute("dozentCreated", dozentCreated);
		 model.addAttribute("dozentDeleted", dozentDeleted);
		 model.addAttribute("pageTitle", "DHBW - Übersicht Dozenten");
		 //model.addAttribute("userName", userServ.getCurrentUser().getUsername());
		 return "dozent/doz_overview";
	 }
	 
	 @GetMapping(path="/show/{aID}") 
	 public String getAllDozent(Model model, @PathVariable int aID) {
		 model.addAttribute("dozent", mDozentService.getDozentByID(aID));	
		 model.addAttribute("pageTitle", "DHBW - Dozentansicht");
		 //model.addAttribute("userName", userServ.getCurrentUser().getUsername());
		 return "dozent/doz_einzel";
		 
	 }
	 
	 @GetMapping(value = "/edit/{dID}")
	 public String editDozent(Model model, @PathVariable int dID) {
		 model.addAttribute("dozent", mDozentService.getDozentByID(dID));
		 model.addAttribute("pageTitle", "DHBW - Dozent bearbeiten");
		 return "dozent/doz_edit";
	 }
	 
	 @GetMapping(value ="/add")
	 public String addDozentUi(Model model) {
		 model.addAttribute("pageTitle", "DHBW - Dozent Anlegen");
		 //model.addAttribute("userName", userServ.getCurrentUser().getUsername());
		 return "dozent/doz_add";
	 }
	 
//	 @GetMapping(path="/getByID/{aID}") 
//	 @ResponseBody
//	 public Dozent getDozentByID(@PathVariable int aID) {
//		 return mDozentService.getDozentByID(aID);
//	 }
//	 
//
//	 @GetMapping(path="/getByNachname/{aNachname}") 
//	 @ResponseBody
//	 public List<Dozent> getDozentByNachname(@PathVariable String aNachname) {
//		 return mDozentService.getDozentByNachname(aNachname);	 
//	 }
//	 
//	 @GetMapping(path="/getByEmail/{aEmail}") 
//	 @ResponseBody
//	 public List<Dozent> getDozentByEmail(@PathVariable String aEmail) {
//		 return mDozentService.getDozentByEmail(aEmail);
//		
//	 }

//	 @GetMapping(path="/Get/Dozent/MoeglicheFaecher") 
//	 public Iterable<Modul> getDozentMoeglicheFaecherByID(@RequestParam UUID aID) {
//		 return mDozentService.getDozentMoeglicheFaecherByID(aID);
//		 
//	 }
//	 
//	 @GetMapping(path="/Get/Dozent/GehalteneFaecher") 
//	 public Iterable<Modul> getDozentGehalteneFaecherByID(@RequestParam UUID aID) {
//		 return mDozentService.getDozentGehalteneFaecherByID(aID);
//		 
//	 }

}
