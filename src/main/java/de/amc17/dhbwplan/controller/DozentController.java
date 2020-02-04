package de.amc17.dhbwplan.controller;

import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	@ResponseBody
	public Dozent addDozent(@RequestBody Dozent aDozent) {
		return mDozentService.addDozent(aDozent.getDID(), aDozent);
	}

	@PostMapping(value = "/delete/{aID}")
	@ResponseBody
	public Dozent deleteDozent(@PathVariable int aID) {
		return mDozentService.deleteDozent(aID);
	}

	@PostMapping(path = "/update/{aID}")
	@ResponseBody
	public Dozent updateDozent(@PathVariable int aID, @RequestBody Dozent aDozent) {
		aDozent.setDID(aID);
		return mDozentService.updateDozent(aID, aDozent);
	}
	 
	 @GetMapping(path="/getAll") 
	 @ResponseBody
	 public Iterable<Dozent> getAllDozent() {
		 return mDozentService.getAllDozent();
		 
	 }
	 
	 @GetMapping(path="/getByID/{aID}") // (path= "/{aID}") ??
	 @ResponseBody
	 public Dozent getDozentByID(@PathVariable int aID) {
		 return mDozentService.getDozentByID(aID);
	 }
//	 
//	 @GetMapping(path="/get/Dozent/Nachname") 
//	 public String getDozentNachnameByID(@RequestParam UUID aID) {
//		 return mDozentService.getDozentNachnameByID(aID);
//		 
//	 }
//	 
//	 @GetMapping(path="/Get/Dozent/Email") 
//	 public String getDozentEmailByID(@RequestParam UUID aID) {
//		 return mDozentService.getDozentEmailByID(aID);
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
