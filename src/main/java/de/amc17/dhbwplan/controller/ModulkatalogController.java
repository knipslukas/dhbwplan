package de.amc17.dhbwplan.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
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
import de.amc17.dhbwplan.entity.Modulkatalog;
import de.amc17.dhbwplan.service.DozentService;
import de.amc17.dhbwplan.service.UserService;

public class ModulkatalogController {
	
	@Autowired
	private ModulkatalogService mModulkatalogService;
	
	@Autowired
	private UserService userServ;
	
	@GetMapping(value ="")
	public String redirectMain() {
		return "redirect:/modulkatalog/getAll";
	}
	
	@PostMapping(path = "/add") 
	public String addModulkatalog(@ModelAttribute Modulkatalog mk, RedirectAttributes redirectAttributes) {
		if (mModulkatalogService.addModulkatalog(mk) != null) {
			return "redirect:/modulkatalog/show/"+mk.getMKID();
		}
		else {
			redirectAttributes.addAttribute("modulkatalogCreated", false);
		}
		return "redirect:/modulkatalog/getAll/";
	}
	
	@GetMapping(value = "/delete/{aID}")
	public String deleteModulkatalog(RedirectAttributes redirectAttributes, @PathVariable int aID) {
		if (mModulkatalogService.deleteModulkatalog(aID)) {
			redirectAttributes.addAttribute("modulkatalogDeleted", true);
		}
		else {
			redirectAttributes.addAttribute("modulkatalogDeleted", false);
		}
		return "redirect:/modulkatalog/getAll";
	}
	
	@PostMapping(path = "/update/{aID}")
	public String updateModulkatalog(RedirectAttributes redirectAttributes, @ModelAttribute Modulkatalog aModulkatalog) {
		if (mModulkatalogService.updateModulkatalog(aModulkatalog)) {
			redirectAttributes.addAttribute("modulkatalogUpdated", true);
		}
		else {
			redirectAttributes.addAttribute("modulkatalogUpdated", false);
		}
		return "redirect:/modulkatalog/show/"+aModulkatalog.getMKID();
	}
	
	 @GetMapping(path="/show/{aID}") 
	 public String getAllModulkatalog(Model model, @PathVariable int aID, @RequestParam(required = false) Object modulkatalogUpdated) {
		 model.addAttribute("modulkatalog", mModulkatalogService.getModulkatalogByID(aID));
		 model.addAttribute("modulkatalogUpdated", modulkatalogUpdated);
		 model.addAttribute("pageTitle", "DHBW - Modulkatalogansicht");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "modulkatalog/mk_einzel";
		 
	 }
	
	
	 @GetMapping(path="/getAll") 
	 public String getAllModulkatalog(Model model, @RequestParam (required = false) Date gueltig_von, 
			 @RequestParam (required = false) Date gueltig_bis, @RequestParam(required = false) Object modulkatalogDeleted,
			 @RequestParam(required = false) Object modulkatalogCreated) {
		 
		 model.addAttribute("modulkatalogList", mModulkatalogService.getAllModulkatalog(gueltig_von, gueltig_bis));
		 model.addAttribute("modulkatalogDeleted", modulkatalogDeleted);
		 model.addAttribute("modulkatalogCreated", modulkatalogCreated);
		 model.addAttribute("pageTitle", "DHBW - Übersicht Modulkatalog");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "modulkatalog/mk_overview";
	 }
}
