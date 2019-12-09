package de.amc17.dhbwplan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/")
public class DefaultController {
	
	@GetMapping(value = "")
	public String landingPage(Model model) {
		model.addAttribute("pageTitle", "DHBW Vorlesungsplanungstool");
		return "landingpage";
	}

}
