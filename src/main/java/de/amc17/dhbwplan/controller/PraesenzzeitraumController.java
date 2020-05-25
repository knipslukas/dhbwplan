package de.amc17.dhbwplan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import de.amc17.dhbwplan.entity.Praesenzzeitraum;
import de.amc17.dhbwplan.service.PraesenzzeitraumService;
import de.amc17.dhbwplan.service.UserService;

@Controller
@RequestMapping(path = "/praesenzzeitraum")
public class PraesenzzeitraumController {
	
	@Autowired
	UserService userServ;
	
	@Autowired
	PraesenzzeitraumService przServ;
	
	@PostMapping(value="add")
	public String addPraesenzzeitraum(RedirectAttributes redirectAttributes, @ModelAttribute Praesenzzeitraum aPraesenzzeitraum) {
		if (przServ.addPraesenzzeitraum(aPraesenzzeitraum) != null) {
			return "redirect:/praesenzzeitraum/show/"+aPraesenzzeitraum.getPID();
		}
		else {
			redirectAttributes.addAttribute("praesenzzeitraumCreated", false);
		}
		return "redirect:/praesenzzeitraum/getAll/";
	}
	
	@GetMapping(value = "/delete/{aID}")
	public String deletePraesenzzeitraum(RedirectAttributes redirectAttributes, @PathVariable int aID) {
		if (przServ.deletePraesenzzeitraum(aID)) {
			redirectAttributes.addAttribute("praesenzzeitraumDeleted", true);
		}
		else {
			redirectAttributes.addAttribute("praesenzzeitraumDeleted", false);
		}
		return "redirect:/praesenzzeitraum/getAll";
	}

	@PostMapping(path = "/update/{aID}")
	public String updatePraesenzzeitraum(RedirectAttributes redirectAttributes, @ModelAttribute Praesenzzeitraum aPraesenzzeitraum) {
		if (przServ.updatePraesenzzeitraum(aPraesenzzeitraum)) {
			redirectAttributes.addAttribute("PraesenzzeitraumUpdated", true);
		}
		else {
			redirectAttributes.addAttribute("PraesenzzeitraumUpdated", false);
		}
		return "redirect:/praesenzzeitraum/show/"+aPraesenzzeitraum.getPID();
	}
	 
	 @GetMapping(value="") 
	 public String getAllPraesenzzeitraum(Model model, @RequestParam (required = false) int semester, 
			 @RequestParam (required = false) Date von, @RequestParam(required = false) Date bis, @RequestParam(required = false) Object praesenzzeitraumDeleted,
			 @RequestParam(required = false) Object praesenzzeitraumCreated) {
		 
		 model.addAttribute("praesenzzeitraumList", przServ.getAllPraesenzzeitraum(semester, von, bis));
		 model.addAttribute("praesenzzeitraumDeleted", praesenzzeitraumDeleted);
		 model.addAttribute("praesenzzeitraumCreated", praesenzzeitraumCreated);
		 model.addAttribute("pageTitle", "DHBW - Übersicht Präsenzzeitraum");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "praesenzzeitraum/prz_overview";
	 }
	 
	 @GetMapping(path="/show/{aID}") 
	 public String getPraesenzzeitraumByID(Model model, @PathVariable int aID, @RequestParam(required = false) Object praesenzzeitraumUpdated) {
		 model.addAttribute("praesenzzeitraum", przServ.getPraesenzzeitraumByID(aID));
		 model.addAttribute("praesenzzeitraumUpdated", praesenzzeitraumUpdated);
		 model.addAttribute("pageTitle", "DHBW - Präsenzzeitraumansicht");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "präsenzzeitraum/prz_einzel";
	 }
	
	
}
