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

import com.techelevator.MailSender;
import com.techelevator.daos.AssignmentDAO;
import com.techelevator.daos.CourseDAO;
import com.techelevator.daos.LessonDAO;
import com.techelevator.daos.ModuleDAO;
import com.techelevator.daos.StudentAssignmentDAO;
import com.techelevator.daos.ResourceDAO;
import com.techelevator.daos.UserDAO;
import com.techelevator.jdbc.JDBCCourseDAO;
import com.techelevator.models.Assignment;
import com.techelevator.models.Course;
import com.techelevator.models.Lesson;
import com.techelevator.models.Module;

import com.techelevator.models.StudentAssignment;
import com.techelevator.models.Submission;
import com.techelevator.models.Resource;
import com.techelevator.models.User;

@Controller
@SessionAttributes("currentUser")
public class UserController {

	private UserDAO userDAO;
	private CourseDAO courseDAO;
	private ModuleDAO moduleDAO;
	private LessonDAO lessonDAO;
	private StudentAssignmentDAO studentAssignmentDAO;
	private ResourceDAO resourceDAO;
	private AssignmentDAO assignmentDAO;

	@Autowired
	public UserController(UserDAO userDAO, CourseDAO courseDAO, ModuleDAO moduleDAO, LessonDAO lessonDAO,
			ResourceDAO resourceDAO, AssignmentDAO assignmentDAO, StudentAssignmentDAO studentAssignmentDAO) {

		this.userDAO = userDAO;
		this.courseDAO = courseDAO;
		this.moduleDAO = moduleDAO;
		this.lessonDAO = lessonDAO;
		this.studentAssignmentDAO = studentAssignmentDAO;
		this.resourceDAO = resourceDAO;
		this.assignmentDAO = assignmentDAO;
	}

	@RequestMapping(path = { "/dashboard" }, method = RequestMethod.GET)
	public String displayDashboard(HttpServletRequest request, ModelMap model) {
		User currentUser = (User) model.get("currentUser");
		
		if (currentUser == null) {
			return "redirect:/login";
		}
		
		if (currentUser.getUserType().equals("teacher")) {
			List<Course> teacherCourses = courseDAO.getCoursesByTeacherId(currentUser.getUserId());
			request.setAttribute("teacherCourses", teacherCourses);
			return "user/teacherDashboard";
		} else {
			List<Course> studentCourses = courseDAO.getCoursesByUserId(currentUser.getUserId());
			request.setAttribute("studentsCourses", studentCourses);
			return "user/studentDashboard";
		}
	}

	// @RequestMapping(path={"/studentDashboard"}, method=RequestMethod.GET)
	// public String displayStudentDashboard(HttpServletRequest request,
	// ModelMap model) {
	// User currentUser = (User) model.get("currentUser");
	// ArrayList <Course> studentCourses =
	// courseDAO.getCoursesByUserId(currentUser.getUserId());
	// request.setAttribute("studentsCourses", studentCourses);
	// return "dashboard";
	// }
	//
	//
	// @RequestMapping(path={"/teacherDashboard"}, method=RequestMethod.GET)
	// public String displayTeacherDashboard(HttpServletRequest request,
	// ModelMap model) {
	// User currentUser = (User) model.get("currentUser");
	// ArrayList <Course> userCourses =
	// courseDAO.getCoursesByTeacherId(currentUser.getUserId());
	// request.setAttribute("userCourses", userCourses);
	// return "dashboard";
	// }

	@RequestMapping(path = { "/courseCatalog" }, method = RequestMethod.GET)
	public String displyCourseCatalogPage(HttpServletRequest request) {
		List<Course> allCourses = courseDAO.getAllCourses();
		request.setAttribute("allCourses", allCourses);

		return "user/courseCatalog";
	}

	@RequestMapping(path = { "/dashboard/createCourse" }, method = RequestMethod.GET)
	public String displayCreateCourse() {
		return "user/createCourse";
	}

