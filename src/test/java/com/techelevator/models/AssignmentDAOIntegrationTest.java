package com.techelevator.models;

import java.math.BigDecimal;
import java.time.LocalDate;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.techelevator.DAOIntegrationTest;
import com.techelevator.daos.AssignmentDAO;
import com.techelevator.daos.CourseDAO;
import com.techelevator.daos.LessonDAO;
import com.techelevator.daos.ModuleDAO;
import com.techelevator.daos.UserDAO;
import com.techelevator.jdbc.JDBCAssignmentDAO;
import com.techelevator.jdbc.JDBCCourseDAO;
import com.techelevator.jdbc.JDBCLessonDAO;
import com.techelevator.jdbc.JDBCModuleDAO;
import com.techelevator.jdbc.JDBCUserDAO;


public class AssignmentDAOIntegrationTest extends DAOIntegrationTest {
	
	private static AssignmentDAO assignmentDao;
	private static LessonDAO lessonDao;
	private static CourseDAO courseDao;
	private static ModuleDAO moduleDao;
	private static UserDAO userDao;
	
	@Before
	public void setup() {
		userDao = new JDBCUserDAO(getDataSource());
		courseDao = new JDBCCourseDAO(getDataSource());
		moduleDao =  new JDBCModuleDAO(getDataSource());
		lessonDao = new JDBCLessonDAO(getDataSource());
		assignmentDao = new JDBCAssignmentDAO(getDataSource());
		
	}
	
	@Test
	public void create_assignment_and_make_sure_its_there() {
		
		User newUser = new User();
		
		newUser.setFirstName("Anakin");
		newUser.setLastName("Skywalker");
		newUser.setEmail("dvader@deathstar.com");
		newUser.setPassword("iamyourfather");
		newUser.setUserType("teacher");
		long teachId = userDao.createNewUser(newUser).getUserId();
		
		Course course = new Course();
		
		course.setName("Intro to School");
		course.setCapactiy(10);
		course.setDescription("It's a class!");
		course.setFee(new BigDecimal(8).setScale(2));
		course.setStartDate(LocalDate.of(1990, 1, 1));
		course.setEndDate(LocalDate.of(1990, 1, 1));
		course.setTeacherId(teachId);
		course.setSubject("Books");
		
		long courseId = courseDao.createNewCourse(course).getCourseId();
		
		Module newModule = new Module();
		newModule.setName("Test");
		newModule.setDescription("It's a test!");
		newModule.setCourseId(courseId);
		long moduleId = moduleDao.createNewModule(newModule).getModuleId();
		
		Lesson newLesson = new Lesson();
		newLesson.setDescription("It's a lesson!");
		newLesson.setName("Lesson");
		newLesson.setModuleId(moduleId);
		long lessonId = lessonDao.createNewLesson(newLesson).getLessonId();
		
		Assignment newAssignment = new Assignment();
		newAssignment.setAssignDate(LocalDate.of(1990, 1, 1));
		newAssignment.setDescription("It's an assignment");
		newAssignment.setDueDate(LocalDate.of(1990, 1, 1));
		newAssignment.setLessonId(lessonId);
		newAssignment.setMaxScore(10);
		newAssignment.setName("Assignment");
		Assignment testAssignment = assignmentDao.createNewAssignment(newAssignment);
		
		assert_assignments_are_equal(newAssignment, assignmentDao.getAssignmentbyAssignmentId(testAssignment.getAssignmentId()));
	}
	
	private void assert_assignments_are_equal(Assignment createdAssignment, Assignment returnedAssignment) {
		Assert.assertEquals(createdAssignment.getAssignDate(), returnedAssignment.getAssignDate());
	}
	
	
}
