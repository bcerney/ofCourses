package com.techelevator.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping(path="#", method=RequestMethod.POST)
	public String displayUserDashboard(@RequestParam String email,
										@RequestParam String password,
										ModelMap model) {
		if (userDAO.searchForEmailAndPassword(email, password)) {
			//return user model
			model.put("currentUser", userModel);
			if (userModel.isTeacher()) {
				return "redirect:/user/"+userId+"/teacherDashboard";
			} else {
				return "redirect:/user/"+userId+"/studentDashboard";
			}
		} else {
			return "redirect:/login";
		}
	}
	
	
}