	@RequestMapping(path = { "/dashboard/createCourse" }, method = RequestMethod.POST)
	public String submitCreateCourse(HttpServletRequest request, @RequestParam String courseName,
			@RequestParam long courseCapacity, @RequestParam String courseDescription,
			@NumberFormat(pattern = "#.##") @RequestParam BigDecimal courseFee,
			// TODO: date input for Chrome only accepts this DateTimeFormat, can
			// we change?
			@RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate startDate,
			@RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate endDate,
			@RequestParam String subject, @RequestParam("courseDifficulty") String courseDifficulty, ModelMap model) {

		User currentUser = (User) model.get("currentUser");
		Course courseToCreate = new Course(currentUser.getUserId(), courseName, courseCapacity, courseDescription,
				courseFee, startDate, endDate, subject, courseDifficulty);
		Course createdCourse = courseDAO.createNewCourse(courseToCreate);

		if (createdCourse != null) {
			long courseId = createdCourse.getCourseId();
			request.setAttribute("courseId", courseId);
			return "redirect:/dashboard/" + courseId;
		} else {
			// TODO: add error message to request
			return "redirect:/dashboard/createCourse";
		}
	}

	@RequestMapping(path = { "/dashboard/{courseId}" }, method = RequestMethod.GET)
	public String displayCourseDetail(HttpServletRequest request, @PathVariable long courseId, ModelMap model) {
		Course course = courseDAO.getCourseByCourseId(courseId);
		User teacher = userDAO.getUserById(course.getTeacherId());
		List<Module> modules = moduleDAO.getModulesByCourseId(courseId);
		request.setAttribute("course", course);
		request.setAttribute("modules", modules);
		request.setAttribute("teacher", teacher);
		return "user/courseDetail";
	}

	@RequestMapping(path = { "/dashboard/{courseId}/addModule" }, method = RequestMethod.GET)
	public String displayAddModule(HttpServletRequest request, @PathVariable long courseId, ModelMap model) {
		User currentUser = (User) model.get("currentUser");
		Course course = courseDAO.getCourseByCourseId(courseId);
		request.setAttribute("course", course);

		if (currentUser.getUserType().equals("teacher")) {
			return "user/addModule";
		} else {
			// TODO: add error message or 403 redirect
			return "redirect:/dashboard/" + courseId;
		}
	}

	@RequestMapping(path = { "/dashboard/{courseId}/addModule" }, method = RequestMethod.POST)
	public String submitAddModule(HttpServletRequest request, @PathVariable long courseId,
			@RequestParam String moduleName, @RequestParam String moduleDescription, ModelMap model) {
		// User currentUser = (User) model.get("currentUser");
		Module moduleToAdd = new Module(moduleName, moduleDescription, courseId);
		Module addedModule = moduleDAO.createNewModule(moduleToAdd);

		if (addedModule != null) {
			long moduleId = addedModule.getModuleId();
			return "redirect:/dashboard/" + courseId + "/" + moduleId;
		} else {
			// TODO: if module not added, have error message
			return "redirect:/dashboard/" + courseId + "/addModule";
		}
	}

	@RequestMapping(path = { "/courseCatalog" }, method = RequestMethod.POST)
	public String enrollStudents(HttpServletRequest request, ModelMap model, @RequestParam long courseId) {
		User currentUser = (User) model.get("currentUser");
		long studentId = currentUser.getUserId();

		if (courseDAO.isCourseFull(courseId) || courseDAO.studentIsEnrolledInCourse(courseId, studentId)) {
			// TODO: add error message
			return "redirect:/dashboard";
		} else {
			userDAO.addUserToCourse(studentId, courseId);
			System.out.println("User ID " + studentId + " added to Course ID " + courseId);
			
			//TODO: pull this out into its own method (inside controller?)
			List<Module> courseModules = moduleDAO.getModulesByCourseId(courseId);

			 for (Module module : courseModules) {
				 List<Lesson> moduleLessons = lessonDAO.getLessonsByModuleId(module.getModuleId());
				 
				 for (Lesson lesson : moduleLessons) {
					 List<Assignment> lessonAssignments = assignmentDAO.getAssignmentsByLessonId(lesson.getLessonId());
					 
					 for (Assignment assignment : lessonAssignments) {
						 StudentAssignment studentAssignmentToCreate = new StudentAssignment(studentId, assignment.getAssignmentId());
						 studentAssignmentDAO.createStudentAssignment(studentAssignmentToCreate);
					 }
				 }
			 }

			return "redirect:/dashboard/" + courseId;
		}
	}

