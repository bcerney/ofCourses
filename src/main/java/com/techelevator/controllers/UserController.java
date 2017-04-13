package com.techelevator.controllers;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.daos.CourseDAO;
import com.techelevator.daos.UserDAO;
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
	
	private UserDAO userDAO;
	private CourseDAO courseDAO;
	
	@Autowired
	public UserController(UserDAO userDAO, CourseDAO courseDAO) {
		this.userDAO = userDAO;
		this.courseDAO = courseDAO;
	}
	
	
	@RequestMapping(path={"/studentDashboard"}, method=RequestMethod.GET)
	public String displayStudentDashboard(HttpServletRequest request, ModelMap model) {
		User currentUser = (User) model.get("currentUser");
		ArrayList <Course> studentCourses = courseDAO.getCoursesByUserId(currentUser.getUserId());
		System.out.println(currentUser.getFirstName());
		request.setAttribute("studentsCourses", studentCourses);
		return "user/studentDashboard";
	}
	
	
	@RequestMapping(path={"/teacherDashboard"}, method=RequestMethod.GET)
	public String displayTeacherDashboard(HttpServletRequest request, ModelMap model) {
		User currentUser = (User) model.get("currentUser");
		ArrayList <Course> userCourses = courseDAO.getCoursesByTeacher(currentUser.getUserId());
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
									   @NumberFormat(pattern="#.##")
									   @RequestParam BigDecimal courseFee,
									   @RequestParam("startDate")
									   @DateTimeFormat(pattern="MM/dd/yyyy")
									   LocalDate startDate,
									   @RequestParam("endDate")
									   @DateTimeFormat(pattern="MM/dd/yyyy")
									   LocalDate endDate,
									   @RequestParam String subject,
									   @RequestParam("courseDifficulty") String courseDifficulty,
									   ModelMap model) {
		
		User currentUser = (User) model.get("currentUser");
		Course courseToCreate = new Course(currentUser.getUserId(), courseName, courseCapacity, courseDescription, courseFee, startDate, endDate, subject, courseDifficulty);
		Course createdCourse = courseDAO.createNewCourse(courseToCreate);
		
		if (createdCourse != null) {
			request.setAttribute("createdCourseId", createdCourse.getCourseId());
			return "redirect:/user/courseDetail";
		} else {
			return "redirect:/user/createCourse";
		}
	}
	
	
	
	@RequestMapping(path={"/courseDetail"}, method=RequestMethod.GET)
	public String displayCourseDetail() {
		return "user/courseDetail";
	}
	
	
	
	
	
}
