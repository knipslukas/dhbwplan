package de.amc17.dhbwplan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import de.amc17.dhbwplan.data.LeeDto;
import de.amc17.dhbwplan.data.ModulDto;
import de.amc17.dhbwplan.data.ModulkatalogDto;
import de.amc17.dhbwplan.entity.Lerneinheit;
import de.amc17.dhbwplan.entity.Modul;
import de.amc17.dhbwplan.service.LerneinheitService;
import de.amc17.dhbwplan.service.ModulService;
import de.amc17.dhbwplan.service.ModulkatalogService;
import de.amc17.dhbwplan.service.UserService;

@Controller
@RequestMapping(path = "/modul")

public class ModulController {

	@Autowired
	private ModulService mModulService;
	

	@Autowired
	private ModulkatalogService mModulkatalogService;

	@Autowired
	private LerneinheitService mLerneinheitService;

	@Autowired
	private UserService userServ;

	@PostMapping(path = "/add")
	public String addModul(@ModelAttribute ModulDto mk, RedirectAttributes redirectAttributes) {
		Modul m = new Modul();
		m.setBezeichnung(mk.getBezeichnung());
		m.setBeschreibung(mk.getBeschreibung());
		m.setEctsPunkte(mk.getEctsPunkte());
		m.setModulart(mk.getModulart());
		m.setModuldauer(mk.getModuldauer());
		m.setPruefungsleistung(mk.getPruefungsleistung());
		m.setSprache(mk.getSprache());
		m.setStudienjahr(mk.getStudienjahr());
		m.setModulkatalog(mModulkatalogService.getModulkatalogByID(mk.getModulkatalogID()));
		Modul mod;
		if ((mod = mModulService.addModul(m)) != null) { 
			return "redirect:/modul/show/" + mod.getMID();
		} else {
			redirectAttributes.addAttribute("modulCreated", false);
		}
		return "redirect:/modul/";
	}

	@GetMapping(value = "/delete/{aID}")
	public String deleteModul(RedirectAttributes redirectAttributes, @PathVariable int aID) {
		if (mModulService.deleteModul(aID)) {
			redirectAttributes.addAttribute("modulDeleted", true);
		} else {
			redirectAttributes.addAttribute("modulDeleted", false);
		}
		return "redirect:/modul/";
	}

	@PostMapping(path = "/update/{aID}")
	public String updateModul(RedirectAttributes redirectAttributes, @ModelAttribute Modul aModul) {
		if (mModulService.updateModul(aModul)) {
			redirectAttributes.addAttribute("modulUpdated", true);
		} else {
			redirectAttributes.addAttribute("modulUpdated", false);
		}
		return "redirect:/modul/show/" + aModul.getMID();
	}

	@GetMapping(path = "")
	public String getAllModul(Model model, @RequestParam(required = false) String bezeichnung,
			@RequestParam(required = false) String modulart, @RequestParam(required = false) Object modulDeleted,
			@RequestParam(required = false) Object modulCreated) {

		model.addAttribute("modulList", mModulService.getAllModul(bezeichnung, modulart));
		model.addAttribute("modulDeleted", modulDeleted);
		model.addAttribute("modulCreated", modulCreated);
		model.addAttribute("pageTitle", "DHBW - Übersicht Module");
		model.addAttribute("currentUser", userServ.getCurrentUser());
		return "modul/mod_overview";
	}

	@GetMapping(path = "/show/{aID}")
	public String getAllModul(Model model, @PathVariable int aID, @RequestParam(required = false) Object modulUpdated) {
		model.addAttribute("leeList", mModulService.getAllLee(aID));
		Modul temp =  mModulService.getModulByID(aID);
		model.addAttribute("modul", temp);
		model.addAttribute("modulkatalog", temp.getModulkatalog());
		model.addAttribute("modulUpdated", modulUpdated);
		model.addAttribute("pageTitle", "DHBW - Modulansicht");
		model.addAttribute("currentUser", userServ.getCurrentUser());
		return "modul/mod_einzel";
	}

	@GetMapping(value = "/edit/{dID}")
	public String editModul(Model model, @PathVariable int dID) {
		model.addAttribute("modul", mModulService.getModulByID(dID));
		model.addAttribute("pageTitle", "DHBW - Modul bearbeiten");
		model.addAttribute("currentUser", userServ.getCurrentUser());
		return "modul/mod_edit";
	}

	@GetMapping(value = "/add")
	public String addModulUi(Model model) {
		model.addAttribute("pageTitle", "DHBW - Modul Anlegen");
		model.addAttribute("currentUser", userServ.getCurrentUser());
		model.addAttribute("modulkatalogList", mModulkatalogService.getAllModulkatalog());
		return "modul/mod_add";
	}

	@PostMapping(value = "/addLEE", produces = "application/json", consumes = "application/json")
	@ResponseBody
	public LeeDto addLerneinheit(@RequestBody LeeDto lee) {
		Lerneinheit lerneinheit = new Lerneinheit();
		Modul modul = mModulService.getModulByID(lee.getModulid());
		lerneinheit.setPräsenzzeit(lee.getPraesenzzeit());
		lerneinheit.setSelbststudium(lee.getSelbststudium());
		lerneinheit.setName(lee.getName());
		lerneinheit.setModul(modul);

		if (mLerneinheitService.addLerneinheit(lerneinheit) != null) {
			return lee;
		}
		return null;
	}

	@GetMapping(value = "/getLEE/{modulid}", produces = "application/json")
	@ResponseBody
	public List<Lerneinheit> getAllLerneinheiten(@PathVariable int modulid) {
		return mModulService.getAllLee(modulid);
	}

	@PostMapping(value = "/deleteLEE/{leeID}")
	@ResponseBody
	public boolean deleteLee(RedirectAttributes redirectAttributes, @PathVariable int leeID) {
		if (mLerneinheitService.deleteLerneinheit(leeID)) {
			redirectAttributes.addAttribute("leeDeleted", true);
			return true;
		} else {
			redirectAttributes.addAttribute("leeDeleted", false);
			return false;
		}
	}
}