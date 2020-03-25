package de.amc17.dhbwplan.controller;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import de.amc17.dhbwplan.data.StudienLeiterDto;
import de.amc17.dhbwplan.entity.Dozent;
import de.amc17.dhbwplan.entity.User;
import de.amc17.dhbwplan.service.DozentService;
import de.amc17.dhbwplan.service.UserService;

@Controller
@RequestMapping(path = "/user")
public class UserController {
	
	@Autowired
	UserService userServ;
	
	@Autowired
	DozentService dozServ;
	
	@PostMapping(value="add")
	public String addUser(RedirectAttributes rediAttr, @ModelAttribute StudienLeiterDto nUser) {
		if (nUser.getPwd_1().equals(nUser.getPwd_2())) {
			Dozent doz = dozServ.getDozentByID((int) nUser.getDozID());
			if (doz != null) {
				User user = userServ.createUser(nUser.getUsername(), doz.getEmail(), nUser.getPwd_1(), doz);
				if (user != null) {
					doz.setUser(user);
					dozServ.updateDozent(doz);
					return "redirect:/user/show/"+user.getId();
				}
				rediAttr.addAttribute("addUser", 0);
				return "redirect:/user/add";
			}
			rediAttr.addAttribute("addUser", 1);
			return "redirect:/user/add";
		}
		rediAttr.addAttribute("addUser", 2);
		return "redirect:/user/add";
	}
	
	@PostMapping(value = "changepwd/{id}")
	public String changePwd(RedirectAttributes rediAttr, @ModelAttribute StudienLeiterDto nUser, @PathVariable(value = "id") long id) {
		if (nUser.getPwd_1().equals(nUser.getPwd_2())) {
			User user;
			if ((user = userServ.updatePwd(id, nUser.getPwd_old(), nUser.getPwd_1(), nUser.getPwd_2())) != null) {
				if (user.getPassword() != null) {
					rediAttr.addAttribute("changePwd", 0);
					return "redirect:/user/show/"+id;
				}
				rediAttr.addAttribute("changePwd", 1);
				return "redirect:/user/show/"+id;
			}
			rediAttr.addAttribute("changePwd", 2);
			return "redirect:/user/show/"+id;
		}
		rediAttr.addAttribute("changePwd", 3);
		return "redirect:/user/show/"+id;
	}
	
	@GetMapping(value="show/{id}")
	public String getUser(Model model, @PathVariable int id, @PathParam(value = "deleteUser") String deleteUser, @PathParam(value = "changePwd") String changePwd) {
		if (userServ.getUserByID(id) != null) {
			if (userServ.getUserByID(id) == userServ.getCurrentUser()) {
				model.addAttribute("ownUser", true);
			}
			model.addAttribute("user", userServ.getUserByID(id));
			model.addAttribute("dozent", userServ.getUserByID(id).getDozent());
		}
		else model.addAttribute("error", true);
		model.addAttribute("deleteUser", deleteUser);
		model.addAttribute("changePwd", changePwd);
		model.addAttribute("currentUser", userServ.getCurrentUser());
		model.addAttribute("pageTitle", "DHBW - User");
		return "user/usr_einzel";
	}
	
	@GetMapping(value = "show")
	public String getUsers(Model model, @PathParam(value = "deleteUser") String deleteUser) {
		model.addAttribute("userList", userServ.getAllUsers());
		model.addAttribute("pageTitle", "DHBW - User Übersicht");
		model.addAttribute("deleteUser", deleteUser);
		model.addAttribute("currentUser", userServ.getCurrentUser());
		return "user/usr_overview";
	}
	
	@GetMapping(value = "add")
	public String addUser(Model model, @PathParam(value = "addUser") String addUser) {
		model.addAttribute("pageTitle", "DHBW - User anlegen");
		model.addAttribute("currentUser", userServ.getCurrentUser());
		model.addAttribute("dozentList", dozServ.getAllDozentForUser());
		model.addAttribute("addUser", addUser);
		return "user/usr_add";
	}
	
	@GetMapping(value = "delete/{id}")
	public String deleteUser(RedirectAttributes redirAttrib, @PathVariable int id) {
		if (userServ.getUserCount() == 1) {
			redirAttrib.addAttribute("deleteUser", "2");
			return "redirect:/user/show/"+id;
		}
		else if (userServ.deleteUser(id)) {
			redirAttrib.addAttribute("deleteUser", "1");
			return "redirect:/user/show";
		}
		else redirAttrib.addAttribute("deleteUser", "1");
		return "redirect:/user/show/"+id;
	}
	
}
