package com.techelevator.controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.jdbc.JDBCCourseDAO;
import com.techelevator.models.Course;
import com.techelevator.models.User;

@Controller
@SessionAttributes("currentUser")
@RequestMapping("/user")
public class UserController {
	
//	@RequestMapping(path="#", method=RequestMethod.POST)
//	public String displayUserDashboard(@RequestParam String email,
//										@RequestParam String password,
//										ModelMap model) {
//		if (userDAO.searchForEmailAndPassword(email, password)) {
//			//return user model
//			model.put("currentUser", userModel);
//			if (userModel.isTeacher()) {
//				return "redirect:/user/"+userId+"/teacherDashboard";
//			} else {
//				return "redirect:/user/"+userId+"/studentDashboard";
//			}
//		} else {
//			return "redirect:/login";
//		}
//	}
	@Autowired JDBCCourseDAO courseDao;
	
	@RequestMapping(path={"/studentDashboard"}, method=RequestMethod.GET)
	public String displayStudentDashboard(ModelMap model) {
		User currentUser = (User) model.get("currentUser");
		
		System.out.println(currentUser.getFirstName());
		return "user/studentDashboard";
	}
	
	
	@RequestMapping(path={"/teacherDashboard"}, method=RequestMethod.GET)
	public String displayTeacherDashboard(HttpServletRequest request, ModelMap model) {
		User currentUser = (User) model.get("currentUser");
		System.out.println(currentUser.getFirstName());
		ArrayList <Course> userCourses = courseDao.getCoursesByTeacher(currentUser.getUserId());
		//TODO: should I be able to access currentUser through session scope with adding to HTTP request
		request.setAttribute("user", currentUser);
		request.setAttribute("userCourses", userCourses);
		return "user/teacherDashboard";
	}
	
	@RequestMapping(path={"/createCourse"}, method=RequestMethod.GET)
	public String displayCreateCourse() {
		return "user/createCourse";
	}
	
	@RequestMapping(path={"/createCourse"}, method=RequestMethod.POST)
	public String submitCreateCourse(HttpServletRequest request,
									   @RequestParam String courseName,
									   @RequestParam long courseCapacity,
									   @RequestParam String courseDescription,
									   @RequestParam String courseFee,
									   @RequestParam String startDate,
									   @RequestParam String endDate,
									   ModelMap model) {
		
		
		return "user/createCourse";
	}
	
	
	
	@RequestMapping(path={"/courseDetail"}, method=RequestMethod.GET)
	public String displayCourseDetail() {
		return "user/courseDetail";
	}
	
	
}
