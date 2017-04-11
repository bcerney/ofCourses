package com.techelevator.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
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
		
		return "redirect:/login/register";
	}
	
	@RequestMapping(path={"/login/login"}, method=RequestMethod.GET)
	public String displayLoginPage() {
		return "login/login";
	}
}
