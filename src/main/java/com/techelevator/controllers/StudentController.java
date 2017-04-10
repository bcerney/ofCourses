package com.techelevator.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@RequestMapping(path={"/dashboard"}, method=RequestMethod.GET)
	public String displayStudentDashboard() {
		return "student/dashboard";
	}

}
