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

import de.amc17.dhbwplan.entity.Studiengang;
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
	public String addStudiengang(@ModelAttribute Studiengang stu, RedirectAttributes redirectAttributes) {
		if (mStudiengangService.addStudiengang(stu) != null) {
			return "redirect:/studiengang/show/"+stu.getSTID();
		}
		else {
			redirectAttributes.addAttribute("studiengangCreated", false);
		}
		return "redirect:/studiengang/getAll/";
	}

	@GetMapping(value = "/delete/{aID}")
	public String deleteStudiengang(RedirectAttributes redirectAttributes, @PathVariable int aID) {
		if (mStudiengangService.deleteStudiengang(aID)) {
			redirectAttributes.addAttribute("studiengangDeleted", true);
		}
		else {
			redirectAttributes.addAttribute("studiengangDeleted", false);
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
		return "redirect:/studiengang/show/"+aStudiengang.getSTID();
	}
	 
	 @GetMapping(path="") 
	 public String getAllStudiengang(Model model, @RequestParam (required = false) String name, 
			 @RequestParam (required = false) String beschreibung, @RequestParam(required = false) Object studiengangDeleted,
			 @RequestParam(required = false) Object studiengangCreated) {
		 
		 model.addAttribute("studiengangList", mStudiengangService.getAllStudiengang(name, beschreibung));
		 model.addAttribute("studiengangDeleted", studiengangDeleted);
		 model.addAttribute("studiengangCreated", studiengangCreated);
		 model.addAttribute("pageTitle", "DHBW - Übersicht Studiengang");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "studiengang/stu_overview";
	 }
	 
	 @GetMapping(path="/show/{aID}") 
	 public String getAllStudiengang(Model model, @PathVariable int aID, @RequestParam(required = false) Object studiengangUpdated) {
		 model.addAttribute("studiengang", mStudiengangService.getStudiengangByID(aID));
		 model.addAttribute("studiengangUpdated", studiengangUpdated);
		 model.addAttribute("pageTitle", "DHBW - Studiengangansicht");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "studiengang/stu_einzel";
		 
	 }
	 
	 @GetMapping(value = "/edit/{dID}")
	 public String editStudiengang(Model model, @PathVariable int dID) {
		 model.addAttribute("studiengang", mStudiengangService.getStudiengangByID(dID));
		 model.addAttribute("pageTitle", "DHBW - Studiengang bearbeiten");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "studiengang/stu_edit";
	 }
	 
	 @GetMapping(value ="/add")
	 public String addStudiengangUi(Model model) {
		 model.addAttribute("pageTitle", "DHBW - Studiengang Anlegen");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "studiengang/stu_add";
	 }

}