	@RequestMapping(path = { "/dashboard/{courseId}/{moduleId}" }, method = RequestMethod.GET)
	public String displayModule(HttpServletRequest request, @PathVariable long courseId, @PathVariable long moduleId) {

		Course course = courseDAO.getCourseByCourseId(courseId);
		Module module = moduleDAO.getModuleByModuleId(moduleId);

		request.setAttribute("course", course);
		request.setAttribute("module", module);

		List<Lesson> lessons = lessonDAO.getLessonsByModuleId(moduleId);
		if (lessons != null) {
			request.setAttribute("allLessons", lessons);
		}

		if (module.getCourseId() == courseId) {
			return "user/moduleView";
		} else {
			// TODO: add error message or 403 redirect
			return "redirect:/dashboard/" + courseId + "/" + moduleId;
		}
	}

	@RequestMapping(path = { "/dashboard/{courseId}/{moduleId}/addLesson" }, method = RequestMethod.GET)
	public String displayAddLesson(HttpServletRequest request, @PathVariable long courseId,
			@PathVariable long moduleId) {

		Course course = courseDAO.getCourseByCourseId(courseId);
		Module module = moduleDAO.getModuleByModuleId(moduleId);

		request.setAttribute("course", course);
		request.setAttribute("module", module);

		return "user/addLesson";
	}

	@RequestMapping(path = { "/dashboard/{courseId}/{moduleId}/addLesson" }, method = RequestMethod.POST)
	public String submitAddLesson(HttpServletRequest request, @PathVariable long courseId, @PathVariable long moduleId,
			@RequestParam String lessonName, @RequestParam String lessonDescription) {

		Lesson lessonToAdd = new Lesson(lessonName, lessonDescription, moduleId);
		Lesson addedLesson = lessonDAO.createNewLesson(lessonToAdd);

		if (addedLesson != null) {
			long lessonId = addedLesson.getLessonId();
			return "redirect:/dashboard/" + courseId + "/" + moduleId + "/" + lessonId;
		} else {
			// TODO: add error message
			return "redirect:/dashboard/" + courseId + "/" + moduleId + "/addLesson";
		}

		// Course course = courseDAO.getCourseById(courseId);
		// Module module = moduleDAO.getModuleByModuleId(moduleId);
		//
		// request.setAttribute("course", course);
		// request.setAttribute("module", module);
	}

	@RequestMapping(path = { "/dashboard/{courseId}/{moduleId}/{lessonId}" }, method = RequestMethod.GET)
	public String displayLessonView(HttpServletRequest request,
									ModelMap model,
									@PathVariable long courseId,
									@PathVariable long moduleId, 
									@PathVariable long lessonId) {
		
		User currentUser = (User)model.get("currentUser");
		long studentId = currentUser.getUserId();
		
		Course course = courseDAO.getCourseByCourseId(courseId);
		Module module = moduleDAO.getModuleByModuleId(moduleId);
		Lesson lesson = lessonDAO.getLessonByLessonId(lessonId);
		List<Resource> resources = resourceDAO.getResourcesByLessonId(lessonId);
		List<Assignment> assignments = assignmentDAO.getAssignmentsByLessonId(lessonId);
		List<StudentAssignment> studentAssignments = studentAssignmentDAO.getAllStudentAssignmentsByStudentIdAndLessonId(studentId, lessonId);
		
		request.setAttribute("course", course);
		request.setAttribute("module", module);
		request.setAttribute("lesson", lesson);
		request.setAttribute("allResources", resources);
		request.setAttribute("allAssignments", assignments);
		request.setAttribute("studentAssignments", studentAssignments);
		
		
		request.setAttribute("now", LocalDate.now());
		return "user/lessonView";
	}
	
