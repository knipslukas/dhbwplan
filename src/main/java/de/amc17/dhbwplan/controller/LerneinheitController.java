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

import de.amc17.dhbwplan.entity.Lerneinheit;
import de.amc17.dhbwplan.service.LerneinheitService;
import de.amc17.dhbwplan.service.UserService;

@Controller
@RequestMapping(path = "/lerneinheit")

public class LerneinheitController 
{
	@Autowired
	private LerneinheitService mLerneinheitService;
	
	@Autowired
	private UserService userServ;
	
	@PostMapping(path = "/add")
	
	public String addLerneinheit(@ModelAttribute Lerneinheit lee, RedirectAttributes redirectAttributes) 
	{
		if (mLerneinheitService.addLerneinheit(lee) != null) 
		{
			return "redirect:/lerneinheit/show/"+lee.getLEID();
		}
		else 
		{
			redirectAttributes.addAttribute("lerneinheitCreated", false);
		}
		return "redirect:/lerneinheit/getAll/";
	}
	
	@GetMapping(value = "/delete/{aID}")
	
	public String deleteLerneinheit(RedirectAttributes redirectAttributes, @PathVariable int aID) 
	{
		if (mLerneinheitService.deleteLerneinheit(aID)) {
			redirectAttributes.addAttribute("lerneinheitDeleted", true);
		}
		else 
		{
			redirectAttributes.addAttribute("lerneinheitDeleted", false);
		}
		return "redirect:/lerneinheit/getAll";
	}
	
	@PostMapping(path = "/update/{aID}")
	public String updateLerneinheit(RedirectAttributes redirectAttributes, @ModelAttribute Lerneinheit aLerneinheit) 
	{
		if (mLerneinheitService.updateLerneinheit(aLerneinheit)) 
		{
			redirectAttributes.addAttribute("LerneinheitUpdated", true);
		}
		else 
		{
			redirectAttributes.addAttribute("LerneinheitUpdated", false);
		}
		return "redirect:/lerneinheit/show/"+aLerneinheit.getLEID();
	}
	
	@GetMapping(path="") 
	 public String getAllLerneinheit(Model model, @RequestParam (required = false) String aBezeichnung, @RequestParam(required = false) Object lerneinheitDeleted,
			 @RequestParam(required = false) Object lerneinheitCreated) 
	{
		 
		 model.addAttribute("lerneinheitList", mLerneinheitService.getAllLerneinheit(aBezeichnung));
		 model.addAttribute("lerneinheitDeleted", lerneinheitDeleted);
		 model.addAttribute("lerneinheitCreated", lerneinheitCreated);
		 model.addAttribute("pageTitle", "DHBW - Übersicht Lerneinheiten");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "lerneinheit/lee_overview";
	 }
	
	@GetMapping(path="/show/{aID}") 
	 public String getAllLerneinheit(Model model, @PathVariable int aID, @RequestParam(required = false) Object lerneinheitUpdated) 
	{
		 model.addAttribute("lerneinheit", mLerneinheitService.getLerneinheitByID(aID));
		 model.addAttribute("lerneinheitUpdated", lerneinheitUpdated);
		 model.addAttribute("pageTitle", "DHBW - Lerneinheitansicht");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "lerneinheit/lee_einzel";
	 }
	
	@GetMapping(value = "/edit/{aID}")
	 public String editLerneinheit(Model model, @PathVariable int aID) 
	{
		 model.addAttribute("lerneinheit", mLerneinheitService.getLerneinheitByID(aID));
		 model.addAttribute("pageTitle", "DHBW - Lerneinheit bearbeiten");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "lerneinheit/lee_edit";
	 }
	
	@GetMapping(value ="/add")
	 public String addLerneinheitUi(Model model) 
	{
		 model.addAttribute("pageTitle", "DHBW - Lerneinheit Anlegen");
		 model.addAttribute("currentUser", userServ.getCurrentUser());
		 return "lerneinheit/lee_add";
	 }
}
