package com.techelevator.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.daos.UserDAO;
import com.techelevator.models.User;

@Controller
@SessionAttributes("currentUser")
public class HomeController {
	
	private UserDAO userDAO;
	
	@Autowired
	public HomeController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@RequestMapping(path={"/", "/home"}, method=RequestMethod.GET)
	public String displayHomePage() {
		return "home";
	}
	
	@RequestMapping(path={"/login/register"}, method=RequestMethod.GET)
	public String displayRegistrationPage() {
		return "login/register";
	}
	
	@RequestMapping(path={"/login/register"}, method=RequestMethod.POST)
	public String submitRegistration(@RequestParam String firstName,
									 @RequestParam String lastName,
									 @RequestParam String email,
									 @RequestParam String password,
									 @RequestParam String userType) {
		
		if (userDAO.emailAlreadyExists(email)) {
			return "redirect:/login/register";
		} else {
			User registeringUser = new User(firstName, lastName, email, userType);
			User returnedUser = userDAO.createNewUser(registeringUser, password);
			
			return "redirect:/login/login";
		}
	}
	
	@RequestMapping(path={"/login/login"}, method=RequestMethod.GET)
	public String displayLoginPage() {
		return "login/login";
	}
	
	@RequestMapping(path={"/login/login"}, method=RequestMethod.POST)
	public String login(@RequestParam String email,
						@RequestParam String password,
						ModelMap model) {
		
		if(userDAO.userIsAuthenticated(email, password)) {
			User currentUser = userDAO.getUserOnLogin(email, password);
			model.put("currentUser", currentUser);
			if (currentUser.getUserType().equals("teacher")) {
				return "redirect:/user/teacherDashboard";
			} else {
				return "redirect:/user/studentDashboard";
			}
		} else {
			return "redirect:/login/login";
		}
	}
}
