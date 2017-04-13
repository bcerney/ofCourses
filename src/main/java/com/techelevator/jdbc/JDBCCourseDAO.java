package com.techelevator.jdbc;

import java.util.ArrayList;
import java.util.List;

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
	public Course createNewCourse(Course course) {
		long id = getNextCourseId();
		String sqlCreateCourse = "INSERT INTO courses (courseId, name, capacity, description, fee, startDate, endDate, teacherId, subject, difficulty) VALUES (?,?,?,?,?,?,?,?,?,?)";
		int rowsAffected = jdbcTemplate.update(sqlCreateCourse, id, course.getName(), course.getCapacity(), course.getDescription(), course.getFee(), course.getStartDate(), course.getEndDate(), course.getTeacherId(), course.getSubject(), course.getDifficulty());
		
		if (rowsAffected == 1) {
			course.setCourseId(id);
			return course;
		} else {
			return null;
		}
	}

	@Override
	public Course getCourseById(long id) {
		Course course = null;
		String sqlGetCourseById = "SELECT * FROM courses WHERE courseId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetCourseById, id);
		if(results.next()) {
			course = mapRowToCourse(results);
		}
		return course;
	}
	
	
	
	private Course mapRowToCourse(SqlRowSet results) {
		Course aCourse = new Course();
		aCourse.setCourseId(results.getLong("courseId"));
		aCourse.setName(results.getString("name"));
		aCourse.setCapacity(results.getLong("capacity"));
		aCourse.setDescription(results.getString("description"));
		aCourse.setFee(results.getBigDecimal("fee"));
		aCourse.setStartDate(results.getDate("startDate").toLocalDate());
		aCourse.setEndDate(results.getDate("endDate").toLocalDate());
		aCourse.setTeacherId(results.getLong("teacherId"));
		aCourse.setSubject(results.getString("subject"));
		aCourse.setDifficulty(results.getString("difficulty"));
		return aCourse;
	}
	
	private long getNextCourseId() {
		return super.getNextId("seq_courseId");
	}

	@Override
	public ArrayList <Course> getCoursesByTeacherId(long teacherId) {
		ArrayList <Course> teacherCourses = new ArrayList<>();
		String sqlGetCoursesByTeacherId = "SELECT * FROM courses WHERE teacherId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetCoursesByTeacherId, teacherId);
		while (results.next()){
			Course nextCourse = mapRowToCourse(results);
			teacherCourses.add(nextCourse);
		}
		return teacherCourses;
	}

	@Override
	public ArrayList <Course> getAllCourses() {
		ArrayList <Course> allCourses = new ArrayList<>();
		String sqlGetAllCourses = "SELECT * FROM courses WHERE startDate >= NOW()";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllCourses);
		while (results.next()) {
			Course nextCourse = mapRowToCourse(results);
			allCourses.add(nextCourse);
		}
		return allCourses;
	}

	@Override
	public ArrayList getCoursesByUserId(long userId) {
		ArrayList <Course> usersCourses = new ArrayList<>();
		String sqlGetAllCoursesByUser = "SELECT * FROM courses JOIN student_course ON courses.courseId = student_course.courseId JOIN users ON users.userId = student_course.studentId WHERE userId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllCoursesByUser, userId);
		while (results.next()) {
			Course nextCourse = mapRowToCourse(results);
			usersCourses.add(nextCourse);
		}
		return usersCourses;
	}
	
	
}
