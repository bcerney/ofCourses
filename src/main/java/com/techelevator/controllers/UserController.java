package com.techelevator.controllers;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.daos.CourseDAO;
import com.techelevator.daos.LessonDAO;
import com.techelevator.daos.ModuleDAO;
import com.techelevator.daos.UserDAO;
import com.techelevator.jdbc.JDBCCourseDAO;
import com.techelevator.models.Course;
import com.techelevator.models.Lesson;
import com.techelevator.models.Module;
import com.techelevator.models.User;

@Controller
@SessionAttributes("currentUser")
public class UserController {
	
	private UserDAO userDAO;
	private CourseDAO courseDAO;
	private ModuleDAO moduleDAO;
	private LessonDAO lessonDAO;
	
	@Autowired
	public UserController(UserDAO userDAO, CourseDAO courseDAO, ModuleDAO moduleDAO, LessonDAO lessonDAO) {
		this.userDAO = userDAO;
		this.courseDAO = courseDAO;
		this.moduleDAO = moduleDAO;
		this.lessonDAO = lessonDAO;
	}
	
	@RequestMapping(path={"/dashboard"}, method=RequestMethod.GET)
	public String displayDashboard(HttpServletRequest request, ModelMap model) {
		User currentUser = (User) model.get("currentUser");
		if (currentUser.getUserType().equals("teacher")) {
			List<Course> userCourses = courseDAO.getCoursesByTeacherId(currentUser.getUserId());
			request.setAttribute("userCourses", userCourses);
			return "user/teacherDashboard";
		} else {
			List<Course> studentCourses = courseDAO.getCoursesByUserId(currentUser.getUserId());
			request.setAttribute("studentsCourses", studentCourses);
			return "user/studentDashboard";
		}
	}

	
	
//	@RequestMapping(path={"/studentDashboard"}, method=RequestMethod.GET)
//	public String displayStudentDashboard(HttpServletRequest request, ModelMap model) {
//		User currentUser = (User) model.get("currentUser");
//		ArrayList <Course> studentCourses = courseDAO.getCoursesByUserId(currentUser.getUserId());
//		request.setAttribute("studentsCourses", studentCourses);
//		return "dashboard";
//	}
//	
//	
//	@RequestMapping(path={"/teacherDashboard"}, method=RequestMethod.GET)
//	public String displayTeacherDashboard(HttpServletRequest request, ModelMap model) {
//		User currentUser = (User) model.get("currentUser");
//		ArrayList <Course> userCourses = courseDAO.getCoursesByTeacherId(currentUser.getUserId());
//		request.setAttribute("userCourses", userCourses);
//		return "dashboard";
//	}
	
	@RequestMapping(path={"/courseCatalog"}, method=RequestMethod.GET)
	public String displyCourseCatalogPage(HttpServletRequest request) {
		List <Course> allCourses = courseDAO.getAllCourses();
		request.setAttribute("allCourses", allCourses);
		
		return "user/courseCatalog";
	}
	
	@RequestMapping(path={"/dashboard/createCourse"}, method=RequestMethod.GET)
	public String displayCreateCourse() {
		return "user/createCourse";
	}
	
