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

import de.amc17.dhbwplan.entity.Kurs;
import de.amc17.dhbwplan.service.KursService;
import de.amc17.dhbwplan.service.UserService;

@Controller
@RequestMapping(path = "/kurs")

public class KursController {

	@Autowired
	private KursService mKursService;

	@Autowired
	private UserService userServ;

	@PostMapping(path = "/add")
	public String addKurs(@ModelAttribute Kurs kurs, RedirectAttributes redirectAttributes) {
		if (mKursService.addKurs(kurs) != null) {
			return "redirect:/kurs/show/" + kurs.getKID();
		} else {
			redirectAttributes.addAttribute("kursCreated", false);
		}
		return "redirect:/kurs/getAll/";
	}

	@GetMapping(value = "/delete/{aID}")
	public String deleteKurs(RedirectAttributes redirectAttributes, @PathVariable int aID) {
		if (mKursService.deleteKurs(aID)) {
			redirectAttributes.addAttribute("kursDeleted", true);
		} else {
			redirectAttributes.addAttribute("kursDeleted", false);
		}
		return "redirect:/kurs/getAll";
	}

	@PostMapping(path = "/update/{aID}")
	public String updateKurs(RedirectAttributes redirectAttributes, @ModelAttribute Kurs aKurs) {
		if (mKursService.updateKurs(aKurs)) {
			redirectAttributes.addAttribute("kursUpdated", true);
		} else {
			redirectAttributes.addAttribute("kursUpdated", false);
		}
		return "redirect:/kurs/show/" + aKurs.getKID();
	}

	@GetMapping(path = "")
	public String getAllKurs(Model model, @RequestParam(required = false) String name,
			@RequestParam(required = false) Object kursDeleted, @RequestParam(required = false) Object kursCreated) {

		model.addAttribute("kursList", mKursService.getAllKurs());
		model.addAttribute("kursDeleted", kursDeleted);
		model.addAttribute("kursCreated", kursCreated);
		model.addAttribute("pageTitle", "DHBW - Übersicht Kurse");
		model.addAttribute("currentUser", userServ.getCurrentUser());
		return "kurs/kurs_overview";
	}

	@GetMapping(path = "/show/{aID}")
	public String getAllKurs(Model model, @PathVariable int aID, @RequestParam(required = false) Object kursUpdated) {
		model.addAttribute("kurs", mKursService.getKursByID(aID));
		model.addAttribute("kursUpdated", kursUpdated);
		model.addAttribute("pageTitle", "DHBW - Kursansicht");
		model.addAttribute("currentUser", userServ.getCurrentUser());
		return "kurs/kurs_einzel";

	}

	@GetMapping(value = "/edit/{dID}")
	public String editKurs(Model model, @PathVariable int dID) {
		model.addAttribute("kurs", mKursService.getKursByID(dID));
		model.addAttribute("pageTitle", "DHBW - Kurs bearbeiten");
		model.addAttribute("currentUser", userServ.getCurrentUser());
		return "kurs/kurs_edit";
	}

	@GetMapping(value = "/add")
	public String addKursUi(Model model) {
		model.addAttribute("pageTitle", "DHBW - Kurs Anlegen");
		model.addAttribute("currentUser", userServ.getCurrentUser());
		return "kurs/kurs_add";
	}

}