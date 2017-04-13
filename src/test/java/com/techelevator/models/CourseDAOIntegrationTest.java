package com.techelevator.models;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.DAOIntegrationTest;
import com.techelevator.daos.CourseDAO;
import com.techelevator.daos.UserDAO;
import com.techelevator.jdbc.JDBCCourseDAO;
import com.techelevator.jdbc.JDBCUserDAO;





public class CourseDAOIntegrationTest extends DAOIntegrationTest {
	
	private static CourseDAO courseDao;
	private static UserDAO userDao;
	
	
	@Before
	public void setup(){
		courseDao = new JDBCCourseDAO(getDataSource());
		userDao = new JDBCUserDAO(getDataSource());
	}
	
	@Test
	public void create_course_and_make_sure_its_there(){
		Course course = new Course();
		
		User newUser = new User();
		newUser.setFirstName("Anakin");
		newUser.setLastName("Skywalker");
		newUser.setEmail("dvader@deathstar.com");
		newUser.setUserType("teacher");
		long teachId = userDao.createNewUser(newUser, "password").getUserId();
		
		
		course.setName("Intro to School");
		course.setCapacity(10);
		course.setDescription("It's a class!");
		course.setFee(new BigDecimal(8).setScale(2));
		course.setStartDate(LocalDate.of(1990, 1, 1));
		course.setEndDate(LocalDate.of(1990, 1, 1));
		course.setTeacherId(teachId);
		course.setSubject("Books");
		
		Course testCourse = courseDao.createNewCourse(course);
		
		
		assert_courses_are_equal(course, courseDao.getCourseById(testCourse.getCourseId()));
		
	}
	
	
	private void assert_courses_are_equal(Course createdCourse, Course returnedCourse) {
		Assert.assertEquals(createdCourse.getCourseId(), returnedCourse.getCourseId());
		Assert.assertEquals(createdCourse.getName(), returnedCourse.getName());
		Assert.assertEquals(createdCourse.getCapacity(), returnedCourse.getCapacity());
		Assert.assertEquals(createdCourse.getDescription(), returnedCourse.getDescription());
		Assert.assertEquals(createdCourse.getFee(), returnedCourse.getFee());
		Assert.assertEquals(createdCourse.getStartDate(), returnedCourse.getStartDate());
		Assert.assertEquals(createdCourse.getEndDate(), returnedCourse.getEndDate());
		Assert.assertEquals(createdCourse.getTeacherId(), returnedCourse.getTeacherId());
		Assert.assertEquals(createdCourse.getSubject(), returnedCourse.getSubject());
	}
	
	@Test
	public void get_Courses_By_Teacher_Returns_Proper_Courses() {

		Course course = new Course();

		User newUser = new User();
		newUser.setFirstName("Anakin");
		newUser.setLastName("Skywalker");
		newUser.setEmail("dvader@deathstar.com");
		newUser.setUserType("teacher");
		long teachId = userDao.createNewUser(newUser, "password").getUserId();


		course.setName("Intro to School");
		course.setCapacity(10);
		course.setDescription("It's a class!");
		course.setFee(new BigDecimal(8));
		course.setStartDate(LocalDate.of(1990, 1, 1));
		course.setEndDate(LocalDate.of(1990, 1, 1));
		course.setTeacherId(teachId);
		course.setSubject("Books");

		Course testCourse = courseDao.createNewCourse(course);
		
		course.setName("Intro to School Part 2");
		course.setCapacity(10);
		course.setDescription("It's still a class!");
		course.setFee(new BigDecimal(8));
		course.setStartDate(LocalDate.of(1990, 1, 1));
		course.setEndDate(LocalDate.of(1990, 1, 1));
		course.setTeacherId(teachId);
		course.setSubject("Books");

		Course testCourse1 = courseDao.createNewCourse(course);
		
		ArrayList <Course> teacherCourses = new ArrayList<>();
		teacherCourses = courseDao.getCoursesByTeacherId(teachId);
		
		Assert.assertEquals(teacherCourses.size(), 2);
		Assert.assertEquals(testCourse.getDescription(), testCourse1.getDescription());
	}
}