	@RequestMapping(path = { "/dashboard/{courseId}/{moduleId}/{lessonId}" }, method = RequestMethod.POST)
	public String submitAssignment(HttpServletRequest request,
									ModelMap model, 
									@PathVariable long courseId,
									@PathVariable long moduleId,
									@PathVariable long lessonId,
									@RequestParam long assignmentId,
									@RequestParam String submissionText) {
		
		User currentUser = (User)model.get("currentUser");
		long studentId = currentUser.getUserId();
		long teacherId = courseDAO.getCourseByCourseId(courseId).getTeacherId();

		if (submissionText != null) {
			studentAssignmentDAO.addTextSubmission(studentId, assignmentId, submissionText);
//			MailSender sendMailTeacher = new MailSender(userDAO.getUserById(teacherId).getEmail(), "Homework Submission Notification", "Homework has been submitted by " + currentUser.getFirstName() + " " + currentUser.getLastName());
//			sendMailTeacher.start();
//			studentAssignmentDAO.addFileSubmission();
		}
				
		return "redirect:/dashboard/" + courseId + "/" + moduleId + "/" + lessonId;			
	}
															   
	

	@RequestMapping(path = { "/dashboard/{courseId}/{moduleId}/{lessonId}/addResource" }, method = RequestMethod.GET)
	public String displayAddResource(HttpServletRequest request, @PathVariable long courseId,
			@PathVariable long moduleId, @PathVariable long lessonId) {

		Course course = courseDAO.getCourseByCourseId(courseId);
		Module module = moduleDAO.getModuleByModuleId(moduleId);
		Lesson lesson = lessonDAO.getLessonByLessonId(lessonId);

		request.setAttribute("course", course);
		request.setAttribute("module", module);
		request.setAttribute("lesson", lesson);

		return "user/addResource";
	}

	@RequestMapping(path = { "/dashboard/{courseId}/{moduleId}/{lessonId}/addResource" }, method = RequestMethod.POST)
	public String submitAddResource(HttpServletRequest request, @PathVariable long courseId,
			@PathVariable long moduleId, @PathVariable long lessonId, @RequestParam String resourceTitle,
			@RequestParam String resourceDescription, @RequestParam String resourceUrl) {

		// TODO: proper link being created requires https:// prefix, best way to
		// ensure that?
		
		if (!resourceUrl.startsWith("http://") && !resourceUrl.startsWith("https://")) {
			resourceUrl = "http://" + resourceUrl;
		}
		
		Resource resourceToAdd = new Resource(resourceUrl, resourceDescription, resourceTitle, lessonId);
		Resource createdResource = resourceDAO.createNewResource(resourceToAdd);

		if (createdResource != null) {
			System.out.println("Resource " + createdResource.getTitle() + " successfully added!");
			return "redirect:/dashboard/" + courseId + "/" + moduleId + "/" + lessonId;
		} else {
			// TODO: error message
			return "redirect:/dashboard/" + courseId + "/" + moduleId + "/" + lessonId + "/addResource";
		}
	}

	@RequestMapping(path = { "/dashboard/{courseId}/{moduleId}/{lessonId}/addAssignment" }, method = RequestMethod.GET)
	public String displayAddAssignment(HttpServletRequest request, @PathVariable long courseId,
			@PathVariable long moduleId, @PathVariable long lessonId) {

		Course course = courseDAO.getCourseByCourseId(courseId);
		Module module = moduleDAO.getModuleByModuleId(moduleId);
		Lesson lesson = lessonDAO.getLessonByLessonId(lessonId);

		request.setAttribute("course", course);
		request.setAttribute("module", module);
		request.setAttribute("lesson", lesson);

		return "user/addAssignment";
	}

