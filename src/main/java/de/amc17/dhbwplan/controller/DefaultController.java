package de.amc17.dhbwplan.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import de.amc17.dhbwplan.data.StudienLeiterDto;
import de.amc17.dhbwplan.entity.Dozent;
import de.amc17.dhbwplan.entity.User;
import de.amc17.dhbwplan.service.DozentService;
import de.amc17.dhbwplan.service.UserService;

@Controller
@RequestMapping(value = "/")
public class DefaultController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private DozentService dozServ;
	
	private static final Logger LOG = LogManager.getLogger(UserService.class.getName());
	
	@GetMapping(value = "")
	public String landingPage(Model model) {
		model.addAttribute("pageTitle", "DHBW Planner | Home");
		model.addAttribute("displayName", userServ.getCurrentUser().getDisplayName());
		return "landingpage";
	}
	
	@GetMapping(value = "login")
	public String loginPage(Model model) {
		model.addAttribute("pageTitle", "DHBW Planner | Login");
		return "login";
	}
	
	@RequestMapping(value="/usrlgt", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/login?logout";
	}
	
	@GetMapping(value = "adminInstall")
	public String adminInstallPage() {
		if (!userServ.findAdmin()) {
			return "adminInstall";
		}
		else return "redirect:/login";		
	}
	
	@PostMapping(value = "adminInstallSubmit")
	public String adminInstallSubmit(@ModelAttribute StudienLeiterDto dto, Model model) {
		if (!userServ.findAdmin()) {
			if (dto.getEmail() != "" && dto.getPwd() != "") {
				try {
					Dozent dozent = new Dozent();
					dozent.setNachname(dto.getNachname());
					dozent.setVorname(dto.getVorname());
					dozent.setEmail(dto.getEmail());
					dozent.setAnrede(dto.getAnrede());
					dozent.setIntern(true);
					dozent.setStudiengangsleiter(true);
					dozent.setUnternehmen("DHBW Intern");
					if ((dozent = dozServ.addDozent(dozent)) != null) {
						User user;
						if ((user=userServ.createUser("admin", dto.getEmail(), dto.getPwd(), dozent)) != null) {
							dozent.setUser(user);
							dozServ.updateDozent(dozent);
							model.addAttribute("submit", true);
							return "adminInstall";
						}
					}
				} catch (Exception e) {
					LOG.warn(e);
				}
			}
		}
		return "redirect:/login";
	}

}
