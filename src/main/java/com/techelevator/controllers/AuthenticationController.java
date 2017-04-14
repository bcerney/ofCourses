package com.techelevator.controllers;

import javax.servlet.http.HttpSession;

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
public class AuthenticationController {

	private UserDAO userDAO;
	
	@Autowired
	public AuthenticationController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@RequestMapping(path={"/login"}, method=RequestMethod.GET)
	public String displayLoginPage() {
		return "login/login";
	}
	
	@RequestMapping(path={"/login"}, method=RequestMethod.POST)
	public String login(@RequestParam String email,
						@RequestParam String password,
						HttpSession session,
						ModelMap model) {
		
		if(userDAO.userIsAuthenticated(email, password)) {
			session.invalidate();
			User currentUser = userDAO.getUserOnLogin(email, password);
			model.put("currentUser", currentUser);
			// TODO: add isValidRedirect(destination) check
			return "redirect:/dashboard";
		} else {
			return "redirect:/login";
		}
	}

//	private boolean isValidRedirect(String destination) {
//		return destination != null && destination.startsWith("http://localhost");
//	}	
	
	@RequestMapping(path="/user/logout")
    public String logout(HttpSession session, ModelMap model) {
    	session.invalidate();
    	model.remove("currentUser");
    	session.removeAttribute("currentUser");
        return "redirect:/";
    }	
	
}