	@RequestMapping(path = { "/dashboard/{courseId}/{moduleId}/{lessonId}/addAssignment" }, method = RequestMethod.POST)
	public String submitAddAssignment(HttpServletRequest request, 
									  @PathVariable long courseId,
									  @PathVariable long moduleId, 
									  @PathVariable long lessonId, 
									  @RequestParam String assignmentName,
									  @RequestParam String assignmentDescription, 
									  @RequestParam long assignmentMaxScore,
									  // TODO: same issue as course creation, can we fix date string passed w/ data input
									  @RequestParam("assignDate") 
									  @DateTimeFormat(pattern = "yyyy-MM-dd")
									  LocalDate assignDate,
									  @RequestParam("dueDate")
									  @DateTimeFormat(pattern = "yyyy-MM-dd") 
									  LocalDate dueDate) {

		Assignment assignmentToAdd = new Assignment(assignmentName, assignmentDescription, assignDate, dueDate,
				lessonId, assignmentMaxScore);
		Assignment createdAssignment = assignmentDAO.createNewAssignment(assignmentToAdd);

		if (createdAssignment != null) {
			// create student_assignment for assignment and all students already enrolled in the course
			List<User> studentsEnrolledInCourse = userDAO.getStudentsByCourseId(courseId);
			if (studentsEnrolledInCourse.size() > 0) {
				for (User student : studentsEnrolledInCourse) {
					StudentAssignment studentAssignmentToCreate = new StudentAssignment(student.getUserId(), createdAssignment.getAssignmentId());
					StudentAssignment createdStudentAssignment = studentAssignmentDAO.createStudentAssignment(studentAssignmentToCreate);
					System.out.println("Created StudentAssignment for Student ID: " + createdStudentAssignment.getStudentId() + ", Assignment ID: " + createdStudentAssignment.getAssignmentId());
				}
			}
			
			
			return "redirect:/dashboard/" + courseId + "/" + moduleId + "/" + lessonId;
		} else {
			// TODO: add error message
			return "redirect:/dashboard/" + courseId + "/" + moduleId + "/" + lessonId + "/addAssignment";
		}
	}

	@RequestMapping(path = { "/dashboard/{courseId}/roster" }, method = RequestMethod.GET)
	public String displayClassRoster(HttpServletRequest request, @PathVariable long courseId) {
		List<User> classRoster = userDAO.getStudentsByCourseId(courseId);
		Course course = courseDAO.getCourseByCourseId(courseId);

		request.setAttribute("course", course);
		request.setAttribute("roster", classRoster);

		return "user/studentRoster";
	}

	@RequestMapping(path = { "/dashboard/{courseId}/roster/{userId}" }, method = RequestMethod.GET)
	public String displayStudentGrades(HttpServletRequest request, 
									   @PathVariable long courseId,
									   @PathVariable long userId) {
//		List<StudentAssignment> studentGrades = studentAssignmentDAO
//				.getAllStudentAssignmentsByStudentIdAndCourseId(userId, courseId);
//		List<Assignment> assignments = assignmentDAO.getAssignmentsByStudentIdAndCourseId(userId, courseId);
//		

		List<Module> courseModules = moduleDAO.getModulesByCourseId(courseId);
		List<Submission> currentUserSubmissions = new ArrayList<Submission>();
		User currentUser = userDAO.getUserById(userId);
		
		for (Module module : courseModules) {
			 List<Lesson> moduleLessons = lessonDAO.getLessonsByModuleId(module.getModuleId());
			 
			 for (Lesson lesson : moduleLessons) {
				 List<Assignment> lessonAssignments = assignmentDAO.getAssignmentsByLessonId(lesson.getLessonId());
				 
				 for (Assignment assignment : lessonAssignments) {
					 Submission nextSubmission = new Submission();
					 nextSubmission.setLesson(lesson);
					 nextSubmission.setAssignment(assignment);
					 
					 StudentAssignment studentAssignment = studentAssignmentDAO.getStudentAssignmentByStudentIdAndAssignmentId(currentUser.getUserId(), assignment.getAssignmentId());
					 nextSubmission.setStudentAssignment(studentAssignment);
//					 System.out.println(studentAssignment.getScore() + studentAssignment.getAssignmentId());
					 currentUserSubmissions.add(nextSubmission);
				 }
			 }
		 }
//		User user = userDAO.getUserById(userId);
//		Course course = courseDAO.getCourseById(courseId);
//		
//		request.setAttribute("assignments", assignments);
//		request.setAttribute("studentGrades", studentGrades);
//		request.setAttribute("user", user);
//		request.setAttribute("course", course);
//		System.out.println(assignments.size());
//		System.out.println(studentGrades.size());
//		
		request.setAttribute("user", currentUser);
		request.setAttribute("submissions", currentUserSubmissions);
		return "user/studentGrades";
	}
	