	@RequestMapping(path={"/dashboard/createCourse"}, method=RequestMethod.POST)
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
			long courseId = createdCourse.getCourseId();
			request.setAttribute("courseId", courseId);
			return "redirect:/" + courseId;
		} else {
			//TODO: add error message to request
			return "redirect:/createCourse";
		}
	}
	
	@RequestMapping(path={"/dashboard/{courseId}"}, method=RequestMethod.GET)
	public String displayCourseDetail(HttpServletRequest request, 
									  @PathVariable long courseId,
									  ModelMap model) {
		Course course = courseDAO.getCourseById(courseId);	
		User teacher = userDAO.getUserById(course.getTeacherId());
		List <Module> modules = moduleDAO.getModulesByCourseId(courseId);
		request.setAttribute("course", course);
		request.setAttribute("modules", modules);
		request.setAttribute("teacher", teacher);
		return "user/courseDetail";
	}
	

	@RequestMapping(path={"/dashboard/{courseId}/addModule"}, method=RequestMethod.GET)
	public String displayAddModule(HttpServletRequest request, 
									  @PathVariable long courseId,
									  ModelMap model) {
		User currentUser = (User) model.get("currentUser");
		Course course = courseDAO.getCourseById(courseId);
		request.setAttribute("course", course);
		
		if (currentUser.getUserType().equals("teacher")) {
			return "user/addModule";
		} else {
			//TODO: add error message or 403 redirect
			return "redirect:/dashboard/" + courseId;
		}
	}
	
	@RequestMapping(path={"/dashboard/{courseId}/addModule"}, method=RequestMethod.POST)
	public String submitAddModule(HttpServletRequest request, 
									  @PathVariable long courseId,
									  @RequestParam String moduleName,
									  @RequestParam String moduleDescription,
									  ModelMap model) {
		//User currentUser = (User) model.get("currentUser");
		Module moduleToAdd = new Module(moduleName, moduleDescription, courseId);
		Module addedModule = moduleDAO.createNewModule(moduleToAdd);
		
		if (addedModule != null) {
			long moduleId = addedModule.getModuleId();
			return "redirect:/dashboard/"+courseId+"/"+moduleId;
		} else {
			//TODO: if module not added, have error message
			return "redirect:/dashboard/"+courseId+"/addModule";
		}
	}
	
	@RequestMapping(path={"/courseCatalog"}, method=RequestMethod.POST)
	public String enroleStudents(HttpServletRequest request,
								ModelMap model,
								@RequestParam long courseId){
		User currentUser = (User) model.get("currentUser");
		long studentId = currentUser.getUserId();	
		
		if (courseDAO.isCourseFull(courseId) || courseDAO.studentIsEnrolledInCourse(courseId, studentId)) {
			//TODO: add error message
			return "redirect:/dashboard";
		} else {
			userDAO.addUserToCourse(studentId, courseId);
			System.out.println("user id" + studentId + "course id" +courseId);
			
			
			
			return "redirect:/dashboard/"+ courseId;
		}
	}
	
	@RequestMapping(path={"/dashboard/{courseId}/{moduleId}"}, method=RequestMethod.GET)
	public String displayModule(HttpServletRequest request,
								@PathVariable long courseId,
								@PathVariable long moduleId) {
		
		Course course = courseDAO.getCourseById(courseId);
		Module module = moduleDAO.getModuleByModuleId(moduleId);
		
		request.setAttribute("course", course);
		request.setAttribute("module", module);
		
		ArrayList<Lesson> lessons = lessonDAO.getLessonsByModuleId(moduleId);
		if (lessons != null) {
			request.setAttribute("allLessons", lessons);
		}

		if (module.getCourseId() == courseId) {
			return "user/moduleView";
		} else {
			//TODO: add error message or 403 redirect
			return "redirect:/dashboard/"+courseId+"/"+moduleId;
		}
	}
	
	@RequestMapping(path={"/dashboard/{courseId}/{moduleId}/addLesson"}, method=RequestMethod.GET)
	public String displayAddLesson(HttpServletRequest request,
									@PathVariable long courseId,
									@PathVariable long moduleId) {
		
		Course course = courseDAO.getCourseById(courseId);
		Module module = moduleDAO.getModuleByModuleId(moduleId);
		
		request.setAttribute("course", course);
		request.setAttribute("module", module);

		return "user/addLesson";
	}
	
	@RequestMapping(path={"/dashboard/{courseId}/{moduleId}/addLesson"}, method=RequestMethod.POST)
	public String submitAddLesson(HttpServletRequest request,
									@PathVariable long courseId,
									@PathVariable long moduleId,
									@RequestParam String lessonName,
									@RequestParam String lessonDescription) {
		
		Lesson lessonToAdd = new Lesson(lessonName, lessonDescription, moduleId);
		Lesson addedLesson = lessonDAO.createNewLesson(lessonToAdd);
		
		if (addedLesson != null) {
			long lessonId = addedLesson.getLessonId();
			return "redirect:/dashboard/"+courseId+"/"+moduleId+"/"+lessonId;
		} else {
			//TODO: add error message
			return "redirect:/dashboard/"+courseId+"/"+moduleId+"/addLesson";
		}
		
//		Course course = courseDAO.getCourseById(courseId);
//		Module module = moduleDAO.getModuleByModuleId(moduleId);
//		
//		request.setAttribute("course", course);
//		request.setAttribute("module", module);
	}
	
	@RequestMapping(path={"/dashboard/{courseId}/{moduleId}/{lessonId}"}, method=RequestMethod.GET)
	public String displayLessonView(HttpServletRequest request,
									@PathVariable long courseId,
									@PathVariable long moduleId,
									@PathVariable long lessonId) {
		
		Course course = courseDAO.getCourseById(courseId);
		Module module = moduleDAO.getModuleByModuleId(moduleId);
		Lesson lesson = lessonDAO.getLessonByLessonId(lessonId);
		
		request.setAttribute("course", course);
		request.setAttribute("module", module);
		request.setAttribute("lesson", lesson);

		return "user/lessonView";
	}
	
	@RequestMapping(path={"/dashboard/{courseId}/{moduleId}/{lessonId}/addResource"}, method=RequestMethod.GET)
	public String displayAddResource(HttpServletRequest request,
									@PathVariable long courseId,
									@PathVariable long moduleId,
									@PathVariable long lessonId) {
		
		Course course = courseDAO.getCourseById(courseId);
		Module module = moduleDAO.getModuleByModuleId(moduleId);
		Lesson lesson = lessonDAO.getLessonByLessonId(lessonId);
		
		request.setAttribute("course", course);
		request.setAttribute("module", module);
		request.setAttribute("lesson", lesson);

		return "user/addResource";
	}
	
	@RequestMapping(path={"/dashboard/{courseId}/{moduleId}/{lessonId}/addResource"}, method=RequestMethod.POST)
	public String submitAddResource(HttpServletRequest request,
									@PathVariable long courseId,
									@PathVariable long moduleId,
									@PathVariable long lessonId) {
		
		Course course = courseDAO.getCourseById(courseId);
		Module module = moduleDAO.getModuleByModuleId(moduleId);
		Lesson lesson = lessonDAO.getLessonByLessonId(lessonId);
		
		request.setAttribute("course", course);
		request.setAttribute("module", module);
		request.setAttribute("lesson", lesson);

		return "user/addResource";
	}
	
	@RequestMapping(path={"/dashboard/{courseId}/roster"}, method=RequestMethod.GET)
	public String displayClassRoster(HttpServletRequest request,
									@PathVariable long courseId){
		List<User> classRoster = userDAO.getStudentsByCourseId(courseId);
		
		request.setAttribute("roster", classRoster);
		return "user/studentRoster";
	}
}
