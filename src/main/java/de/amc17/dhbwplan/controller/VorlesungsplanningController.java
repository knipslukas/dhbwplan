package de.amc17.dhbwplan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import de.amc17.dhbwplan.data.KursDto;
import de.amc17.dhbwplan.entity.Kurs;
import de.amc17.dhbwplan.service.KursService;
import de.amc17.dhbwplan.service.StudienrichtungService;
import de.amc17.dhbwplan.service.UserService;

@Controller
@RequestMapping(path = "/vorlesungsplaner")
public class VorlesungsplanningController {

	@Autowired
	private UserService userServ;
	
	@Autowired
	private KursService kursServ;
	
	@Autowired
	private StudienrichtungService sturiServ;
	
	@GetMapping(value = "") 
	public String getOverview(Model model){
		model.addAttribute("pageTitle", "DHBW - Vorlesungsplaner");
		model.addAttribute("currentUser", userServ.getCurrentUser());
		return "vorlesungsplaner/volplan_overview";
	}
	
	@PostMapping(value = "kurse", consumes = "application/json", produces = "application/json")
	@ResponseBody
	public List<Kurs> getAllKurse(@RequestBody KursDto dto) {
		return kursServ.getAllKursByStudRichId(sturiServ.getStudienrichtungByID(dto.getStudienrichtung_riid()));
	}
}