	//TODO: going another route with displaying course progress, student clicks through on dashboard link
//	@RequestMapping(path={"/dashboard/progress"}, method=RequestMethod.GET)
//	public String displayStudentCourseProgress(HttpServletRequest request, ModelMap model) {
//		
//		User currentUser = (User) model.get("currentUser");
//		List<Course> currentUserCourses = courseDAO.getCoursesByUserId(currentUser.getUserId());
//		
//		request.setAttribute("currentUserCourses", currentUserCourses);
//		
//		return "user/studentCourseProgress";
//	}
	
	@RequestMapping(path={"/dashboard/{courseId}/{userId}/progress"}, method=RequestMethod.GET)
	public String displayStudentCourseProgress(HttpServletRequest request,
											   @PathVariable long courseId,
											   ModelMap model) {
		
		User currentUser = (User) model.get("currentUser");
		List<Submission> currentUserSubmissions = getSubmissionsByStudentIdAndCourseId(currentUser.getUserId(), courseId);
		//TODO: finish and implement method
		//int currentCoursePercentage = calculateGradedAssignmentPercentage(currentUserSubmissions);
		
		request.setAttribute("course", courseDAO.getCourseByCourseId(courseId));
		request.setAttribute("submissions", currentUserSubmissions);
		
		return "user/studentCourseProgress";
	}
	
	private List<Submission> getSubmissionsByStudentIdAndCourseId(long studentId, long courseId) {
		List<Submission> currentUserSubmissions = new ArrayList<Submission>();
		List<Module> courseModules = moduleDAO.getModulesByCourseId(courseId);

		for (Module module : courseModules) {
			 List<Lesson> moduleLessons = lessonDAO.getLessonsByModuleId(module.getModuleId());
			 
			 for (Lesson lesson : moduleLessons) {
				 List<Assignment> lessonAssignments = assignmentDAO.getAssignmentsByLessonId(lesson.getLessonId());
				 
				 for (Assignment assignment : lessonAssignments) {
					 Submission nextSubmission = new Submission();
					 nextSubmission.setLesson(lesson);
					 nextSubmission.setAssignment(assignment);
					 
					 StudentAssignment studentAssignment = studentAssignmentDAO.getStudentAssignmentByStudentIdAndAssignmentId(studentId, assignment.getAssignmentId());
					 nextSubmission.setStudentAssignment(studentAssignment);
					 
					 currentUserSubmissions.add(nextSubmission);
				 }
			 }
		 }
		
		return currentUserSubmissions;
	}
	
//	private int calculateGradedAssignmentPercentage(List<Submission> submissionList) {
//		int combinedScores = 0;
//		int combinedMaxScores = 0;
//		
//		for (Submission submission : submissionList) {
//			if (submission.getStudentAssignment().getScore())
//		}
//	}
	
	
	@RequestMapping(path = {"/dashboard/{courseId}/roster/{userId}"}, method = RequestMethod.POST)
	public String gradeAssignment(HttpServletRequest request, 
								  @RequestParam long assignmentId, 
								  @RequestParam long assignmentGrade, 
								  @PathVariable long userId, 
								  @PathVariable long courseId){

	studentAssignmentDAO.gradeAssignment(userId, assignmentId, assignmentGrade);
	
	return "redirect:/dashboard/" + courseId + "/roster/" + userId;
	
	} 
	
	
	
	
}
