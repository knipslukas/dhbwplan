package de.amc17.dhbwplan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import de.amc17.dhbwplan.service.UserService;

@Controller
@RequestMapping(path = "/user")
public class UserController {
	
	@Autowired
	UserService userServ;

	@GetMapping(value = "settings")
	public String getSettings(Model model) {
		model.addAttribute("pageTitle", "DHBW - Einstellungen");
		model.addAttribute("displayName", userServ.getCurrentUser().getDisplayName());
		return "user/settings";
	}
	
	
}
