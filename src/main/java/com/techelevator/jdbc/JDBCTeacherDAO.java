package com.techelevator.jdbc;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.daos.TeacherDAO;
import com.techelevator.models.Teacher;

@Component
public class JDBCTeacherDAO implements TeacherDAO {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCTeacherDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void createNewTeacher(Teacher teacher) {
		String sqlCreateTeacher = "INSERT INTO teachers (teacherId, firstName, lastName, email, password) VALUES (?,?,?,?,?)";
		jdbcTemplate.update(sqlCreateTeacher, teacher.getTeacherId(), teacher.getFirstName(), teacher.getLastName(), teacher.getEmail(), teacher.getPassword());
		
	}

	@Override
	public Teacher getTeacherById(long id) {
		Teacher teacher = null;
		String sqlGetTeacherById = "SELECT * FROM teachers WHERE teacherId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetTeacherById, id);
		if(results.next()) {
			teacher = mapRowToTeacher(results);
		}
		return teacher;
	}

	private Teacher mapRowToTeacher(SqlRowSet results) {
		Teacher aTeacher = new Teacher();
		aTeacher.setTeacherId(results.getLong("teacherId"));
		aTeacher.setFirstName(results.getString("firstName"));
		aTeacher.setLastName(results.getString("lastName"));
		aTeacher.setEmail(results.getString("email"));
		aTeacher.setPassword(results.getString("password"));
		return aTeacher;
	}
	
}
