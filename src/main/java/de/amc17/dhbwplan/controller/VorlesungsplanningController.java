package de.amc17.dhbwplan.controller;

import java.util.ArrayList;
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
import de.amc17.dhbwplan.data.VorlesungsplanDto;
import de.amc17.dhbwplan.entity.Kurs;
import de.amc17.dhbwplan.entity.Modul;
import de.amc17.dhbwplan.entity.Modulkatalog;
import de.amc17.dhbwplan.service.KursService;
import de.amc17.dhbwplan.service.ModulkatalogService;
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
	
	@Autowired
	private ModulkatalogService modulkServ;
	
	@GetMapping(value = "") 
	public String getOverview(Model model){
		model.addAttribute("pageTitle", "DHBW - Vorlesungsplaner");
		model.addAttribute("currentUser", userServ.getCurrentUser());
		model.addAttribute("sturiList", sturiServ.getAllStudienrichtung(""));
		return "vorlesungsplaner/volplan_overview";
	}
	
	@PostMapping(value = "kurse", consumes = "application/json", produces = "application/json")
	@ResponseBody
	public List<KursDto> getAllKurse(@RequestBody KursDto dto) {
		List<Kurs> kurse = kursServ.getAllKursByStudRichId(sturiServ.getStudienrichtungByID(dto.getStudienrichtung_riid())); 
		List<KursDto> dtos = new ArrayList<KursDto>();
		for(Kurs kurs: kurse) {
			KursDto kursdto = new KursDto();
			kursdto.setKid(kurs.getKID());
			kursdto.setName(kurs.getName());
			kursdto.setJahrgang(kurs.getJahrgang());
			dtos.add(kursdto);
		}
		return dtos;
	}
	
	@PostMapping(value = "jahr", consumes = "application/json")
	@ResponseBody
	public List<Modul> getOverview(@RequestBody VorlesungsplanDto dto) {
		Kurs kurs = kursServ.getKursByID(dto.getKid());		
		Modulkatalog modkat = modulkServ.getModulkatalogByYear(kurs.getJahrgang(), kurs.getStudienrichtung());
		List<Modul> module = modkat.getModul();
		List<Modul> outputMod = new ArrayList<Modul>();
		for (Modul modul : module) {
			if (modul.getStudienjahr() == dto.getStudienjahr()) {
				outputMod.add(modul);
			}
		}
		return outputMod;
	}
}
