package de.amc17.dhbwplan.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import de.amc17.dhbwplan.data.SturiDto;
import de.amc17.dhbwplan.entity.Dozent;
import de.amc17.dhbwplan.entity.Praesenzzeitraum;
import de.amc17.dhbwplan.entity.Studiengang;
import de.amc17.dhbwplan.entity.Studienrichtung;
import de.amc17.dhbwplan.service.DozentService;
import de.amc17.dhbwplan.service.StudiengangService;
import de.amc17.dhbwplan.service.StudienrichtungService;
import de.amc17.dhbwplan.service.UserService;

@Controller
@RequestMapping(path = "/studiengang")

public class StudiengangController {

	@Autowired
	private StudiengangService mStudiengangService;

	@Autowired
	private StudienrichtungService mStudienrichtungService;

	@Autowired
	private UserService userServ;

	@PostMapping(path = "/add")
	public String addStudiengang(@ModelAttribute Studiengang studg, RedirectAttributes redirectAttributes) {
		if (mStudiengangService.addStudiengang(studg) != null) {
			return "redirect:/studiengang/show/" + studg.getStID();
		} else {
			redirectAttributes.addAttribute("studiengangCreated", false);
		}
		return "redirect:/studiengang/";
	}

	@GetMapping(value = "/delete/{aID}")
	public String deleteStudiengang(RedirectAttributes redirectAttributes, @PathVariable int aID) {
		if (mStudiengangService.deleteStudiengang(aID)) {
			redirectAttributes.addAttribute("StudiengangDeleted", true);
		} else {
			redirectAttributes.addAttribute("StudiengangDeleted", false);
		}
		return "redirect:/studiengang";
	}

	@PostMapping(path = "/update/{aID}")
	public String updateStudiengang(RedirectAttributes redirectAttributes, @PathVariable int aID,
			@ModelAttribute Studiengang aStudiengang) {
		aStudiengang.setStID(aID);
		if (mStudiengangService.updateStudiengang(aStudiengang)) {
			redirectAttributes.addAttribute("studiengangUpdated", true);
		} else {
			redirectAttributes.addAttribute("studiengangUpdated", false);
		}
		return "redirect:/studiengang/show/" + aStudiengang.getStID();
	}

	@GetMapping(path = "")
	public String getAllStudiengang(Model model, @RequestParam(required = false) String name,
			@RequestParam(required = false) Object StudiengangDeleted,
			@RequestParam(required = false) Object StudiengangCreated) {
		model.addAttribute("studiengangList", mStudiengangService.getAllStudiengangs(name));
		model.addAttribute("studiengangDeleted", StudiengangDeleted);
		model.addAttribute("studiengangCreated", StudiengangCreated);
		model.addAttribute("pageTitle", "DHBW - Übersicht Studiengang");
		model.addAttribute("currentUser", userServ.getCurrentUser());
		return "studiengang/studg_overview";
	}

	@GetMapping(path = "/show/{aID}")
	public String getAllStudiengang(Model model, @PathVariable int aID,
			@RequestParam(required = false) Object StudiengangUpdated) {
		model.addAttribute("studiengang", mStudiengangService.getStudiengangByID(aID));
		model.addAttribute("studiengangUpdated", StudiengangUpdated);
		model.addAttribute("pageTitle", "DHBW - Studiengangansicht");
		model.addAttribute("currentUser", userServ.getCurrentUser());
		return "studiengang/studg_einzel";

	}

	@GetMapping(value = "/edit/{dID}")
	public String editStudiengang(Model model, @PathVariable int dID) {
		model.addAttribute("studiengang", mStudiengangService.getStudiengangByID(dID));
		model.addAttribute("pageTitle", "DHBW - Studiengang bearbeiten");
		model.addAttribute("currentUser", userServ.getCurrentUser());
		return "studiengang/studg_edit";
	}

	@GetMapping(value = "/add")
	public String addStudiengangUi(Model model) {
		model.addAttribute("pageTitle", "DHBW - Studiengang Anlegen");
		model.addAttribute("currentUser", userServ.getCurrentUser());
		return "studiengang/studg_add";
	}

	@GetMapping(value = "/showAllSturi")
	public String getAllSturi(Model model, @RequestParam(required = false) String name,
			@RequestParam(required = false) Object sturiDeleted, @RequestParam(required = false) Object sturiCreated) {

		model.addAttribute("sturiList", mStudienrichtungService.getAllStudienrichtung(name));
		model.addAttribute("sturiDeleted", sturiDeleted);
		model.addAttribute("sturiCreated", sturiCreated);
		model.addAttribute("pageTitle", "DHBW - Übersicht Studienrichtung");
		model.addAttribute("currentUser", userServ.getCurrentUser());
		return "studiengang/studg_einzel";
	}

	@PostMapping(value = "/deleteSturi/{rID}")
	@ResponseBody
	public boolean deleteSturi(RedirectAttributes redirectAttributes, @PathVariable int rID) {
		if (mStudienrichtungService.deleteStudienrichtung(rID)) {
			redirectAttributes.addAttribute("sturiDeleted", true);
			return true;
		} else {
			redirectAttributes.addAttribute("sturiDeleted", false);
			return false;
		}
		
	}

	@PostMapping(path = "/updateSturi/{aID}")
	public String updateSturi(RedirectAttributes redirectAttributes, @ModelAttribute Studienrichtung aSturi) {
		if (mStudienrichtungService.updateStudienrichtung(aSturi)) {
			redirectAttributes.addAttribute("SturiUpdated", true);
		} else {
			redirectAttributes.addAttribute("SturiUpdated", false);
		}
		return "redirect:/studiengang/show/" + aSturi.getriID();
	}

	@PostMapping(value = "/addSturi", produces = "application/json", consumes = "application/json")
	@ResponseBody
	public SturiDto addStudienrichtung(@RequestBody SturiDto sturi) {
		Studienrichtung studienrichtung = new Studienrichtung();
		Studiengang studiengang = mStudiengangService.getStudiengangByID(sturi.getStid());
		studienrichtung.setName(sturi.getName());
		studienrichtung.setStudiengang(studiengang);
		if (mStudienrichtungService.addStudienrichtung(studienrichtung) != null) {
			return sturi;
		}
		return null;
	}
	

	@GetMapping(value = "/getSturi/{stid}", produces = "application/json")
	@ResponseBody
	public List<Studienrichtung> getAllStudienrichtung(@PathVariable int stid) {
		return mStudiengangService.getAllSturi(stid);
	}
	
	@GetMapping(value = "/getAllSTG", produces = "application/json")
	@ResponseBody
	public List<SturiDto> getAllStudiengang() {
		List<SturiDto> list = new ArrayList<SturiDto>();
		for(Studiengang stuga : mStudiengangService.getAllStuga()) {
			for(Studienrichtung sturi : stuga.getStudienrichtung()) {
				SturiDto temp = new SturiDto();
				temp.setName(sturi.getName());
				temp.setStudiengang(stuga.getName());
				temp.setRiID(sturi.getriID());
				temp.setStid(stuga.getStID());
				list.add(temp);
			}
		}
		return list;
	}
	
	
}
