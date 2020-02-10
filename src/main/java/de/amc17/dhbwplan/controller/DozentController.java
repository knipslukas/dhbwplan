package de.amc17.dhbwplan.controller;

import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import de.amc17.dhbwplan.entity.Dozent;
import de.amc17.dhbwplan.service.DozentService;

@Controller
@RequestMapping(path = "/dozent")

public class DozentController {
	

	@Autowired
	private DozentService mDozentService;

	@PostMapping(path = "/add")
	public String addDozent(@RequestBody Dozent aDozent, Model model) {
		model.addAttribute(mDozentService.addDozent(aDozent));
		model.addAttribute(aDozent); //wenns übergeben werden soll (?)
		
		return "dozentenübersicht";
	}

	@PostMapping(value = "/delete/{aID}")
	public String deleteDozent( Model model, @PathVariable int aID) {
		model.addAttribute(mDozentService.deleteDozent(aID));
		return "";
	}

	@PostMapping(path = "/update/{aID}")
	public String updateDozent(Model model, @PathVariable int aID, @RequestBody Dozent aDozent) {
		aDozent.setDID(aID);
		model.addAttribute( mDozentService.updateDozent(aID, aDozent));
		model.addAttribute(aDozent);
		return "";
	}
	 
	 @GetMapping(path="/getAll") //TO DO other params (?) Faecher etc.
	 public String getAllDozent(Model model, @RequestParam (required = false) String nachname, @RequestParam (required = false) String email) {
		 model.addAllAttributes(mDozentService.getAllDozent(nachname, email));		 
		 return "";
		 
	 }
	 
	 @GetMapping(path="/getEinzelansicht//{aID}") 
	 public String getAllDozent(Model model, @PathVariable int aID) {
		 model.addAttribute(mDozentService.getDozentByID(aID));		 
		 return "";
		 
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
