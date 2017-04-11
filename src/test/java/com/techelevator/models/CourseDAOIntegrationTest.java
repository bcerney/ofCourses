package com.techelevator.models;

import org.junit.Before;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.DAOIntegrationTest;
import com.techelevator.daos.CourseDAO;
import com.techelevator.jdbc.JDBCCourseDAO;

public class CourseDAOIntegrationTest extends DAOIntegrationTest {
	
	private JdbcTemplate jdbcTemplate;
	private static CourseDAO courseDAO; 
	
	@Before
	public void setup(){
		courseDAO = new JDBCCourseDAO(getDataSource());
		jdbcTemplate = new JdbcTemplate(getDataSource());
	}
	
	
	
	
	
	
}
