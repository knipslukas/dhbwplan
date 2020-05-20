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

import de.amc17.dhbwplan.entity.Vorlesung;
import de.amc17.dhbwplan.service.UserService;
import de.amc17.dhbwplan.service.VorlesungService;

@Controller
@RequestMapping(path = "/vorlesung")

public class VorlesungController {
	
	
	
	@Autowired
	private VorlesungService mVorlesungService;
	
	@Autowired
	private UserService userServ;
	
	@PostMapping(path = "/add")
	public String addVorlesung(@ModelAttribute Vorlesung vol, RedirectAttributes redirectAttributes) {
		if (mVorlesungService.addVorlesung(vol) != null) {
			return "redirect:/vorlesung/show/"+vol.getVID();
		}
		else {
			redirectAttributes.addAttribute("vorlesungCreated", false);
		}
		return "redirect:/vorlesung/getAll/";
	}

	@GetMapping(value = "/delete/{aID}")
	public String deleteVorlesung(RedirectAttributes redirectAttributes, @PathVariable int aID) {
		if (mVorlesungService.deleteVorlesung(aID)) {
			redirectAttributes.addAttribute("vorlesungDeleted", true);
		}
		else {
			redirectAttributes.addAttribute("vorlesungDeleted", false);
		}
		return "redirect:/vorlesung/getAll";
	}

	@PostMapping(path = "/update/{aID}")
	public String updateVorlesung(RedirectAttributes redirectAttributes, @ModelAttribute Vorlesung aVorlesung) {
		if (mVorlesungService.updateVorlesung(aVorlesung)) {
			redirectAttributes.addAttribute("VorlesungUpdated", true);
		}
		else {
			redirectAttributes.addAttribute("VorlesungUpdated", false);
		}
		return "redirect:/Vorlesung/show/"+aVorlesung.getVID();
	}
	 
	 @GetMapping(value="") 
	 public String getAllVorlesung(Model model, @RequestParam (required = false) String name, 
			 @RequestParam (required = false) int vorlesungsstunden, @RequestParam(required = false) Object vorlesungDeleted,
			 @RequestParam(required = false) Object vorlesungCreated) {
		 
		 model.addAttribute("vorlesungList", mVorlesungService.getAllVorlesung(name, vorlesungsstunden));
		 model.addAttribute("vorlesungDeleted", vorlesungDeleted);
		 model.addAttribute("vorlesungCreated", vorlesungCreated);
		 model.addAttribute("pageTitle", "DHBW - Übersicht Vorlesungen");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "vorlesung/vol_overview";
	 }
	 
	 @GetMapping(path="/show/{aID}") 
	 public String getAllVorlesung(Model model, @PathVariable int aID, @RequestParam(required = false) Object vorlesungUpdated) {
		 model.addAttribute("vorlesung", mVorlesungService.getVorlesungByID(aID));
		 model.addAttribute("vorlesungUpdated", vorlesungUpdated);
		 model.addAttribute("pageTitle", "DHBW - Vorlesungsansicht");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "vorlesung/vol_einzel";
		 
	 }
	 
	 @GetMapping(value = "/edit/{dID}")
	 public String editVorlesung(Model model, @PathVariable int vID) {
		 model.addAttribute("vorlesung", mVorlesungService.getVorlesungByID(vID));
		 model.addAttribute("pageTitle", "DHBW - Vorlesung bearbeiten");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "vorlesung/vol_edit";
	 }
	 
	 @GetMapping(value ="/add")
	 public String addVorlesungUi(Model model) {
		 model.addAttribute("pageTitle", "DHBW - Vorlesung Anlegen");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "vorlesung/vol_add";
	 }

}
