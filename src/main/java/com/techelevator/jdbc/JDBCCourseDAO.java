package com.techelevator.jdbc;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.daos.CourseDAO;
import com.techelevator.models.Course;

@Component
public class JDBCCourseDAO extends JDBCDAO implements CourseDAO {
	
	@Autowired
	public JDBCCourseDAO(DataSource dataSource) {
		super(dataSource);
	}

	@Override
	public void createNewCourse(Course course) {
		String sqlCreateCourse = "INSERT INTO courses (courseId, name, capacity, description, fee, startDate, endDate, userId, subject) VALUES (?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sqlCreateCourse, course.getCourseId(), course.getName(), course.getCapactiy(), course.getDescription(), course.getFee(), course.getStartDate(), course.getEndDate(), course.getUserId(), course.getSubject());
	}

	@Override
	public Course getCourseById(long id) {
		Course course = null;
		String sqlGetCourseById = "SELECT * FROM courses WHERE courseId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetCourseById);
		if(results.next()) {
			course = mapRowToCourse(results);
		}
		return course;
	}
	
	private Course mapRowToCourse(SqlRowSet results) {
		Course aCourse = new Course();
		aCourse.setCourseId(results.getLong("courseId"));
		aCourse.setName(results.getString("courseName"));
		aCourse.setCapactiy(results.getLong("capacity"));
		aCourse.setDescription(results.getString("description"));
		aCourse.setFee(results.getBigDecimal("fee"));
		aCourse.setStartDate(results.getDate("startDate").toLocalDate());
		aCourse.setEndDate(results.getDate("endDate").toLocalDate());
		aCourse.setUserId(results.getLong("userId"));
		aCourse.setSubject(results.getString("subject"));
		return aCourse;
	}
	
	private long getNextUserId() {
		return super.getNextId("seq_courseId");
	}
}
