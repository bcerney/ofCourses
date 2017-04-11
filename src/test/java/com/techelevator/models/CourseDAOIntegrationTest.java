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





public class CourseDAOIntegrationTest extends DAOIntegrationTest {
	
	private static CourseDAO dao;
	private static UserDAO userDao;
	
	
	@Before
	public void setup(){
		dao = new JDBCCourseDAO(getDataSource());
	}
	
	@Test
	public void create_course_and_make_sure_its_there(){
		Course course = new Course();
		User user = userDao.createNewUser(user);
		
		
		course.setName("Intro to School");
		course.setCapactiy(10);
		course.setDescription("It's a class!");
		course.setFee(new BigDecimal(8));
		course.setStartDate(LocalDate.of(1990, 1, 1));
		course.setEndDate(LocalDate.of(1990, 1, 1));
		course.setUserId(1);
		course.setSubject("Books");
		
		Course testCourse = dao.createNewCourse(course);
		
		
		Assert.assertEquals(course, dao.getCourseById(testCourse.getCourseId()));
	}
	
	
	
	
	
}
