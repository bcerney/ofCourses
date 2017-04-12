package com.techelevator.models;

import java.math.BigDecimal;
import java.time.LocalDate;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.techelevator.DAOIntegrationTest;
import com.techelevator.daos.CourseDAO;
import com.techelevator.daos.ModuleDAO;
import com.techelevator.daos.UserDAO;
import com.techelevator.jdbc.JDBCCourseDAO;
import com.techelevator.jdbc.JDBCModuleDAO;
import com.techelevator.jdbc.JDBCUserDAO;



public class ModuleDAOIntegrationTest extends DAOIntegrationTest {
	
	private static UserDAO userDao;
	private static ModuleDAO moduleDao;
	private static CourseDAO courseDao;
	
	
	@Before
	public void setup() {
		moduleDao = new JDBCModuleDAO(getDataSource());
		courseDao = new JDBCCourseDAO(getDataSource());
		userDao = new JDBCUserDAO(getDataSource());
	}
	
	@Test
	public void confirm_new_module_exists_after_creation(){
		
		
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
		Module testModule = moduleDao.createNewModule(newModule);
		
		assert_modules_are_equal(newModule, moduleDao.getModuleByModuleId(testModule.getModuleId()));
			
	}
	
	
	private void assert_modules_are_equal(Module createdModule, Module returnedModule) {
		
		Assert.assertEquals(createdModule.getCourseId(), returnedModule.getCourseId());
		Assert.assertEquals(createdModule.getDescription(), returnedModule.getDescription());
//		Assert.assertEquals(createdModule.getModuleId(), returnedModule.getModuleId());
		Assert.assertEquals(createdModule.getName(), returnedModule.getName());
		
	}
	
	@Test
	public void get_modules_by_course_id(){
		
		User newUser = new User();
		
		newUser.setFirstName("Anakin");
		newUser.setLastName("Skywalker");
		newUser.setEmail("dvader@deathstar.com");
		newUser.setPassword("iamyourfather");
		newUser.setUserType("Teacher");
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
		
		Module newModule1 = new Module();
		newModule1.setName("Test");
		newModule1.setDescription("It's a test!");
		newModule1.setCourseId(courseId);
		Module testModule1 = moduleDao.createNewModule(newModule1);
		
		Module newModule2 = new Module();
		newModule2.setName("Test");
		newModule2.setDescription("It's a test!");
		newModule2.setCourseId(courseId);
		Module testModule2 = moduleDao.createNewModule(newModule2);
		
		Assert.assertEquals(2, moduleDao.getModulesByCourseId(courseId).size());

		
	}

}
