package com.techelevator.models;

import java.math.BigDecimal;
import java.time.LocalDate;

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
		newUser.setPassword("iamyourfather");
		newUser.setTeacher(true);
		long teachId = userDao.createNewUser(newUser).getUserId();
		
		
		course.setName("Intro to School");
		course.setCapactiy(10);
		course.setDescription("It's a class!");
		course.setFee(new BigDecimal(8));
		course.setStartDate(LocalDate.of(1990, 1, 1));
		course.setEndDate(LocalDate.of(1990, 1, 1));
		course.setTeacherId(teachId);
		course.setSubject("Books");
		
		Course testCourse = courseDao.createNewCourse(course);
		
		
		assert_courses_are_equal(course, courseDao.getCourseById(testCourse.getCourseId()));
		
	}
	
	
	private void assert_courses_are_equal(Course createdCourse, Course returnedCourse) {
		Assert.assertEquals(createdCourse.getCourseId(), returnedCourse.getCourseId());
	}
	
	
	
	
	
}
