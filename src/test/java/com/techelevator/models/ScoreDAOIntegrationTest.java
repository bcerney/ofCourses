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
import com.techelevator.daos.ResourceDAO;
import com.techelevator.daos.ScoreDAO;
import com.techelevator.daos.UserDAO;
import com.techelevator.jdbc.JDBCAssignmentDAO;
import com.techelevator.jdbc.JDBCCourseDAO;
import com.techelevator.jdbc.JDBCLessonDAO;
import com.techelevator.jdbc.JDBCModuleDAO;
import com.techelevator.jdbc.JDBCResourceDAO;
import com.techelevator.jdbc.JDBCScoreDAO;
import com.techelevator.jdbc.JDBCUserDAO;



public class ScoreDAOIntegrationTest extends DAOIntegrationTest {

	private static ScoreDAO scoreDao;
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
	scoreDao = new JDBCScoreDAO(getDataSource());	
	}
	
	@Test
	public void create_score_and_get_it() {
		
	User newUser = new User();
		
	newUser.setFirstName("Anakin");
	newUser.setLastName("Skywalker");
	newUser.setEmail("dvader@deathstar.com");
	newUser.setUserType("teacher");
	long teachId = userDao.createNewUser(newUser, "password").getUserId();

	Course course = new Course();

	course.setName("Intro to School");
	course.setCapacity(10);
	course.setDescription("It's a class!");
	course.setFee(new BigDecimal(8).setScale(2));
	course.setStartDate(LocalDate.of(1990, 1, 1));
	course.setEndDate(LocalDate.of(1990, 1, 1));
	course.setTeacherId(teachId);
	course.setSubject("Books");
	course.setDifficulty("easy");

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
	long assignmentId = assignmentDao.createNewAssignment(newAssignment).getAssignmentId();
	
	Score newScore = new Score();
	newScore.setScore(5);
	newScore.setStudentId(teachId);
	newScore.setAssignmentId(assignmentId);
	Score testScore = scoreDao.createScore(newScore);
	
	assert_scores_are_equal(newScore, scoreDao.getScoreForStudentByAssignmentId(testScore.getStudentId(), testScore.getAssignmentId()));
	
	}
	
	private void assert_scores_are_equal(Score createdScore, Score returnedScore){
		Assert.assertEquals(createdScore.getScore(), returnedScore.getScore());
	}
}
